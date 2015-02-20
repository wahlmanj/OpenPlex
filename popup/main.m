/*
//  main.m
//  OpenPlex 0.5
//
//  Copyright (©) 2015 Wahlman.j, CyberGhost84 & Flipman6 All rights reserved.
*/

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}