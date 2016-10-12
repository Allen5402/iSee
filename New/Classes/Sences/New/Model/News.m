//
//  News.m
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "News.h"

@implementation News

// 防崩
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"photos"]) {
        
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"title = %@ array = %@", self.title, self.ads];
}

@end
