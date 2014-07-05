//
//  main.m
//  OpenPlex 0.2
//
//  Designed by iCyberGhost coded by wahlman.j on 24/06/14.
//  Copyright (c) 2014 CyberGhost. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}