//
//  NumberData.h
//  SevenHappy
//
//  Created by iosdev on 2/9/13.
//  Copyright (c) 2013年 bopomofo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberData : NSObject

@property (nonatomic, retain) NSArray *originalNumberData;
@property (nonatomic, retain) NSArray *numberData;

- (void)readDataFromFile;


@end
