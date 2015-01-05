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
    NSFileHandle* fh = [NSFileHandle fileHandleForWritingAtPath:path];
    if ( !fh ) {
        [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
        fh = [NSFileHandle fileHandleForWritingAtPath:path];
    }
    if ( !fh ) return NO;
    @try {
        [fh seekToEndOfFile];
        [fh writeData:[self dataUsingEncoding:enc]];
    }
    @catch (NSException * e) {
        result = NO;
    }
    [fh closeFile];
    return result;
}
@end
