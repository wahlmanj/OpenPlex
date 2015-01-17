/*!
 --  OpenPlex 0.4.2
 --
 --  Originally designed by iCyberGhost on 5/02/14.
 --  Originally coded by Wahlman.j on 5/02/14.
 Copyright (c) 2015 CyberGhost & Wahlman.j. All rights reserved.
 */

#import "ApplicationDelegate.h"
#import "NoMenu.h"

BOOL darkModeOn;
BOOL darkModeCapable;


@interface ApplicationDelegate ()
@property (assign) IBOutlet NSWindow *window;

@end
@implementation ApplicationDelegate
//@synthesize winCon, statusItem;
@synthesize statusItem;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    statusItem.image = [NSImage imageNamed:@"switchIcon.png"];
    [statusItem.image setTemplate:YES];
    statusItem.highlightMode = NO;
    [statusItem setAction:@selector(itemClicked:)];
    statusItem.toolTip = @"Control-click to quit";
    
    NSString * value = (__bridge NSString *)(CFPreferencesCopyValue((CFStringRef)@"AppleInterfaceStyle", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost));
    if ([value isEqualToString:@"Dark"]) {
        darkModeOn = YES;
   //     NSLog(@"Dark On");
    }
    else {
        darkModeOn = NO;
     //   NSLog(@"Dark Off");
    }
    
    NSDictionary *version = [NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    NSString *productVersion = [version objectForKey:@"ProductVersion"];
//    NSLog (@"productVersion =========== %@", productVersion);
    float versionNumber = [productVersion floatValue];
    if (versionNumber >= 10.10) {
        darkModeCapable = YES;
    }
    

}

- (void)itemClicked:(id)sender {
    
    winCon = [[NoMenu alloc] init];
    [winCon showWindow:self];
    
//    winCon = [[NSWindowController alloc]initWithWindowNibName:@"NoMenu"];
    [[winCon window] makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
    NSEvent *event = [NSApp currentEvent];
    if([event modifierFlags] & NSControlKeyMask) {
        [[NSApplication sharedApplication] terminate:self];
        return;
    }

}

@end