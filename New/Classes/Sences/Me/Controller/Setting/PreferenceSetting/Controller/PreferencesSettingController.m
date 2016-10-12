//
//  PreferencesSettingController.m
//  New
//
//  Created by lanou3g on 16/8/19.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "PreferencesSettingController.h"
#import "MyCellModel.h"
#import "MyCellModelGroup.h"
#import "MyArrowCellModel.h"
#import "MySwitchCellModel.h"
#import "MBProgressHUD+NJ.h"
#import "MeViewCell.h"
@implementation PreferencesSettingController
-(NSMutableArray *)ModelArray{
    NSMutableArray *array = [NSMutableArray array];
    MyCellModel *cellModel00 = [MyArrowCellModel MyCellModelWithIconName:nil TitleName:@"我的信息" destination:nil];
    MyCellModelGroup *cellGroup0 = [MyCellModelGroup MyCellModelGrounpWithHeaderTitle:nil FooterTitle:nil];
    cellGroup0.itemArray = @[cellModel00];
    
    MySwitchCellModel *cellModel20 = [MySwitchCellModel MyCellModelWithIconName:nil TitleName:@"为我们评分"];
    MyCellModel *cellModel24 = [MyCellModel MyCellModelWithIconName:nil TitleName:@"关于我们"];
    cellModel24.detailTitle = @"10086";
    MyCellModelGroup *cellGroup2 = [MyCellModelGroup MyCellModelGrounpWithHeaderTitle:nil FooterTitle:nil];
    cellGroup2.itemArray = @[cellModel20,cellModel24];
    
    [array addObject:cellGroup0];
    [array addObject:cellGroup2];
    return array;
}


@end
