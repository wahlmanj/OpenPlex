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
BOOL loginStatus,myplexStatus,settingsStatus,trailersStatus,updateStatus;

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
    [self checkOnOffStates];
}

- (void)itemClicked:(id)sender {
    
    if (winCon==nil) {
        winCon = [[NoMenu alloc] init];
        [winCon showWindow:self];
        [NSApp activateIgnoringOtherApps:YES];
        
    } else if (winCon.window.isMainWindow){
        [winCon close];
    } else{
        [winCon showWindow:self];
        //    winCon = [[NSWindowController alloc]initWithWindowNibName:@"NoMenu"];
        [[winCon window] makeKeyAndOrderFront:self];
        [NSApp activateIgnoringOtherApps:YES];
    }
    NSEvent *event = [NSApp currentEvent];
    if([event modifierFlags] & NSControlKeyMask) {
        [[NSApplication sharedApplication] terminate:self];
        return;
    }
    
}

-(void)checkOnOffStates{
    NSURL *path = [NSURL URLWithString:@"/Applications/plexconnect_Backup"];
    NSDirectoryEnumerator *directoryEnumerator = [[NSFileManager defaultManager] enumeratorAtURL:path includingPropertiesForKeys:@[] options:NSDirectoryEnumerationSkipsHiddenFiles|NSDirectoryEnumerationSkipsPackageDescendants|NSDirectoryEnumerationSkipsSubdirectoryDescendants errorHandler:nil];
    NSMutableArray *autoFiles = [NSMutableArray new];
    for (NSString *path in directoryEnumerator) {
        if ([[path pathExtension] isEqualToString:@"auto"]) {
            NSString *path2 =[NSString stringWithFormat:@"%@",path];
            [autoFiles addObject:[path2 stringByReplacingOccurrencesOfString:@"file:///Applications/plexconnect_BACKUP/" withString:@""]];
        }
    }
    
    if ([autoFiles containsObject:@"login.auto"]){loginStatus = YES;}
    if ([autoFiles containsObject:@"trailers.auto"]){trailersStatus = YES;}
    if ([autoFiles containsObject:@"settings.auto"]){settingsStatus = YES;}
    if ([autoFiles containsObject:@"update.auto"]){updateStatus = YES;}
    if ([autoFiles containsObject:@"myplex.auto"]){myplexStatus = YES;}
//    NSLog(@"\nloginStatus=%hhd\ntrailersStatus=%hhd\nsettingsStatus=%hhd\nupdateStatus=%hhd\nmyPlexStatus=%hhd",loginStatus,trailersStatus,settingsStatus,updateStatus,myplexStatus);
}

@end