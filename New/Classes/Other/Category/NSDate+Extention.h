//
//  NSDate+Extention.h
//  New
//
//  Created by allen on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extention)

- (NSDateComponents *)deltaFrom:(NSDate *)from;

- (BOOL)isThisYear;
- (BOOL)isToday;
- (BOOL)isYesterday;

@end
