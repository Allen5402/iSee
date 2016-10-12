//
//  MyHeaderButton.m
//  New
//
//  Created by lanou3g on 16/8/12.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MyHeaderButton.h"
@interface MyHeaderButton ()
@property (copy,nonatomic) NSString *imageN;
@property (copy,nonatomic) NSString *titleN;

@property (strong,nonatomic) UIFont *titleFount;
@end
@implementation MyHeaderButton

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
// 画一个带有圆环的头像
-(UIImage *)DrawImageWith:(NSString *)imageName{
    UIImage *old = [UIImage imageNamed:imageName];
    return old;
}
+(MyHeaderButton *)ButtonWithImageName:(NSString *)imageName TitleName:(NSString *)titleName{
    MyHeaderButton *button = [[MyHeaderButton alloc]init];
    // 生成一张新的图片
    UIImage *oldImage = [UIImage imageNamed:imageName];
    
    // 1、开启一个位图上下文(大于图片尺寸，用于生成外部圈圈)
    CGFloat margin = 2;// 边缘的宽度
    CGFloat bottomContextW = oldImage.size.width + 2 * margin;
    CGFloat bottomContextH = oldImage.size.height + 2 * margin;
    CGFloat maxValue = bottomContextW > bottomContextH ? bottomContextW :bottomContextH;
    CGSize bottomContextSize = CGSizeMake(maxValue, maxValue);
    UIGraphicsBeginImageContextWithOptions(bottomContextSize, NO, 0.0);
    // 2、获得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 3、画一个大圆
    CGFloat bigCircleRadius = maxValue / 2;
    CGFloat bigCircleCenter = bigCircleRadius;
    CGContextAddArc(ctx, bigCircleCenter, bigCircleCenter, bigCircleRadius, 0, M_PI * 2, 0);
    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
    // 3、画一个小的圆
    CGFloat circleRadius = (maxValue - margin * 2) / 2 ;
    CGFloat circleCenterX = maxValue / 2;
    CGFloat circleCenterY = maxValue / 2;
    CGContextAddArc(ctx, circleCenterX, circleCenterY, circleRadius, 0, M_PI * 2, 0);
    [[UIColor greenColor] set];
    CGContextClip(ctx);// 切除多余的部分
    //4、把oldImage画到小圆内
    [oldImage drawInRect:CGRectMake(margin, margin, circleRadius * 2, circleRadius * 2)];
    //5、从上下文中获取到新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //6、把图片保存到本地
    
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"] atomically:YES];
    //7、结束位图上下文
    UIGraphicsEndImageContext();
    // 设置属性
    [button setImage:newImage forState:UIControlStateNormal];
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
