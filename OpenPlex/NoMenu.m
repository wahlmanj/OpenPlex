/*!
 --  OpenPlex 0.4.2
 --
 --  Originally designed by iCyberGhost on 5/02/14.
 --  Originally coded by Wahlman.j on 5/02/14.
 Copyright (c) 2015 CyberGhost & Wahlman.j. All rights reserved.
 */

#import "ApplicationDelegate.h"
#import "NoMenu.h"

@interface NoMenu ()
@property (assign) IBOutlet NSWindow *window;
@end
@implementation NoMenu
@synthesize darkModeOn,dark;
@synthesize guideIP,guideURL,updateButton,statusImage,statusButton;
// @synthesize macIP,certURL,mainIP;

-(id)init{
    
    self=[super initWithWindowNibName:@"NoMenu"];
    if(self)
    {
        //perform any initializations
    }
    return self;
    
    
    
}

- (void)refreshDarkMode {
    
    NSString * value = (__bridge NSString *)(CFPreferencesCopyValue((CFStringRef)@"AppleInterfaceStyle", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost));
    if ([value isEqualToString:@"Dark"]) {
        darkModeOn = YES;
    }
    else {
        darkModeOn = NO;
    }
    if (darkModeOn==YES) {
        dark.title=@"On";
    } else {
        dark.title=@"Off";
    }
}

