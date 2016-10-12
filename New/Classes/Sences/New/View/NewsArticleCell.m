//
//  NewsArticleCell.m
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "NewsArticleCell.h"
#import "UIImageView+WebCache.h"

@interface NewsArticleCell ()
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;


@end

@implementation NewsArticleCell

- (void)bindData:(News *)news {
    
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    self.titleLabel.text = news.title;
    self.sourceLabel.text = news.source;
    
}

@end
