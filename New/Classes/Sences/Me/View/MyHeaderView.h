//
//  MyHeaderView.h
//  New
//
//  Created by lanou3g on 16/8/12.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyHeaderViewDelegate <NSObject>
-(void)JumpToLoginDestinationVC:(nullable UIButton*)button;
@end
@interface MyHeaderView : UIView
// 代理属性
@property (weak,nonatomic) id<MyHeaderViewDelegate> delegate;
@end
