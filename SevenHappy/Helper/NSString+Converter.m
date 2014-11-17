//
//  NSString+Converter.m
//  SevenHappy
//
//  Created by Calileo Che on 17/11/14.
//  Copyright (c) 2014 bopomofo. All rights reserved.
//

#import "NSString+Converter.h"

@implementation NSString (Converter)

-(NSDecimalNumber*) decimalNumberValue
{
    return [NSDecimalNumber decimalNumberWithString: self];
}
@end
