//
//  Store.h
//  SevenHappy
//
//  Created by iosdev on 2/9/13.
//  Copyright (c) 2013年 bopomofo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

+ (instancetype)store;

@property (readonly, nonatomic, strong) NSArray * numbers;


- (NSArray *) filterNumbersByNoDuplicate:(NSArray *)originalArray;
- (NSArray *) gem30RandomNumbers;
- (NSArray *) gemFiveRandomNumbersOutOfScope:(NSArray *)numberPool;
- (BOOL)isArray:(NSArray *)aArray existInArrayPool:(NSArray *)poolArray;
- (void)saveResultToHistory:(NSArray *)aArray;

@end
