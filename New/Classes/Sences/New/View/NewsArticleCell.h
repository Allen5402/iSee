//
//  NewsArticleCell.h
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsArticleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

- (void)bindData:(News *)news;

@end
