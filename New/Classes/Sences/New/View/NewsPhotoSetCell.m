//
//  NewsPhotoSetCell.m
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "NewsPhotoSetCell.h"
#import "UIImageView+WebCache.h"

@interface NewsPhotoSetCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *CenterImageView;
@property (weak, nonatomic) IBOutlet UIImageView *RightImageView;

@end

@implementation NewsPhotoSetCell

- (void)bindData:(News *)news {
    
    self.titleLabel.text = news.title;
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    if (news.imgextra.count >= 2) {
        [self.CenterImageView sd_setImageWithURL:[NSURL URLWithString:news.imgextra[0][@"imgsrc"]]];
        [self.RightImageView sd_setImageWithURL:[NSURL URLWithString:news.imgextra[1][@"imgsrc"]]];
    }
    
}

@end
