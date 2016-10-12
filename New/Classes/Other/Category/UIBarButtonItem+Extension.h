//
//  UIBarButtonItem+Extension.h
//  New
//
//  Created by lanou3g on 16/8/19.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+(UIBarButtonItem *)itemWithTarget:(id)target Action:(SEL)action Title:(NSString *)title Image:(NSString *)image HighLight:(NSString *)highLight;
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
