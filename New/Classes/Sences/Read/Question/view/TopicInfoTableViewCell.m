//
//  TopicInfoTableViewCell.m
//  New
//
//  Created by allen on 16/8/13.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "TopicInfoTableViewCell.h"
#import "UIView+Extension.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "TopicQuestion.h"
#import "TopicAnswer.h"
#import "NSDate+Extention.h"
@implementation TopicInfoTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //网友头像
        self.userHeadPicUrlImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.userHeadPicUrlImage];
        
        //网友名字
        self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.userNameLabel.font = [UIFont systemFontOfSize:12];
        self.userNameLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.userNameLabel];
        
        //网友评论
        self.userContentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.userContentLabel.font = [UIFont systemFontOfSize:15];
        self.userContentLabel.numberOfLines = 0;
        [self.contentView addSubview:self.userContentLabel];
        
        //分割线
        self.separatorView = [[UIView alloc]initWithFrame:CGRectZero];
        self.separatorView.backgroundColor = [UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1.0];
        [self.contentView addSubview:self.separatorView];
        
        //吧主头像
        self.specialistHeadPicUrlImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.specialistHeadPicUrlImage];
        
        //吧主名字
        self.specialistNameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.specialistNameLabel.font = [UIFont systemFontOfSize:12];
        self.specialistNameLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.specialistNameLabel];
        
        //吧主回答
        self.specialistContentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.specialistContentLabel.font = [UIFont systemFontOfSize:15];
        self.specialistContentLabel.numberOfLines = 0;
        [self.contentView addSubview:self.specialistContentLabel];
        
        //时间戳
        self.cTimeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.cTimeLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.cTimeLabel];
        
        //展开button
        self.longBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.longBtn setTitle:@"下拉" forState:(UIControlStateNormal)];
        self.longBtn.titleLabel.font = [UIFont systemFontOfSize:9];
        self.longBtn.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:self.longBtn];
        
        //cell分割线
        self.separatorViewCell = [[UIView alloc]initWithFrame:CGRectZero];
        self.separatorViewCell.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
        [self.contentView addSubview:self.separatorViewCell];
        
    }
    return self;
}


- (void)layoutSubviews{
    
    
    //网友头像
    NSInteger padding1 = 10;
    [self.userHeadPicUrlImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(padding1);
        make.top.equalTo(self.mas_top).with.offset(padding1);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    self.userHeadPicUrlImage.layer.cornerRadius = 10;
    self.userHeadPicUrlImage.layer.masksToBounds = YES;
    
    //网友姓名
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(15);
        make.left.equalTo(self.userHeadPicUrlImage.mas_right).with.offset(5);
    }];
    
    //网友评论
    [self.userContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userHeadPicUrlImage.mas_bottom).offset(5);
        make.left.equalTo(self.userNameLabel.mas_left);
        make.right.equalTo(self).with.offset(-20);
    }];
    
    //分割线
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userContentLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self).with.offset(35);
        make.right.equalTo(self).with.offset(-10);
        make.height.equalTo(@0.3);
    }];
    
    //吧主头像
    [self.specialistHeadPicUrlImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separatorView.mas_bottom).with.offset(10);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    self.specialistHeadPicUrlImage.layer.cornerRadius = 10;
    self.specialistHeadPicUrlImage.layer.masksToBounds = YES;
    
    //吧主名字
    [self.specialistNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userContentLabel.mas_bottom).with.offset(40);
        make.left.equalTo(self.specialistHeadPicUrlImage.mas_right).with.offset(5);
    }];
    
    //吧主回答
    [self.specialistContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.specialistHeadPicUrlImage.mas_bottom).with.offset(5);
        make.left.equalTo(self.specialistNameLabel.mas_left);
        make.right.equalTo(self).with.offset(-20);
//        make.bottom.equalTo(self).with.offset(-30);
    }];
    
    //时间戳
    [self.cTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.specialistContentLabel.mas_bottom).with.offset(5);
        make.bottom.equalTo(self).with.offset(-5);
        make.left.equalTo(self.specialistContentLabel);
    }];
    
    
    
    //cell分割线
    [self.separatorViewCell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cTimeLabel.mas_bottom).with.offset(5);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(0);
        make.height.equalTo(@1);
    }];
    
}




- (void)setQuestion:(TopicQuestion *)question{
    _question = question;
    [self.userHeadPicUrlImage sd_setImageWithURL:[NSURL URLWithString:question.userHeadPicUrl] placeholderImage:nil];
    self.userNameLabel.text = question.userName;
    self.userContentLabel.text = question.content;
}

- (void)setAnswer:(TopicAnswer *)answer{
    _answer = answer;
    [self.specialistHeadPicUrlImage sd_setImageWithURL:[NSURL URLWithString:answer.specialistHeadPicUrl] placeholderImage:nil];
    self.specialistNameLabel.text = answer.specialistName;
    self.specialistContentLabel.text = answer.content;
    
    //时间戳赋值
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    
    NSDate *creat = [NSDate dateWithTimeIntervalSince1970:answer.cTime/1000];
    NSString *datestr2 = [formatter stringFromDate:creat];
    
    if (creat.isThisYear) {//今年
        if (creat.isToday) {//今天
            NSDateComponents *cmps = [[NSDate date] deltaFrom:creat];
            
            if (cmps.hour >= 1) {//大于1小时
                self.cTimeLabel.text = [NSString stringWithFormat:@"%zd小时前",cmps.hour];
            }else if (cmps.minute >= 1){//大于1分钟
                self.cTimeLabel.text = [NSString stringWithFormat:@"%zd分钟前",cmps.minute];
            }else{//小于1分钟
                self.cTimeLabel.text = @"刚刚";
            }
        } else if (creat.isYesterday){//昨天
            formatter.dateFormat = @"昨天 HH:mm:ss";
            self.cTimeLabel.text = [formatter stringFromDate:creat];
        }else{//其他
            formatter.dateFormat = @"MM-dd HH:mm:ss";
            self.cTimeLabel.text = [formatter stringFromDate:creat];
        }
    } else {//非今年
        self.cTimeLabel.text = datestr2;
    }
    
    /*
    //longBtn
    if (self.height > 200) {
        [self.longBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.height.equalTo(@5);
        }];
    }else{
        [self.longBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(0));
        }];
    }
     */
    
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
