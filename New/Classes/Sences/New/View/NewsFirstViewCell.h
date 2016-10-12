//
//  NewsFirstViewCell.h
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SMPageControl.h>

@interface NewsFirstViewCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *myImageView;
@property (nonatomic, strong) NSMutableArray *imageArr;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) SMPageControl *pageControl;

- (void)addAllViews;

@end
