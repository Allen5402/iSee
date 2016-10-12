//
//  MyHeaderView.m
//  New
//
//  Created by lanou3g on 16/8/12.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MyHeaderView.h"
#import "MyHeaderButton.h"

@interface MyHeaderView ()
@property (weak, nonatomic) IBOutlet UIButton *settingAction;
@property (strong,nonatomic) MyHeaderButton *headerButton;
@property (weak, nonatomic) IBOutlet UIButton *HistoryButton;
// View内容
@property (copy,nonatomic) NSString *imageName;
@property (copy,nonatomic) NSString *textName;
@end
@implementation MyHeaderView

#pragma mark - 添加自定义Button的方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        _headerButton = [MyHeaderButton ButtonWithImageName:@"icon" TitleName:@"点击登录"];
        [_headerButton addTarget:self action:@selector(LoginIconTouch) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_headerButton];
    }
    return self;
}
// 代理执行登录方法
-(void)LoginIconTouch{
    [self.delegate JumpToLoginDestinationVC:nil];
}
-(void)awakeFromNib{
    // 添加自定义的IconButton
    _headerButton = [MyHeaderButton ButtonWithImageName:@"icon" TitleName:@"点击登录"];
    [_headerButton addTarget:self action:@selector(LoginIconTouch) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_headerButton];
    // 给按钮添加事件
    [self.settingAction addTarget:self action:@selector(headerOtherButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.HistoryButton addTarget:self action:@selector(headerOtherButton:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)layoutSubviews{
//    int i = 0 ;
    _headerButton.center = self.center;
    CGFloat HeaderButtonW = self.bounds.size.width / 5;
    CGSize size = CGSizeMake(HeaderButtonW, HeaderButtonW);
    [_headerButton setFrame:CGRectMake(self.center.x - (HeaderButtonW * 0.5), 20, size.width, size.height)];
//    for (UIView *subView in self.subviews) {
//        if ([subView isKindOfClass:[UIButton class]] && ![subView isKindOfClass:[MyHeaderButton class]] && subView.tag != 1002) {
//            UIButton *btn = (UIButton *)subView;
//            CGFloat buttonW = self.bounds.size.width / 4;
//            CGFloat buttonH = 50;
//            CGFloat buttonY = self.bounds.size.height - buttonH;
//            CGFloat buttonX = buttonW * i;
//            [btn setTitle:@"傻逼一号" forState:UIControlStateNormal];
//            [btn setFrame:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
//            [btn addTarget:self action:@selector(headerOtherButton:) forControlEvents:UIControlEventTouchUpInside];
//            subView.backgroundColor = [UIColor whiteColor];
//            i += 1;
//        }
//    }
}
-(void)headerOtherButton:(UIButton *)sender{
    [self.delegate JumpToLoginDestinationVC:sender];
}
@end
