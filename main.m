//
//  main.m
//  OpenPlex
//
//  Created by user on 1/4/15.
//  Copyright (c) 2015 OpenPlex. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
