//
//  ToolForHeight.h
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToolForHeight : NSObject

// 声明类方法，计算文本高度
+ (CGFloat)textHeightWithText:(NSString *)text
                         font:(UIFont *)font
                        width:(CGFloat)width;

// 计算图片高度
+ (CGFloat)imageHeightWithImage:(UIImage *)image;

@end
