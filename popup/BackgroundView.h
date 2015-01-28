/*!
 --  OpenPlex 0.4.2
 --
 --  Originally coded by Wahlman.j on 5/02/14.
 Copyright (c) 2015 Wahlman.j & Flipman 6. All rights reserved.
 */

#define ARROW_WIDTH 12
#define ARROW_HEIGHT 8

@interface BackgroundView : NSView
{
    NSInteger _arrowX;
}

@property (nonatomic, assign) NSInteger arrowX;

@end
