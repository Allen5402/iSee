//
//  TopicQueAndAnsTableViewCell.h
//  New
//
//  Created by allen on 16/8/12.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopicQueAns;
@interface TopicQueAndAnsTableViewCell : UITableViewCell

@property (strong,nonatomic) UIImageView *headpicurlImage;//头像
@property (strong,nonatomic) UILabel *nameLabel;//姓名
@property (strong,nonatomic) UILabel *titleLabel;//职业
@property (strong,nonatomic) UIImageView *picurlImage;//图片
@property (strong,nonatomic) UILabel *aliasLabel;//别名
@property (strong,nonatomic) UILabel *classificationLabel;//类别
@property (strong,nonatomic) UILabel *concernCountLabel;//关注人数
@property (strong,nonatomic) UILabel *questionCountLabel;//提问人数
@property (strong,nonatomic) UILabel *answerCountLabel;//回答数量

@property (strong,nonatomic) TopicQueAns *topic;

@end
