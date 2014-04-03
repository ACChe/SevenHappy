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
    // Insert code here to initialize your application
    //*** test code start
//    NSArray * numberArray = self.store.numbers;
//    NSArray * testNumber1 = [@"4,14,19,22,26,29,30" componentsSeparatedByString:@","];
//    NSLog(@"testNumber1 = %@", testNumber1);
//    NSArray * testArray = [[NSArray alloc] initWithObjects:testNumber1, nil];
//
//    [self.store isArray:testArray existInArrayPool:numberArray];
    //*** test code end
//    NSArray *noDuplicateArray = [self.store filterNumbersByNoDuplicate:self.store.operatedNumbers];
    NSArray * resultNumber = [self.store gemFiveRandomNumbersoutOfScope:self.store.numbers];
//    NSLog(@"Result is : %@", resultNumber);
//    [self.store saveResultToHistory:resultNumber];
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
