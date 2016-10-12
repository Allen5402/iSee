//
//  NSDate+Extention.m
//  New
//
//  Created by allen on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "NSDate+Extention.h"

@implementation NSDate (Extention)
/**
 *  比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from{
    //日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //比较时间
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:from toDate:self options:0];
}


//是否为今年
- (BOOL)isThisYear{
    //日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == selfYear;
}

//是否为今天
- (BOOL)isToday{
    //日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *nowCmp = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmp = [calendar components:unit fromDate:self];
    
    return nowCmp.year == selfCmp.year && nowCmp.month == selfCmp.month && nowCmp.day == selfCmp.day;
}


//是否为昨天
- (BOOL)isYesterday{
    //日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}


@end
