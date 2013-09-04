//
//  Store.m
//  SevenHappy
//
//  Created by iosdev on 2/9/13.
//  Copyright (c) 2013年 bopomofo. All rights reserved.
//

#import "Store.h"
#import "Numbers.h"

@implementation Store
@synthesize operatedNumbers = _operatedNumbers;
@synthesize fileredNumbers = _fileredNumbers;
+ (instancetype)store
{
    return [[self alloc] init];
}


- (id)init
{
    if (self = [super init])
    {
        [self readData];
    }
    return self;
}

- (void)readData
{
    //Read the data from external file
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *theFile = [mainBundle pathForResource:@"SevenHappy" ofType:@"txt"];
    //        NSString *filePathName = @"/SevenHappy.txt";
    NSError *fileError;
    NSString *textFileContents = [NSString stringWithContentsOfFile:theFile encoding:NSASCIIStringEncoding error:&fileError];
    if (fileError.code == 0)
    {
        //            NSLog(@"textfile.txt contents: %@", textFileContents);
    }
    else
    {
        NSLog(@"error(%ld) : %@", (long)fileError.code, fileError.description);
    }
    
    if (textFileContents != NULL)
    {
        NSArray *totalStringList = [textFileContents componentsSeparatedByString:@"\n"];
        //            NSLog(@"result is %@", totalStringList);
        //            NSLog(@"total number is : %ld", [totalStringList count]);
        //            NSArray *tempStringArray = [totalStringList objectAtIndex:0];
        //            NSLog(@"one of the list is : %@", tempStringArray);
        
        NSMutableArray *targetMutableArray = [[NSMutableArray alloc] init];
        
        [totalStringList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [targetMutableArray addObject:[obj componentsSeparatedByString:@","]];
            NSLog(@"here (%lu) is %@ ", (unsigned long)idx, [targetMutableArray objectAtIndex:idx]);
        }];
        
        _numbers = [NSArray arrayWithArray:targetMutableArray];
    }
}

- (NSArray *)filterNumbersByNoDuplicate:(NSArray *)originalArray
{
    NSMutableArray * tempMutableArray = [NSMutableArray arrayWithArray:originalArray];
    //    [tempMutableArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    //
    //    }]
    NSLog(@"there are %lu 's numbers", tempMutableArray.count);
    for (int i = 0; i < tempMutableArray.count - 1; i++)
    {
        for (int j = i + 1; j < tempMutableArray.count; j++)
        {
            if ([[tempMutableArray objectAtIndex:i] isEqualToArray:[tempMutableArray objectAtIndex:j]])
            {
                NSLog(@"left[%d] : %@ is equal to right[%d] : %@", i, [tempMutableArray objectAtIndex:i], j, [tempMutableArray objectAtIndex:j]);
                [tempMutableArray removeObjectAtIndex:j];
            }
        }
    }
    NSLog(@"Total amount is = %lu", tempMutableArray.count);
    return [NSArray arrayWithArray:tempMutableArray];
}

- (BOOL)isArray:(NSArray *)aArray existInArrayPool:(NSArray *)poolArray
{
    for (int i = 0; i < aArray.count; i++)
    {
        for (int j = 0; j < poolArray.count; j++)
        {
            if([[aArray objectAtIndex:i] isEqualToArray:[poolArray objectAtIndex:j]])
            {
                return YES;
            }
        }
    }
    return NO;
}


- (NSArray *) gem30RandomNumbers
{
    NSArray *temp = [NSArray arrayWithObjects:@"1",@"2", @"3",@"4", @"5",@"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:temp];
    NSMutableArray*resultArray = [[NSMutableArray alloc]init];
    int i;
    int count = temp.count;
    for (i = 0; i < count; i++) {
        int index =arc4random() % (count - i);
        [resultArray addObject:[tempArray objectAtIndex:index]];
        [tempArray removeObjectAtIndex:index];
    }
//    [tempArray release];
    
    return [NSArray arrayWithArray:[self splitArray:resultArray PerCount:7]];
}


- (NSArray *) gemFiveRandomNumbers
{
    NSArray * tempArray = [[NSArray alloc] init];
    do
    {
        tempArray = [self gem30RandomNumbers];
    }
    while ([self isArray:tempArray existInArrayPool:_fileredNumbers]);
    return tempArray;
}

#pragma Utili method
- (BOOL) oneNumber:(int)aNumber isExistInPool:(NSArray *)thePool
{
    for (int i = 0; i < thePool.count; i++)
    {
        if ([NSNumber numberWithInt:aNumber] == [thePool objectAtIndex:i])
        {
            return YES;
        }
    }
    return NO;
}

- (NSArray *) splitArray:(NSArray *)aArray PerCount:(int)aCount
{
    NSMutableArray * tempArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < aArray.count / aCount; i++)
    {
        [tempArray addObject:[[aArray subarrayWithRange:NSMakeRange(i * aCount, aCount)] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2)
                              {
            if ([obj1 integerValue] > [obj2 integerValue])
            {
                return (NSComparisonResult)NSOrderedDescending;
            }
            else if ([obj1 integerValue] < [obj2 integerValue])
            {
                return (NSComparisonResult)NSOrderedAscending;
            }
            else
                return (NSComparisonResult)NSOrderedSame;
        }]];
    }
    NSLog(@"new Random number is %@", tempArray);
    return [NSArray arrayWithArray:tempArray];
}
@end
