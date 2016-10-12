//
//  BaseSettingViewController.m
//  New
//
//  Created by lanou3g on 16/8/18.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "BaseSettingViewController.h"
#import "PreferencesSettingController.h"
// 模型头文件
#import "MyCellModel.h"
#import "MyCellModelGroup.h"
#import "MyArrowCellModel.h"
#import "MySwitchCellModel.h"
#import "MBProgressHUD+NJ.h"
#import "MeViewCell.h"

#define BoundsW self.view.bounds.size.width
#define BoundsH self.view.bounds.size.height
@interface BaseSettingViewController ()

@end

@implementation BaseSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}
-(NSMutableArray *)ModelArray{
    if (_ModelArray == nil) {
        _ModelArray = [[NSMutableArray alloc]init];
        MyCellModel *cellModel00 = [MyArrowCellModel MyCellModelWithIconName:nil TitleName:@"个人设置" destination:[PreferencesSettingController class]];
        MyCellModelGroup *cellGroup0 = [MyCellModelGroup MyCellModelGrounpWithHeaderTitle:nil FooterTitle:nil];
        cellGroup0.itemArray = @[cellModel00];
        MyCellModel *cellModel10 = [MyArrowCellModel MyCellModelWithIconName:nil TitleName:@"推送设置" destination:nil];
        MyCellModel *cellModel11 = [MyArrowCellModel MyCellModelWithIconName:nil TitleName:@"栏目插件设置" destination:nil];
        MyCellModel *cellModel12 = [MyArrowCellModel MyCellModelWithIconName:nil TitleName:@"离线设置" destination:nil];
        MyCellModelGroup *cellGroup1 = [MyCellModelGroup MyCellModelGrounpWithHeaderTitle:nil FooterTitle:nil];
        cellGroup1.itemArray = @[cellModel10,cellModel11,cellModel12];
        
        MySwitchCellModel *cellModel20 = [MySwitchCellModel MyCellModelWithIconName:nil TitleName:@"为我们评分"];
        MyCellModel *cellModel24 = [MyCellModel MyCellModelWithIconName:nil TitleName:@"关于我们"];
        cellModel24.detailTitle = @"10086";
        MyCellModelGroup *cellGroup2 = [MyCellModelGroup MyCellModelGrounpWithHeaderTitle:nil FooterTitle:nil];
        cellGroup2.itemArray = @[cellModel20,cellModel24];
        
        [_ModelArray addObject:cellGroup0];
        [_ModelArray addObject:cellGroup1];
        [_ModelArray addObject:cellGroup2];
    }return _ModelArray;
}
#pragma mark - ContentTableDataSourceDelegate的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.ModelArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MyCellModelGroup *cellModelGroup = self.ModelArray[section];
    return cellModelGroup.itemArray.count;
}
-(MeViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 创建cell
    MeViewCell *cell = [MeViewCell MeViewCellWithTableView:tableView];
    // 获取到模型
    MyCellModelGroup *cellModelGroup  = self.ModelArray[indexPath.section];
    MyCellModel *cellModel = cellModelGroup.itemArray[indexPath.row];
    cell.itemModel = cellModel;
    return cell;
}
#pragma mark - ContextTableDelegate代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取消选中某一行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MyCellModelGroup *cellModelGroup  = self.ModelArray[indexPath.section];
    MyCellModel *cellModel = cellModelGroup.itemArray[indexPath.row];
    if ([cellModel isKindOfClass:[MyArrowCellModel class]] ) {
        MyArrowCellModel *arrowCell = (MyArrowCellModel *)cellModel;
        [[[arrowCell.destination alloc] init] setTitle:arrowCell.title];
        [self.navigationController pushViewController:[[arrowCell.destination alloc] init] animated:YES];
    }else if ([cellModel isKindOfClass:[MySwitchCellModel class]]){
        return;
    }else{
        cellModel.options();
        return;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,BoundsW, 2)];
    view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,BoundsW, 2)];
    view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    return view;
}



@end
