//
//  TopicQuestion.m
//  New
//
//  Created by allen on 16/8/13.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "TopicQuestion.h"

@implementation TopicQuestion

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

- (CGFloat)cellHeight{

    if (!_cellHeight) {
        
     CGRect rect1 = [self.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    _cellHeight = rect1.size.height;
    }
    return _cellHeight;
}

@end
