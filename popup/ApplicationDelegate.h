/*!
 --  OpenPlex 0.4.2
 --
 --  Originally designed by iCyberGhost on 5/02/14.
 --  Originally coded by Wahlman.j on 5/02/14.
 Copyright (c) 2015 CyberGhost & Wahlman.j. All rights reserved.
 */

#import <Cocoa/Cocoa.h>

extern BOOL darkModeOn;

@interface ApplicationDelegate : NSObject <NSApplicationDelegate>
@property (nonatomic, retain) NSWindowController *winCon;
@property (strong, nonatomic) NSStatusItem *statusItem;
@end