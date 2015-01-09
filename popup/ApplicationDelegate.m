/*!
 --  OpenPlex 0.4
 --
 --  Originally designed by iCyberGhost on 5/02/14.
 --  Originally coded by Wahlman.j on 5/02/14.
 Copyright (c) 2015 CyberGhost & Wahlman.j. All rights reserved.
 */
#import "ApplicationDelegate.h"
#import "NoMenu.h"
@interface ApplicationDelegate ()
@end
@implementation ApplicationDelegate
@synthesize winCon,darkModeOn,statusItem;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    statusItem.image = [NSImage imageNamed:@"switchIcon.png"];
    [statusItem.image setTemplate:YES];
    statusItem.highlightMode = NO;
    [statusItem setAction:@selector(itemClicked:)];
    statusItem.toolTip = @"Control-click to quit";
    [self refreshDarkMode];

//    [[ApplicationDelegate alloc] initWithWindowNibName:@"NoMenu.xib"];
    
/*               PANEL
     // Install icon into the menu bar
     // self.menubarController = [[MenubarController alloc] init];
 */
    
}
- (void)itemClicked:(id)sender {
    
    self.winCon = [[NSWindowController alloc]initWithWindowNibName:@"NoMenu"];
    [[self.winCon window] makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];

    NSEvent *event = [NSApp currentEvent];
    if([event modifierFlags] & NSControlKeyMask) {
    [[NSApplication sharedApplication] terminate:self];
        return;
    }
    
}

- (void)refreshDarkMode {
    NSString * value = (__bridge NSString *)(CFPreferencesCopyValue((CFStringRef)@"AppleInterfaceStyle", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost));
    if ([value isEqualToString:@"Dark"]) {
        self.darkModeOn = YES;
    }
    else {
        self.darkModeOn = NO;
    }
}

// - (void)darkModeEnable{
    
 
// }

- (IBAction)darkMenu_Button:(id)sender {
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
    NSLog(@"Button Clicked");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end