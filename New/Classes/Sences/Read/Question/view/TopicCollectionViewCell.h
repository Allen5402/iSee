//
//  TopicCollectionViewCell.h
//  New
//
//  Created by allen on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TopButton;
@interface TopicCollectionViewCell : UICollectionViewCell

//模型
@property (nonatomic,strong) TopButton *topButton;

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;

@end
