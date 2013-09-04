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

- (void) gem30RandomNumbers
{
    NSMutableArray * tempArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 30; i++)
    {
        NSString * tempValue = [[NSString alloc] initWithFormat:@"%d", (arc4random() % 30 ) + 1];
        
    }
}

#pragma Utili method

@end
