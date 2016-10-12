//
//  TopicInfoTableViewCell.h
//  New
//
//  Created by allen on 16/8/13.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TopicQuestion;
@class TopicAnswer;
@interface TopicInfoTableViewCell : UITableViewCell

@property (strong,nonatomic) UIImageView *userHeadPicUrlImage;//用户头像
@property (strong,nonatomic) UILabel *userNameLabel;//用户
@property (strong,nonatomic) UILabel *userContentLabel;//用户评论
@property (strong,nonatomic) UIImageView *specialistHeadPicUrlImage;//吧主头像
@property (strong,nonatomic) UILabel *specialistNameLabel;//吧主
@property (strong,nonatomic) UILabel *specialistContentLabel;//回答
@property (strong,nonatomic) UILabel *cTimeLabel;
@property (strong,nonatomic) UIView *separatorView;//问答分割线
@property (strong,nonatomic) UIView *separatorViewCell;//cell分割线
@property (strong,nonatomic) UIButton *longBtn;

@property (strong,nonatomic) TopicQuestion *question;
@property (strong,nonatomic) TopicAnswer *answer;

@end
