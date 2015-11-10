/*
 --  OpenPlex 0.5
 --
 --  Originally Designed by CyberGhost84 on 5/02/14.
 --  Originally Coded by Wahlman.j on 5/02/14.
 --  Copyright (©) 2015 Wahlman.j, CyberGhost84 & Flipman6 All rights reserved.
 */

#import "ApplicationDelegate.h"
#import "NoMenu.h"

@interface NoMenu ()
@property (assign) IBOutlet NSWindow *window;
@end
@implementation NoMenu
@synthesize darkModeOn,dark;
@synthesize guideIP,guideURL,updateButton,statusImage;
@synthesize loginButtonOutlet,myplexButtonOutlet,settingsButtonOutlet,trailersButtonOutlet,updateButtonOutlet;
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

-(void)windowWillLoad{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkForUpdate) name:@"updateAvailable" object:nil];
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
    
    [self checkForUpdate];
    [self setButtonStatus];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(checkServerStatus) userInfo:nil repeats:YES];

//    [self checkServerStatus];
  //  if ([self checkServerStatus]==YES){
  //      statusText.title=@"Update App";
  //  } else {
  //      statusText.title=@"No Updates";
  //  }
//    if ([self checkServerStatus]==NO){
//       statusButton.enabled=NO;
//       statusButton.title=@"*returnString2";
//    }
    
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

-(void)setButtonStatus{
    if (loginStatus==YES) {loginButtonOutlet.title=@"On";} else {loginButtonOutlet.title=@"Off";}
    if (myplexStatus==YES) {myplexButtonOutlet.title=@"On";} else {myplexButtonOutlet.title=@"Off";}
    if (settingsStatus==YES) {settingsButtonOutlet.title=@"On";} else {settingsButtonOutlet.title=@"Off";}
    if (trailersStatus==YES) {trailersButtonOutlet.title=@"On";} else {trailersButtonOutlet.title=@"Off";}
    if (updateStatus==YES) {updateButtonOutlet.title=@"On";} else {updateButtonOutlet.title=@"Off";}
}

-(void) checkForUpdate{
    /*    NSDictionary* errorDict;
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
     */
    //    if ([returnString isEqual:@"NoUpdate"]) {
    if (updateAvailable==NO) {
        updateButton.enabled=NO;
        updateButton.title=@"No Updates";
    } else {
        updateButton.enabled=YES;
        updateButton.title=@"Update App";
    }
}

-(void) checkServerStatus{
    NSDictionary* errorDict;
    NSAppleEventDescriptor *returnDescriptor = NULL;
    NSMutableString *scriptText = [NSMutableString stringWithString:@"set z to missing value\n"];
    [scriptText appendString:@"try\n"];
    [scriptText appendString:@"POSIX file \"/Applications/PlexConnect/PlexConnect.log\" as alias\n"];
    [scriptText appendString:@"on error\n"];
    [scriptText appendString:@"set z to \"No PlexConnect.Log Detected\"\n"];
    [scriptText appendString:@"end try\n"];
    [scriptText appendString:@"try\n"];
    [scriptText appendString:@"set z to do shell script \"/usr/bin/grep -ic 'Shutting' /Applications/PlexConnect/PlexConnect.log\"\n"];
    [scriptText appendString:@"end try\n"];
    [scriptText appendString:@"if z > 0 then\n"];
    [scriptText appendString:@"set z to \"PlexConnect is Not Running\"\n"];
    [scriptText appendString:@"else\n"];
    [scriptText appendString:@"set z to \"PlexConnect is Running\"\n"];
    [scriptText appendString:@"end if\n"];
    NSAppleScript* scriptObject = [[NSAppleScript alloc] initWithSource: scriptText];
    returnDescriptor = [scriptObject executeAndReturnError: &errorDict];
    NSString *returnString = [returnDescriptor stringValue];
//    NSLog(@"returnString: %@",returnString);
    
    if ([returnString isEqual:@"PlexConnect is Running"]) {
        [statusImage setImage:[NSImage imageNamed:@"statusGreen"]];
    } else {
        [statusImage setImage:[NSImage imageNamed:@"statusRed"]];
    }
    
//    if ([returnString isEqual:@"No PlexConnect.Log Detected"]) {
//        return NO;
//    }
//    if ([returnString isEqual:@"PlexConnect is Not Running"]) {
//        return NO;
//    }
    
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
}

-(void)checkOnOffStates{
    NSURL *path = [NSURL URLWithString:@"/Applications/plexconnect_Backup"];
    NSDirectoryEnumerator *directoryEnumerator = [[NSFileManager defaultManager] enumeratorAtURL:path includingPropertiesForKeys:@[] options:NSDirectoryEnumerationSkipsHiddenFiles|NSDirectoryEnumerationSkipsPackageDescendants|NSDirectoryEnumerationSkipsSubdirectoryDescendants errorHandler:nil];
    //    NSMutableArray *autoFiles = [NSMutableArray new];
    loginStatus=NO;trailersStatus=NO;settingsStatus=NO,updateStatus=NO;myplexStatus=NO;
    for (NSString *path in directoryEnumerator) {
        //        if ([[path pathExtension] isEqualToString:@"auto"]) {
        NSString *path2 =[NSString stringWithFormat:@"%@",path];
        //            [autoFiles addObject:[path2 stringByReplacingOccurrencesOfString:@"file:///Applications/plexconnect_BACKUP" withString:@""]];
        //        }
        //    }
        
        if ([path2 rangeOfString:@"login.auto"].location != NSNotFound) {loginStatus=YES;}
        if ([path2 rangeOfString:@"trailers.auto"].location != NSNotFound) {trailersStatus=YES;}
        if ([path2 rangeOfString:@"settings.auto"].location != NSNotFound) {settingsStatus=YES;}
        if ([path2 rangeOfString:@"update.auto"].location != NSNotFound) {updateStatus=YES;}
        if ([path2 rangeOfString:@"myplex.auto"].location != NSNotFound) {myplexStatus=YES;}
    }
    //    if ([autoFiles containsObject:@"login.auto"]){loginStatus = YES;}
    //    if ([autoFiles containsObject:@"trailers.auto"]){trailersStatus = YES;}
    //    if ([autoFiles containsObject:@"settings.auto"]){settingsStatus = YES;}
    //    if ([autoFiles containsObject:@"update.auto"]){updateStatus = YES;}
    //    if ([autoFiles containsObject:@"myplex.auto"]){myplexStatus = YES;}
//    NSLog(@"\nloginStatus=%hhd\ntrailersStatus=%hhd\nsettingsStatus=%hhd\nupdateStatus=%hhd\nmyPlexStatus=%hhd",loginStatus,trailersStatus,settingsStatus,updateStatus,myplexStatus);
}

- (IBAction)loginButtonAction:(id)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"loginStatus" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    
    [self checkOnOffStates];
    [self setButtonStatus];
}
- (IBAction)updateButtonAction:(id)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"updateStatus" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    
    [self checkOnOffStates];
    [self setButtonStatus];
}
- (IBAction)trailersButtonAction:(id)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"trailersStatus" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    
    [self checkOnOffStates];
    [self setButtonStatus];
}
- (IBAction)myplexButtonAction:(id)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"myplexStatus" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    
    [self checkOnOffStates];
    [self setButtonStatus];
}
- (IBAction)settingButtonAction:(id)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"settingsStatus" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    
    [self checkOnOffStates];
    [self setButtonStatus];
}

- (IBAction)interceptButtonAction:(NSButton *)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"intercept" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
}
@end