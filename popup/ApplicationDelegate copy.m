#import "ApplicationDelegate.h"

@interface ApplicationDelegate ()
@property (weak) IBOutlet NSWindow *window;

@property (strong, nonatomic) NSStatusItem *statusItem;
@property (assign, nonatomic) BOOL darkModeOn;
@end

@implementation ApplicationDelegate
//@synthesize panelController = _panelController;
//@synthesize menubarController = _menubarController;
//@synthesize WinCon;

//- (NSString *)OpenPlex:(NSString *)displayName;
//{
//    [_Loginwindow makeKeyAndOrderFront:self];
//    [self.window makeMainWindow];
//}


//- (void)itemClicked:(id)sender

//{


//  [self.window makeKeyAndOrderFront:self];
//[self.window makeKeyAndOrderFront:self];
//[self.window makeMainWindow];

//

// NSWindowController *OpenPlex = [OpenPlex];
// [OpenPlex makeKeyAndOrderFront:nil];

//  WindowController = [[NSWindowController alloc] initWithWindowNibName:@"OpenPlex"];
// [OpenPlex makeKeyAndOrderFront:nil];
//  [WindowController showWindow:nil];

// [[NSWindowController alloc]init:Default:OpenPlex];




//[[NSWindowController alloc] initWithWindowNibName:@"OpenPlex"];

//self.WinCon = [[OpenPlex alloc] initWithWindowNibName:@"OpenPlex"];
//[self.WinCon showWindow:self];
//NSBeep();



//NSEvent *event = [NSApp currentEvent];
//if([event modifierFlags] & NSControlKeyMask) {
//  [[NSApplication sharedApplication] terminate:self];
//return;
// }


//
//}


//-(NSString *)OpenPlex
//{

//}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    ///////////////////////NO PANEL///////////////////////
    ///////////////////////NO PANEL///////////////////////
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _statusItem.image = [NSImage imageNamed:@"switchIcon.png"];
    [_statusItem.image setTemplate:YES];
    
    _statusItem.highlightMode = NO;
    _statusItem.toolTip = @"command-click to quit";
    
    [_statusItem setAction:@selector(itemClicked:)];
    [self refreshDarkMode];
    
    ///////////////////////NO PANEL///////////////////////
    ///////////////////////NO PANEL///////////////////////
    
    ////////////////////////PANEL////////////////////////
    ////////////////////////PANEL////////////////////////
    // Install icon into the menu bar
    // self.menubarController = [[MenubarController alloc] init];
    ////////////////////////PANEL////////////////////////
    ////////////////////////PANEL////////////////////////
    
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

- (void)itemClicked:(id)sender {
    
    NSEvent *event = [NSApp currentEvent];
    if([event modifierFlags] & NSControlKeyMask) {
        [[NSApplication sharedApplication] terminate:self];
        return;
    }
    
    _darkModeOn = !_darkModeOn;
    
    //Change pref
    if (_darkModeOn) {
        CFPreferencesSetValue((CFStringRef)@"AppleInterfaceStyle", @"Dark", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    }
    else {
        CFPreferencesSetValue((CFStringRef)@"AppleInterfaceStyle", NULL, kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    }
    
    //update listeners
    dispatch_async(dispatch_get_main_queue(), ^{
        CFNotificationCenterPostNotification(CFNotificationCenterGetDistributedCenter(), (CFStringRef)@"AppleInterfaceThemeChangedNotification", NULL, NULL, YES);
    });
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
