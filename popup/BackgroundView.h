/*
 --  OpenPlex 0.5
 --
 --  Originally Designed by CyberGhost84 on 5/02/14.
 --  Originally Coded by Wahlman.j on 5/02/14.
 --  Copyright (©) 2015 Wahlman.j, CyberGhost84 & Flipman6 All rights reserved.
 */

#define ARROW_WIDTH 12
#define ARROW_HEIGHT 8

@interface BackgroundView : NSView
{
    NSInteger _arrowX;
}

@property (nonatomic, assign) NSInteger arrowX;

@end
