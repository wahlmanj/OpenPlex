/*!
 --  OpenPlex 0.4.2
 --
 --  Originally designed by iCyberGhost on 5/02/14.
 --  Originally coded by Wahlman.j on 5/02/14.
 Copyright (c) 2015 CyberGhost & Wahlman.j. All rights reserved.
 */

#import "ApplicationDelegate.h"
#import <Cocoa/Cocoa.h>


@interface NoMenu : NSWindowController <NSApplicationDelegate>

//@property (strong) IBOutlet NSTextField *mainIP;
//@property (strong) IBOutlet NSTextField *macIP;
//@property (strong) IBOutlet NSTextField *certURL;
@property (strong) IBOutlet NSTextField *guideIP;
@property (strong) IBOutlet NSTextField *guideURL;
@property (strong) IBOutlet NSButton *updateButton;
@property (strong) IBOutlet NSButton *statusButton;
@property (strong) IBOutlet NSImageView *statusImage;
@property (strong, nonatomic) IBOutlet NSButton *dark;
@property (assign, nonatomic) BOOL darkModeOn;
@end