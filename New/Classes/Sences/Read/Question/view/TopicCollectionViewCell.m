//
//  TopicCollectionViewCell.m
//  New
//
//  Created by allen on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "TopicCollectionViewCell.h"
#import "TopButton.h"
#import <Masonry.h>
@implementation TopicCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.imageView];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
    }
    
    return self;
}



- (void)layoutSubviews{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.mas_width);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}

- (void)setTopButton:(TopButton *)topButton{
    _topButton = topButton;
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:topButton.icon]]];
    self.titleLabel.text = topButton.name;
}






@end
