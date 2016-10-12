//
//  MyNavButton.m
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MyNavButton.h"
#define Font 15
@interface MyNavButton ()
@property (strong,nonatomic) UIFont *titleFount;
@end
@implementation MyNavButton

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {

    }return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    
    }return self;
}
+(MyNavButton *)MyNavButtonWithImageName:(NSString *)imName TitleName:(NSString *)titleName{
    MyNavButton *button = [MyNavButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:titleName forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imName] forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button sizeToFit];
    return button;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    dictionary[NSFontAttributeName] = self.titleFount;
    CGSize titleSize = [@"sdfsdfsf" boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dictionary context:nil].size;
    CGFloat titleX = 0;
    CGFloat titleY = self.bounds.size.height - titleSize.height;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = titleSize.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageViewSize = self.bounds.size.width*0.7;
    return CGRectMake((self.bounds.size.width - imageViewSize) / 2, 0, imageViewSize, imageViewSize);
}
@end
