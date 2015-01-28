/*!
 --  OpenPlex 0.4.2
 --
 --  Originally coded by Wahlman.j on 5/02/14.
 Copyright (c) 2015 Wahlman.j & Flipman6. All rights reserved.
 */

#import "Panel.h"

@implementation Panel

- (BOOL)canBecomeKeyWindow;
{
    return YES; // Allow Search field to become the first responder
}

@end
