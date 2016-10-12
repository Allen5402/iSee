//
//  UIImage+Extension.m
//  New
//
//  Created by lanou3g on 16/8/19.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+(UIImage *)imageWithResuableImage:(NSString *)image{
    UIImage *oldimage = [UIImage imageNamed:image];
    CGFloat TopMargin = oldimage.size.width * 0.5;
    CGFloat LeftMargin = oldimage.size.height * 0.5;
    return [oldimage resizableImageWithCapInsets:UIEdgeInsetsMake(LeftMargin, TopMargin, LeftMargin, TopMargin)];
}

- (UIImage *)circleImage
{
    // NO代表透明
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    // 获得上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(context, rect);
    
    // 裁剪
    CGContextClip(context);
    
    // 将图片画上去
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
@end