- (IBAction)dark:(id)sender{
    [self refreshDarkMode];
    darkModeOn = !darkModeOn;
    
    //Change pref
    if (darkModeOn) {
        CFPreferencesSetValue((CFStringRef)@"AppleInterfaceStyle", @"Dark", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    }
    else {
        CFPreferencesSetValue((CFStringRef)@"AppleInterfaceStyle", NULL, kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    }
    
    //update listeners
    dispatch_async(dispatch_get_main_queue(), ^{
        CFNotificationCenterPostNotification(CFNotificationCenterGetDistributedCenter(), (CFStringRef)@"AppleInterfaceThemeChangedNotification", NULL, NULL, YES);
    });
    [self refreshDarkMode];
}

-(id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
    }
    return self;
    
    
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [self refreshDarkMode];
    NSDictionary *version = [NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    NSString *productVersion = [version objectForKey:@"ProductVersion"];
    NSString *shortProductVersion = [productVersion substringWithRange:NSMakeRange(3, [productVersion length]-3)];
    //    NSLog (@"productVersion =========== %@", productVersion);
    float versionNumber = [shortProductVersion floatValue];
    if (versionNumber >= 10) {
        dark.enabled=YES;
    }else{
        dark.enabled=NO;
    }
    
    if (darkModeOn==YES) {
        dark.title=@"On";
        
    } else {
        dark.title=@"Off";
    }
    
    
    if ([self checkForUpdate]==YES){
        updateButton.enabled=YES;
        updateButton.title=@"Update App";
    } else {
        updateButton.enabled=NO;
        updateButton.title=@"No Updates";
    }
    
  //  if ([self checkServerStatus]==YES){
  //      statusText.title=@"Update App";
  //  } else {
  //      statusText.title=@"No Updates";
  //  }
    if ([self checkServerStatus]==NO){
       statusButton.enabled=NO;
//       statusButton.title=@"*returnString2";
    }
    
    //    NSString *setupIP=[[NSString alloc] initWithFormat:@"%@",[self getLocalIPAddress]];
    //    NSString *localIP=[[NSString alloc] initWithFormat:@"Local IP:  %@",[self getLocalIPAddress]];
    //    NSString *certString=[[NSString alloc] initWithFormat:@"Cert URL:  %@/trailers.cer",[self getLocalIPAddress]];
    NSString *guidelocalIP=[[NSString alloc] initWithFormat:@"Local IP :  %@",[self getLocalIPAddress]];
    NSString *guidecertString=[[NSString alloc] initWithFormat:@"Cert URL :  %@/trailers.cer",[self getLocalIPAddress]];
    /*
     
     [mainIP setTitleWithMnemonic:setupIP];
     [mainIP setFont:[NSFont fontWithName:@"Helvetica Neue" size:12]];
     
     [macIP setTitleWithMnemonic:localIP];
     [macIP setFont:[NSFont fontWithName:@"Helvetica Neue" size:12]];
     
     
     [certURL setTitleWithMnemonic:certString];
     [certURL setFont:[NSFont fontWithName:@"Helvetica Neue" size:12]];
     
     */
    [guideIP setTitleWithMnemonic:guidelocalIP];
    [guideIP setFont:[NSFont fontWithName:@"Helvetica Neue" size:14]];
    
    [guideURL setTitleWithMnemonic:guidecertString];
    [guideURL setFont:[NSFont fontWithName:@"Helvetica Neue" size:14]];
}

-(BOOL) checkForUpdate{
    NSDictionary* errorDict;
    NSAppleEventDescriptor* returnDescriptor = NULL;
    NSMutableString *scriptText = [NSMutableString stringWithString:@"set y to missing value\n"];
    [scriptText appendString:@"set x to do shell script \"export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; /usr/bin/appupdatebash.bash\"\n"];
    [scriptText appendString:@"if x is equal to \"Already up-to-date.\" then\n"];
    [scriptText appendString:@"set y to \"NoUpdate\"\n"];
    [scriptText appendString:@"else if x is not equal to \"Already up-to-date.\" then\n"];
    [scriptText appendString:@"set y to \"YesUpdate\"\n"];
    [scriptText appendString:@"end if\n"];

    NSAppleScript* scriptObject = [[NSAppleScript alloc] initWithSource: scriptText];
    returnDescriptor = [scriptObject executeAndReturnError: &errorDict];
    NSString *returnString = [returnDescriptor stringValue];
   // NSLog(@"returnString: %@",returnString);
    
    if ([returnString isEqual:@"NoUpdate"]) {
        return NO;
    } else {
        return YES;
    }
    
}

-(BOOL) checkServerStatus{
    NSDictionary* errorDict;
    NSAppleEventDescriptor *returnDescriptor2 = NULL;
    NSMutableString *scriptText2 = [NSMutableString stringWithString:@"set z to missing value\n"];
    [scriptText2 appendString:@"tell application \"Finder\"\n"];
    [scriptText2 appendString:@"if exists file \"Applications:PlexConnect:PlexConnect.log\" of the startup disk then\n"];
    [scriptText2 appendString:@"try\n"];
    [scriptText2 appendString:@"set z to do shell script \"grep -c 'Shutting' /Applications/PlexConnect/PlexConnect.log\"\n"];
    [scriptText2 appendString:@"end try\n"];
    [scriptText2 appendString:@"if z > 0 then\n"];
    [scriptText2 appendString:@"set z to \"PlexConnect is Not Running\"\n"];
    [scriptText2 appendString:@"else\n"];
    [scriptText2 appendString:@"set z to \"PlexConnect is Running\"\n"];
    [scriptText2 appendString:@"end if\n"];
    [scriptText2 appendString:@"else if not exists file \"Applications:PlexConnect:PlexConnect.log\" of the startup disk then\n"];
    [scriptText2 appendString:@"set z to \"No PlexConnect.Log Detected\"\n"];
    [scriptText2 appendString:@"end if\n"];
    [scriptText2 appendString:@"end tell\n"];
    NSAppleScript* scriptObject2 = [[NSAppleScript alloc] initWithSource: scriptText2];
    returnDescriptor2 = [scriptObject2 executeAndReturnError: &errorDict];
    NSString *returnString2 = [returnDescriptor2 stringValue];
    NSLog(@"returnString2: %@",returnString2);
    
    if ([returnString2 isEqual:@"No PlexConnect.Log Detected"]) {
        return NO;
    }
    if ([returnString2 isEqual:@"PlexConnect is Not Running"]) {
        return NO;
    }
    if ([returnString2 isEqual:@"PlexConnect is Running"]) {
        return NO;
    }
    
 //   [self.statusText setStringValue:NSLocalizedString(@"PlexConnect is running", nil)];
    
    
    //    NSAppleEventDescriptor* returnDescriptor = NULL;

   //  NSMutableString *scriptText = [NSMutableString stringWithString:@"set y to missing value\n"];
   //  [scriptText appendString:@"try\n"];
   //  [scriptText appendString:@"set fileAsPOSIX to (POSIX path of \"/Applications/PlexConnect/PlexConnect.log\")\n"];
    // [scriptText appendString:@"set theString to quoted form of \"Shutting\"\n"];
    // [scriptText appendString:@"set searchResult to do shell script \"/usr/bin/grep -ic \" & theString & space & quoted form of fileAsPOSIX\n"];
    // [scriptText appendString:@"if searchResult is not \"0\" then\n"];
    // [scriptText appendString:@"set y to \"NotRunning\"\n"];
    // [scriptText appendString:@"end if\n"];
    // [scriptText appendString:@"end try\n"];
     
   //  NSAppleScript* scriptObject1 = [[NSAppleScript alloc] initWithSource: scriptText];
   //  returnDescriptor = [scriptObject1 executeAndReturnError: &errorDict];
   //  NSString *returnString1 = [returnDescriptor stringValue];
   //  NSLog(@"ServerString1: %@",returnString1);
 


    
    
    
    //     [scriptText appendString:@"set x to do shell script \"export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; /usr/bin/update.sh\"\n"];
    
    
    
    
    
    
    
    
    //    if ([ServerString2 isEqual:@"Running"]) {
    //        [self.statusImage setImage:[NSImage imageNamed:@"Running"]];
    
    //} else {
    //       [self.statusImage setImage:[NSImage imageNamed:@"NotRunning"]];
    //       [self.statusText setStringValue:NSLocalizedString(@"PlexConnect is not running", nil)];
    
    
    //   if ([returnString isEqual:@"NoUpdate"]) {
    //       updateButton.enabled=NO;
    //       updateButton.title=@"No Updates";
    
    //   } else {
    //      updateButton.enabled=YES;
    //      updateButton.title=@"Update App";
    
    //        return YES;
    //   }
}





- (NSString *)getLocalIPAddress
{
    NSArray *ipAddresses = [[NSHost currentHost] addresses];
    NSArray *sortedIPAddresses = [ipAddresses sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.allowsFloats = NO;
    
    for (NSString *potentialIPAddress in sortedIPAddresses)
    {
        if ([potentialIPAddress isEqualToString:@"127.0.0.1"]) {
            continue;
        }
        
        NSArray *ipParts = [potentialIPAddress componentsSeparatedByString:@"."];
        
        BOOL isMatch = YES;
        
        for (NSString *ipPart in ipParts) {
            if (![numberFormatter numberFromString:ipPart]) {
                isMatch = NO;
                break;
            }
        }
        if (isMatch) {
            return potentialIPAddress;
        }
    }
    
    // No IP found
    return @"?.?.?.?";
}@end