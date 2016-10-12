//
//  BigScrollView.h
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigScrollView : UIView

/// 大背景
@property (nonatomic, strong) UIScrollView *bigScrollView;

@property (nonatomic, strong) UIView *myView;
/// 头条
@property (nonatomic, strong) UIView *headlineView;
/// 娱乐
@property (nonatomic, strong) UIView *entertainmentView;
/// 时尚
@property (nonatomic, strong) UIView *fashionView;
/// 体育
@property (nonatomic, strong) UIView *sportView;
/// 科技
@property (nonatomic, strong) UIView *technologyView;

@property (nonatomic, strong) UITableView *headlineTableView;

@property (nonatomic, strong) UITableView *entertainmentTableView;

@property (nonatomic, strong) UITableView *fashionTableView;

@property (nonatomic, strong) UITableView *sportTableView;

@property (nonatomic, strong) UITableView *technologyTableView;

@end
