//
//  main.m
//  OpenPlex 0.4.2
//
//  Copyright (c) 2014 Wahlman.j & Flipman6 All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}