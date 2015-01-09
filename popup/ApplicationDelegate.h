
/*!
 --  OpenPlex 0.4
 --
 --  Originally designed by iCyberGhost on 5/02/14.
 --  Originally coded by Wahlman.j on 5/02/14.
 Copyright (c) 2015 CyberGhost & Wahlman.j. All rights reserved.
 */
//#import "MenubarController.h"
//#import "PanelController.h"
#import <Cocoa/Cocoa.h>

@interface ApplicationDelegate : NSObject <NSApplicationDelegate>
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (assign, nonatomic) BOOL darkModeOn;
@property (nonatomic, retain) NSWindowController *winCon;
- (IBAction)darkMenu_Button:(id)sender;

//@property (nonatomic, strong) NSWinCon *WinCon;
//@property (nonatomic, strong) MenubarController *menubarController;
//@property (nonatomic, strong, readonly) PanelController *panelController;

//@property (weak) IBOutlet NSWindow *window;
//@property (weak) IBOutlet NSWindow *window;


//@property (weak) IBOutlet NSWindowController *WindowController;
//@property (strong) NSWindowController *WindowController;

//- (IBAction)togglePanel:(id)sender;

@end