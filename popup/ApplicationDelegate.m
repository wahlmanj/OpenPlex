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
    ///////////////////////NO PANEL///////////////////////
    ////////////////////////PANEL////////////////////////
    // Install icon into the menu bar
    // self.menubarController = [[MenubarController alloc] init];
    ////////////////////////PANEL////////////////////////
}
- (void)itemClicked:(id)sender {
    NSBeep();
    ///////////////////////POPUP///////////////////////
    self.winCon = [[NoMenu alloc] initWithWindowNibName:@"Setup"];
    [self.winCon showWindow:self];
    ///////////////////////POPUP///////////////////////
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
@end