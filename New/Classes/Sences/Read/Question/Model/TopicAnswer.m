//
//  TopicAnswer.m
//  New
//
//  Created by allen on 16/8/13.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "TopicAnswer.h"

@implementation TopicAnswer

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

- (CGFloat)cellHeight{
    if (!_cellHeight) {
        
    CGRect rect2 = [self.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    _cellHeight = rect2.size.height;
    }
    return _cellHeight;
}

@end
