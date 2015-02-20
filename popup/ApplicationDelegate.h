/*
 --  OpenPlex 0.5
 --
 --  Originally Designed by CyberGhost84 on 5/02/14.
 --  Originally Coded by Wahlman.j on 5/02/14.
 --  Copyright (©) 2015 Wahlman.j, CyberGhost84 & Flipman6 All rights reserved.
 */

#import <Cocoa/Cocoa.h>

extern BOOL darkModeOn;
//extern BOOL darkModeCapable;
extern BOOL loginStatus,myplexStatus,settingsStatus,trailersStatus,updateStatus;
extern BOOL updateAvailable;

@class NoMenu;

@interface ApplicationDelegate : NSObject <NSApplicationDelegate>{
    NoMenu *winCon;
}

@property (strong, nonatomic) NSStatusItem *statusItem;
@property (strong, nonatomic) IBOutlet NSMenu *menuDropDown;

@end