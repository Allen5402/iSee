//
//  OAuthButton.m
//  New
//
//  Created by lanou3g on 16/8/23.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "OAuthButton.h"
@interface OAuthButton ()
@property (copy,nonatomic) NSString *imageN;
@property (copy,nonatomic) NSString *titleN;

@property (strong,nonatomic) UIFont *titleFount;
@end
@implementation OAuthButton
//初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        [self initialize];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }return self;
}
-(void)initialize{
    // title属性
    UIFont *font = [UIFont systemFontOfSize:14];
    self.titleFount = font;
    self.titleLabel.tintColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    // imageView属性
    
    self.imageView.contentMode = UIViewContentModeScaleToFill;
}
+(OAuthButton *)ButtonWithImageName:(NSString *)imageName TitleName:(NSString *)titleName{
    OAuthButton *button = [[OAuthButton alloc]init];
    // 设置属性
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitle:titleName forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button sizeToFit];
    return button;
}
// 设置子控件的Frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    dictionary[NSFontAttributeName] = self.titleFount;
#warning BUG(001) 没拿到文字的尺寸
    CGSize titleSize = [@"sdfsdfsf" boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dictionary context:nil].size;
    CGFloat titleX = 0;
    CGFloat titleY = self.bounds.size.height - titleSize.height;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = titleSize.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    //设置控件大小，间距
#warning BUG(002)图片的大小是四值
    CGFloat imageViewSize = self.bounds.size.width*0.7;
    return CGRectMake((self.bounds.size.width - imageViewSize) / 2, 0, imageViewSize, imageViewSize);
}


@end
