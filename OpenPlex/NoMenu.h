/*!
 --  OpenPlex 0.4.1
 --
 --  Originally designed by iCyberGhost on 5/02/14.
 --  Originally coded by Wahlman.j on 5/02/14.
 Copyright (c) 2015 CyberGhost & Wahlman.j. All rights reserved.
 */

#import "ApplicationDelegate.h"
#import <Cocoa/Cocoa.h>


@interface NoMenu : NSWindowController <NSApplicationDelegate>
@property (assign) IBOutlet NSButton *dark;
@property (assign, nonatomic) BOOL darkModeOn;
@end