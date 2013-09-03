//
//  AppDelegate.h
//  SevenHappy
//
//  Created by iosdev on 30/8/13.
//  Copyright (c) 2013年 bopomofo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Store;

@interface AppDelegate : NSObject <NSApplicationDelegate>

+ (instancetype)sharedDelegate;

@property (assign) IBOutlet NSWindow *window;
@property (readonly, nonatomic, strong) Store * store;

@end
