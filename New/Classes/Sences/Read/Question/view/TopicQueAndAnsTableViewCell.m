//
//  TopicQueAndAnsTableViewCell.m
//  New
//
//  Created by allen on 16/8/12.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "TopicQueAndAnsTableViewCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "TopicQueAns.h"
#import "UIView+Extension.h"
@implementation TopicQueAndAnsTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //图片
        self.picurlImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.picurlImage];
        
        //头像
        self.headpicurlImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.headpicurlImage];
        
        //名字
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.nameLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.nameLabel];
        
        //职业
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.titleLabel];
        
        
        //别名
        self.aliasLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.aliasLabel.font = [UIFont systemFontOfSize:12];
        self.aliasLabel.numberOfLines = 0;
        [self.contentView addSubview:self.aliasLabel];
        
        //类别
        self.classificationLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.classificationLabel.font = [UIFont systemFontOfSize:10];
        self.classificationLabel.textColor = [UIColor blueColor];
        [self.contentView addSubview:self.classificationLabel];
        
        //关注
        self.concernCountLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.concernCountLabel.font = [UIFont systemFontOfSize:10];
        self.concernCountLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.concernCountLabel];
        
        //问题
        self.questionCountLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.questionCountLabel.font = [UIFont systemFontOfSize:10];
        self.questionCountLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.questionCountLabel];
    
    }
    return self;
}

- (void)layoutSubviews{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-2, self.width, 2)];
    view.backgroundColor = [UIColor colorWithRed:0.8003 green:0.8003 blue:0.7951 alpha:1.0];
    [self.contentView addSubview:view];
    
    //头像
    NSInteger padding1 = 10;
    [self.headpicurlImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(padding1);
        make.top.equalTo(self.mas_top).with.offset(padding1);
        make.height.equalTo(@40);
        make.width.equalTo(@40);
    }];
    self.headpicurlImage.layer.cornerRadius = 20;
    self.headpicurlImage.layer.masksToBounds = YES;
    
    
    //名字
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(15);
        make.left.equalTo(self.headpicurlImage.mas_right).with.offset(5);
    }];
    
    //职业
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(5);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    
    //图片
    [self.picurlImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(5);
        make.left.equalTo(self).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-10, 120));
    }];
    
    //别名
    [self.aliasLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picurlImage.mas_bottom).with.offset(5);
        make.left.equalTo(self).with.offset(20);
        make.right.equalTo(self).with.offset(-20);
    }];
    
    //类别
    [self.classificationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.aliasLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(20);
    }];
    
    //关注
    [self.concernCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.classificationLabel.mas_centerY);
        make.left.equalTo(self.classificationLabel.mas_right).with.offset(5);
    }];
    
    //问题
    [self.questionCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.concernCountLabel.mas_centerY);
        make.left.equalTo(self.concernCountLabel.mas_right).with.offset(5);
    }];
}


- (void)setTopic:(TopicQueAns *)topic{
    _topic = topic;
    [self.headpicurlImage sd_setImageWithURL:[NSURL URLWithString:topic.headpicurl] placeholderImage:nil];
    self.nameLabel.text = topic.name;
    self.titleLabel.text = [NSString stringWithFormat:@"| %@",topic.title];
    [self.picurlImage sd_setImageWithURL:[NSURL URLWithString:topic.picurl] placeholderImage:nil];
    self.aliasLabel.text = topic.alias;
    self.classificationLabel.text = topic.classification;
    if (topic.concernCount > 10000) {
        self.concernCountLabel.text = [NSString stringWithFormat:@"| %.1f万人关注",topic.concernCount/10000.0];
    }else{
        self.concernCountLabel.text = [NSString stringWithFormat:@"| %ld人关注",topic.concernCount];
    }
    
    if (topic.questionCount > 10000) {
        self.questionCountLabel.text = [NSString stringWithFormat:@"| %ld提问",topic.questionCount];
    }else{
        self.questionCountLabel.text = [NSString stringWithFormat:@"| %.1f万提问",topic.questionCount/10000.0];
    }
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
