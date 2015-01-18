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
@synthesize macIP,certURL,guideIP,guideURL,mainIP;

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
    if (darkModeCapable) {
        dark.enabled=YES;
    }else{
        dark.enabled=NO;
    }

    if (darkModeOn==YES) {
        dark.title=@"On";

    } else {
        dark.title=@"Off";

    }
    
    NSString *setupIP=[[NSString alloc] initWithFormat:@"%@",[self getLocalIPAddress]];
    NSString *localIP=[[NSString alloc] initWithFormat:@"Local IP:  %@",[self getLocalIPAddress]];
    NSString *certString=[[NSString alloc] initWithFormat:@"Cert URL:  %@/trailers.cer",[self getLocalIPAddress]];
    NSString *guidelocalIP=[[NSString alloc] initWithFormat:@"Local IP :  %@",[self getLocalIPAddress]];
    NSString *guidecertString=[[NSString alloc] initWithFormat:@"Cert URL :  %@/trailers.cer",[self getLocalIPAddress]];
    
    [mainIP setTitleWithMnemonic:setupIP];
    [mainIP setFont:[NSFont fontWithName:@"Helvetica Neue" size:12]];
    
    [macIP setTitleWithMnemonic:localIP];
    [macIP setFont:[NSFont fontWithName:@"Helvetica Neue" size:12]];
    
    
    [certURL setTitleWithMnemonic:certString];
    [certURL setFont:[NSFont fontWithName:@"Helvetica Neue" size:12]];
    
    
    [guideIP setTitleWithMnemonic:guidelocalIP];
    [guideIP setFont:[NSFont fontWithName:@"Helvetica Neue" size:14]];
    
    [guideURL setTitleWithMnemonic:guidecertString];
    [guideURL setFont:[NSFont fontWithName:@"Helvetica Neue" size:14]];


    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
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