//
//  TopicQueAns.h
//  New
//
//  Created by allen on 16/8/12.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicQueAns : NSObject

@property (copy,nonatomic) NSString *expertId;//ID
@property (copy,nonatomic) NSString *headpicurl;//头像
@property (copy,nonatomic) NSString *name;//姓名
@property (copy,nonatomic) NSString *title;//职业
@property (copy,nonatomic) NSString *picurl;//图片
@property (copy,nonatomic) NSString *alias;//别名
@property (copy,nonatomic) NSString *classification;//类别
@property (assign,nonatomic) NSInteger concernCount;//关注人数
@property (assign,nonatomic) NSInteger questionCount;//提问人数
@property (assign,nonatomic) NSInteger answerCount;//回答数量


@end
