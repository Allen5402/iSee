//
//  BigScrollView.m
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "BigScrollView.h"

@implementation BigScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置大背景scrollView
        [self bindBigScorllView];
    }
    return self;
}

- (void)bindBigScorllView {
    
    self.bigScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    // 关闭水平滚动条
    self.bigScrollView.showsHorizontalScrollIndicator = NO;
    self.bigScrollView.contentOffset = CGPointMake(0, 0);
    self.bigScrollView.contentSize = CGSizeMake(5 * kScreenSizeWidth, 0);
    // 按页滚动
    self.bigScrollView.pagingEnabled = YES;
    for (int i = 0; i < 5; i++) {
        self.myView = [[UIView alloc] initWithFrame:CGRectMake(i * kScreenSizeWidth , 0, kScreenSizeWidth, self.bigScrollView.frame.size.height)];
        self.myView.tag = 100 + i;
        [self.bigScrollView addSubview:self.myView];
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, self.bigScrollView.frame.size.height) style:UITableViewStylePlain];
        tableView.tag = 200 + i;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.myView addSubview:tableView];
    }
    [self addSubview:self.bigScrollView];
    // 设置页面
    [self bindViews];
    
}

- (void)bindViews {
    
    self.headlineView = [self.bigScrollView viewWithTag:100];
    self.entertainmentView = [self.bigScrollView viewWithTag:101];
    self.fashionView = [self.bigScrollView viewWithTag:102];
    self.sportView = [self.bigScrollView viewWithTag:103];
    self.technologyView = [self.bigScrollView viewWithTag:104];
    
    self.headlineTableView = [self.headlineView viewWithTag:200];
    self.entertainmentTableView = [self.entertainmentView viewWithTag:201];
    self.fashionTableView = [self.fashionView viewWithTag:202];
    self.sportTableView = [self.sportView viewWithTag:203];
    self.technologyTableView = [self.technologyView viewWithTag:204];
    
}


@end
