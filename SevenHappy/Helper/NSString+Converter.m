//
//  NSString+Converter.m
//  SevenHappy
//
//  Created by Calileo Che on 17/11/14.
//  Copyright (c) 2014 bopomofo. All rights reserved.
//

#import "NSString+Converter.h"

@implementation NSString (Converter)

- (NSDecimalNumber*) decimalNumberValue
{
    return [NSDecimalNumber decimalNumberWithString: self];
}

- (BOOL) appendToFile:(NSString *)path encoding:(NSStringEncoding)enc;
{
    BOOL result = YES;
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
    if ( !fileHandle ) {
        [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
        fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
    }
    if ( !fileHandle ) return NO;
    @try {
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[self dataUsingEncoding:enc]];
    }
    @catch (NSException * e) {
        result = NO;
    }
    [fileHandle closeFile];
    return result;
}
@end
