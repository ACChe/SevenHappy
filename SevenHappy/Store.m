//
//  Store.m
//  SevenHappy
//
//  Created by iosdev on 2/9/13.
//  Copyright (c) 2013年 bopomofo. All rights reserved.
//

#import "Store.h"

@implementation Store

+ (instancetype)store
{
    return [[self alloc] init];
}


- (id)init
{
    if (self = [super init])
    {
        [self readArchive];
    }
    return self;
}

- (void)readArchive
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
@end
