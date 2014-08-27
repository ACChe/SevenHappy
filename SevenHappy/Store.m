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
//    Read the data from external file
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *theFile = [mainBundle pathForResource:@"SevenHappy" ofType:@"txt"];
    
//    NSString *filePathName = @"/SevenHappy.txt";
    NSError *fileError;
    NSString *textFileContents = [NSString stringWithContentsOfFile:theFile encoding:NSASCIIStringEncoding error:&fileError];
    if (fileError.code == 0)
    {
//        NSLog(@"textfile.txt contents: %@", textFileContents);
    }
    else
    {
        NSLog(@"error(%ld) : %@", (long)fileError.code, fileError.description);
    }
    
    if (textFileContents != NULL)
    {
        NSArray *totalStringList = [textFileContents componentsSeparatedByString:@"\n"];
//        NSLog(@"result is %@", totalStringList);
        NSLog(@"totalStringList's count is : %ld", [totalStringList count]);

//        _numbers = [NSArray arrayWithArray:totalStringList];
        _numbers = [self groupTheSourceDada:totalStringList];
        NSLog(@"_number's is : %@", _numbers);
        
    }
}

#pragma mark - Group the data source to 7 per 1
- (NSArray *)groupTheSourceDada:(NSArray *) originData{
    NSMutableArray * resultArray = [[NSMutableArray alloc] init];
    [originData enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
         NSArray * tempArray = [obj componentsSeparatedByString:@","];
        [resultArray addObject:tempArray];
    }];
    return  [resultArray copy];
}


#pragma mark - Save the result to local file
- (void) saveResultToHistory:(NSArray *)aArray
{
//    NSBundle *mainBundle = [NSBundle mainBundle];
//    NSString *historyFilePathName = [mainBundle pathForResource:@"history" ofType:@"txt"];
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
//    NSString * dateValue = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
    NSString *dateValue = [NSString stringWithFormat:@"%@", [[NSDate alloc] initWithTimeIntervalSinceNow:secondsPerDay]];
    NSLog(@"date value = %@", dateValue);
    NSString *histroyFilePahtName = [NSString stringWithFormat: @"history_%@.txt", dateValue];
    [aArray writeToFile:histroyFilePahtName atomically:YES];
    
}

#pragma mark - method of distiguish the array is the same

- (BOOL)isArray:(NSArray *)aArray existInArrayPool:(NSArray *)poolArray
{
    NSLog(@"count = %ld", aArray.count);
    __block BOOL result = NO;

    [poolArray enumerateObjectsUsingBlock:^(id obj_out, NSUInteger idx_out, BOOL *stop_out) {
        [aArray enumerateObjectsUsingBlock:^(id obj_in, NSUInteger idx_in, BOOL *stop_in) {
            if ([aArray[idx_in] isEqualTo:obj_out]){
                result = YES;
                *stop_out = YES;
            }
        }];
    }];
    NSLog(@"Result is %i", result);
    return result;
}

#pragma mark - Random 1 - 30 number
- (NSArray *) gem30RandomNumbers
{
    NSArray *temp = [NSArray arrayWithObjects:@"1", @"2", @"3",@"4", @"5",@"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:temp];
    NSMutableArray*resultArray = [[NSMutableArray alloc]init];

    long count = temp.count;
    for (int i = 0; i < count; i++) {
        int index =arc4random() % (count - i);
        [resultArray addObject:[tempArray objectAtIndex:index]];
        [tempArray removeObjectAtIndex:index];
    }
//    [tempArray release];
    
    return [NSArray arrayWithArray:[self splitArray:resultArray PerCount:7]];
}

#pragma mark - Random five arrary with scope (1-30)
- (NSArray *) gemFiveRandomNumbersOutOfScope:(NSArray *)numberPool
{
    NSArray * tempArray = [[NSArray alloc] init];
    int count = 0;
    do
    {
        if(count > 1){
            NSLog(@"Term %d is duplicated", count);
        }
        tempArray = [self gem30RandomNumbers];
        count++;
    }
    while ([self isArray:tempArray existInArrayPool:numberPool]);
    NSLog(@"This is the %d turn to gem the nonduplicated Array", count);
    return tempArray;
}


#pragma mark - split the array to one set of seven
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
