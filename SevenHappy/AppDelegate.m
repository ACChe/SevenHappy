//
//  AppDelegate.m
//  SevenHappy
//
//  Created by iosdev on 30/8/13.
//  Copyright (c) 2013年 bopomofo. All rights reserved.
//

#import "AppDelegate.h"
#import "Store.h"

@implementation AppDelegate


+ (instancetype)sharedDelegate
{
    return [NSApplication sharedApplication].delegate;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    //test code
//    NSArray *a1 = @[@1, @2, @3];
//    NSArray *a2 = @[@1, @2, @3];
//    
//    if ([a1 isEqualTo:a2]) {
//        NSLog(@"a1 is equal to a2");
//    } else {
//        NSLog(@"Not in the same");
//    }
    
    
    
    NSArray * resultNumber = [self.store gemRandomNumbersInOfScope:self.store.numbers withNumberRule:30 inLine:7];
}

@synthesize store = _store;

- (Store *)store
{
    if (_store == nil) {
        _store = [Store store];
    }
    return _store;
}

@end
