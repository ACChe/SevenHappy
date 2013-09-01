//
//  main.m
//  SevenHappy
//
//  Created by iosdev on 30/8/13.
//  Copyright (c) 2013年 bopomofo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        
        //Read the data from external file
        NSString *filePathName = @"/Users/Calileo/Dropbox/SevenHappy.txt";
        NSError *fileError;
        NSString *textFileContents = [NSString stringWithContentsOfFile:filePathName encoding:NSASCIIStringEncoding error:&fileError];
        if (fileError.code == 0)
        {
//            NSLog(@"textfile.txt contents: %@", textFileContents);
        }
        else
        {
            NSLog(@"error(%ld) : %@", fileError.code, fileError.description);
        }
        
        if (textFileContents != NULL)
        {
            NSArray *totalStringList = [textFileContents componentsSeparatedByString:@"\n"];
//            NSLog(@"result is %@", totalStringList);
            NSLog(@"total number is : %ld", [totalStringList count]);
            NSArray *tempStringArray = [totalStringList objectAtIndex:0];
//            NSLog(@"one of the list is : %@", tempStringArray);
            
            NSMutableArray *targetMutableArray = [[NSMutableArray alloc] init];
            
            [totalStringList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [targetMutableArray addObject:[obj componentsSeparatedByString:@","]];
                NSLog(@"here (%lu) is %@ ", idx, [targetMutableArray objectAtIndex:idx]);
            }];
        }
        
    }
//    return NSApplicationMain(argc, argv);
    return 0;
}
