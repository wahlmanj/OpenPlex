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
@synthesize winCon;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    ///////////////////////NO PANEL///////////////////////
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _statusItem.image = [NSImage imageNamed:@"switchIcon.png"];
    [_statusItem.image setTemplate:YES];
    _statusItem.highlightMode = NO;
    [_statusItem setAction:@selector(itemClicked:)];
    _statusItem.toolTip = @"Control-click to quit";
    ///////////////////////NO PANEL///////////////////////
    ////////////////////////PANEL////////////////////////
    // Install icon into the menu bar
    // self.menubarController = [[MenubarController alloc] init];
    ////////////////////////PANEL////////////////////////
}
- (void)itemClicked:(id)sender {
    ///////////////////////POPUP///////////////////////
    self.winCon = [[NSWindowController alloc] initWithWindowNibName:@"NoMenu"];
    [[self.winCon window] makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];

    NSEvent *event = [NSApp currentEvent];
    if([event modifierFlags] & NSControlKeyMask) {
        [[NSApplication sharedApplication] terminate:self];
        return;
    }
    
    
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
@end