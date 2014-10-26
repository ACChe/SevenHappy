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

    NSArray * resultNumber = [self.store gemRandomNumbersInOfScope:self.store.numbers withNumberRule:33 inLine:6];
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
