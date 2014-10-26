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
- (NSArray *) gemAssignNumbersInScope:(int)_scope perLine:(int)_inAmount;
- (NSArray *) gemRandomNumbersInOfScope:(NSArray *)numberPool withNumberRule:(int) amount inLine:(int) lineAmount;
- (BOOL)isArray:(NSArray *)aArray existInArrayPool:(NSArray *)poolArray;
- (void)saveResultToHistory:(NSArray *)aArray;

@end
