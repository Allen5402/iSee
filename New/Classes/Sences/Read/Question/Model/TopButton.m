//
//  TopButton.m
//  New
//
//  Created by allen on 16/8/13.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "TopButton.h"

@implementation TopButton

- (void)setValue:(id)value forKey:(NSString *)key{
    key = [key isEqualToString:@"id"] ? @"ID" : key;
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}


@end
