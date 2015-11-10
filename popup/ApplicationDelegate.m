/*
 --  OpenPlex 0.5
 --
 --  Originally Designed by CyberGhost84 on 5/02/14.
 --  Originally Coded by Wahlman.j on 5/02/14.
 --  Copyright (©) 2015 Wahlman.j, CyberGhost84 & Flipman6 All rights reserved.
 */

#import "ApplicationDelegate.h"
#import "NoMenu.h"

BOOL darkModeOn;
BOOL loginStatus,myplexStatus,settingsStatus,trailersStatus,updateStatus;
BOOL updateAvailable;

@interface ApplicationDelegate ()
@property (assign) IBOutlet NSWindow *window;

@end
@implementation ApplicationDelegate
//@synthesize winCon, statusItem;
//@synthesize menuDropDown;
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
    [self checkForUpdateSetBool];
    [NSTimer scheduledTimerWithTimeInterval:3600 target:self selector:@selector(checkForUpdateSetBool) userInfo:nil repeats:YES];
}

- (void)itemClicked:(id)sender {

//    self.menuDropDown = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
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
 //   [self checkForUpdateSetBool];
}

-(void)checkOnOffStates{
    NSURL *path = [NSURL URLWithString:@"/Applications/plexconnect_Backup"];
    NSDirectoryEnumerator *directoryEnumerator = [[NSFileManager defaultManager] enumeratorAtURL:path includingPropertiesForKeys:@[] options:NSDirectoryEnumerationSkipsHiddenFiles|NSDirectoryEnumerationSkipsPackageDescendants|NSDirectoryEnumerationSkipsSubdirectoryDescendants errorHandler:nil];
    //    NSMutableArray *autoFiles = [NSMutableArray new];
    for (NSString *path in directoryEnumerator) {
        //        if ([[path pathExtension] isEqualToString:@"auto"]) {
        NSString *path2 =[NSString stringWithFormat:@"%@",path];
        //            [autoFiles addObject:[path2 stringByReplacingOccurrencesOfString:@"file:///Applications/plexconnect_BACKUP/" withString:@""]];
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

-(void) checkForUpdateSetBool{
    NSDictionary* errorDict;
    NSAppleEventDescriptor* returnDescriptor = NULL;
    NSMutableString *scriptText = [NSMutableString stringWithString:@"set y to missing value\n"];
    [scriptText appendString:@"set x to do shell script \"export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; /usr/local/bin/appupdatebash.bash\"\n"];
    [scriptText appendString:@"if x is equal to \"Already up-to-date.\" then\n"];
    [scriptText appendString:@"set y to \"NoUpdate\"\n"];
    [scriptText appendString:@"else if x is not equal to \"Already up-to-date.\" then\n"];
    [scriptText appendString:@"set y to \"YesUpdate\"\n"];
    [scriptText appendString:@"end if\n"];
    
    NSAppleScript* scriptObject = [[NSAppleScript alloc] initWithSource: scriptText];
    returnDescriptor = [scriptObject executeAndReturnError: &errorDict];
    NSString *returnString = [returnDescriptor stringValue];
    
    if ([returnString isEqual:@"NoUpdate"]) {
        updateAvailable=NO;
    } else {
        updateAvailable=YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateAvailable" object:nil];
    }
//        NSLog(@"updateCheck");
}


@end