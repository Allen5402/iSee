//
//  MeViewController.m
//  New
//
//  Created by nattinessYang on 16/8/12.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MeViewController.h"
#import "MyHeaderView.h"
// 控制器头文件
#import "LoginInViewController.h"
#import "MeMessagesViewController.h"
#import "SuggestionViewController.h"
#import "EmailViewController.h"
#import "ActivityViewController.h"
#import "WalletViewController.h"
#import "TaskViewController.h"
#import "MallViewController.h"

#import "LoginInViewController.h"


#import "ReadingViewController.h"
#import "BaseSettingViewController.h"
#import "PreferencesSettingController.h"
// 模型头文件
#import "MyCellModel.h"
#import "MyCellModelGroup.h"
#import "MyArrowCellModel.h"
#import "MySwitchCellModel.h"

#import "MeViewCell.h"

#import "MBProgressHUD+NJ.h"
#define BoundsW self.view.bounds.size.width
#define BoundsH self.view.bounds.size.height
@interface MeViewController ()<UITableViewDataSource,UITableViewDelegate,MyHeaderViewDelegate>
@property (strong,nonatomic) UITableView *ContentTableView; // 内容TableView
// cell模型数组
@property (strong,nonatomic) NSMutableArray *ModelArray;
// 打电话的VIew
@property (strong,nonatomic) UIWebView *webView;
@end

@implementation MeViewController
-(UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc]init];
    }return _webView;
}
-(NSMutableArray *)ModelArray{
    if (_ModelArray == nil) {
        _ModelArray = [[NSMutableArray alloc]init];
        MyCellModel *cellModel00 = [MyArrowCellModel MyCellModelWithIconName:nil TitleName:@"我的消息" destination:[MeMessagesViewController class]];
        MyCellModelGroup *cellGroup0 = [MyCellModelGroup MyCellModelGrounpWithHeaderTitle:nil FooterTitle:nil];
        cellGroup0.itemArray = @[cellModel00];
        MyCellModel *cellModel10 = [MyArrowCellModel MyCellModelWithIconName:nil TitleName:@"金币商城" destination:[MallViewController class]];
        MyCellModel *cellModel11 = [MyArrowCellModel MyCellModelWithIconName:nil TitleName:@"活动广场" destination:[TaskViewController class]];
        MyCellModel *cellModel12 = [MyArrowCellModel MyCellModelWithIconName:nil TitleName:@"我的钱包" destination:[WalletViewController class]];
        cellModel12.detailTitle = @"小子，该充钱了！！";
        MyCellModelGroup *cellGroup1 = [MyCellModelGroup MyCellModelGrounpWithHeaderTitle:nil FooterTitle:nil];
        cellGroup1.itemArray = @[cellModel10,cellModel11,cellModel12];
        
        MySwitchCellModel *cellModel20 = [MySwitchCellModel MyCellModelWithIconName:nil TitleName:@"夜间模式"];
        MyCellModel *cellModel21 = [MyArrowCellModel MyCellModelWithIconName:nil TitleName:@"离线阅读" destination:[ReadingViewController class]];
        MyCellModel *cellModel22 = [MyCellModel MyCellModelWithIconName:nil TitleName:@"检查更新"];
        cellModel22.options = ^(){
            // 检查更新的代码块
            [MBProgressHUD showMessage:@"正在检查版本信息。。。。"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
        };
        MyCellModel *cellModel23 = [MyCellModel MyCellModelWithIconName:nil TitleName:@"清除缓存"];
        // 获取到需要清除的文件路径
        NSString *CachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//        NSString *deletePath = [CachesPath stringByAppendingPathComponent:@"需要拼接的目标路径"];
        NSString *dest = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"123.mp3"];
        __weak typeof(cellModel23)weakCellModel = cellModel23;
        __weak typeof(self) weakSelf = self;
        // 计算路径中文件的大小
        cellModel23.detailTitle = [NSString stringWithFormat:@"(%.1fM)",[self capacityOfFile:CachesPath] / (1000 * 1000.0)];
        cellModel23.options = ^(){
            [MBProgressHUD showMessage:@"正在清除缓存"];
            // 执行清除方法
            [self deleteFileAtPath:CachesPath];
            // 清除完成设置DetailTitle
            weakCellModel.detailTitle = @"(0.0M)";
            // 刷新表格
            [weakSelf.ContentTableView reloadData];
            [MBProgressHUD hideHUD];
        };
        MyCellModel *cellModel24 = [MyCellModel MyCellModelWithIconName:nil TitleName:@"关于我们"];
         cellModel24.detailTitle = @"010-";
        __weak typeof(cellModel24)cell24 = cellModel24;
        cellModel24.options = ^(){
            // 拨打电话功能
            NSURL *phoneUrl = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",cell24.detailTitle]];
            [self.webView loadRequest:[NSURLRequest requestWithURL:phoneUrl]];
        };
        MyCellModelGroup *cellGroup2 = [MyCellModelGroup MyCellModelGrounpWithHeaderTitle:nil FooterTitle:nil];
        cellGroup2.itemArray = @[cellModel20,cellModel21,cellModel22,cellModel23,cellModel24];
        
        [_ModelArray addObject:cellGroup0];
        [_ModelArray addObject:cellGroup1];
        [_ModelArray addObject:cellGroup2];
    }return _ModelArray;
}
// 计算文件大小的方法
-(long long)capacityOfFile:(NSString *)path{
 long long capacity = 0;
    // 1、获取文件管理对象
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 2、判断传入的文件或文件夹是否存在，如果不存在返回0.0
    BOOL isDirectory;
    BOOL exists = [fileManager fileExistsAtPath:path isDirectory:&isDirectory];
    if (!exists) return 0.0;
    // 3、判断传入的路径是否是文件夹
    if (isDirectory) {// 是文件夹
        // 获取目录中包含的路径字符串数组
        NSArray *pathContentsArray = [fileManager contentsOfDirectoryAtPath:path error:nil];
        for (NSString *subPath in pathContentsArray) {
            NSString *newPath = [path stringByAppendingPathComponent:subPath];
            capacity += [self capacityOfFile:newPath];
        }
    }else{ // 不是文件夹
        NSDictionary *fileDict = [fileManager attributesOfItemAtPath:path error:nil];
        return [fileDict[NSFileSize] longLongValue];
    }
    return capacity;
}
// 删除文件的方法
-(void)deleteFileAtPath:(NSString *)path{
    // 1、获取文件管理单例对象
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 2、判断路径是否有效
    [fileManager removeItemAtPath:path error:nil];
    
}
// bottomScrollView
-(void)initialize{
    //内容TableView
    self.ContentTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, BoundsH -49) style:(UITableViewStyleGrouped)];
    self.ContentTableView.backgroundColor = [UIColor whiteColor];
    self.ContentTableView.delegate = self;
    self.ContentTableView.dataSource= self;
    self.ContentTableView.bounces = NO;
    //创建头部视图
    MyHeaderView *view = [[[NSBundle mainBundle]loadNibNamed:@"MyHeaderView" owner:nil options:nil] lastObject];
    view.delegate = self;//作为头部视图的代理
    self.ContentTableView.tableHeaderView = view;
    // 注册cell
    [self.ContentTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Content_cell"];
    [self.view addSubview:self.ContentTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.navigationItem.title = @"个人中心";
    [super viewWillAppear:animated];
}

#pragma mark - 视图生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.navigationController.navigationBar.translucent = NO;
    self.ContentTableView.autoresizingMask = UIViewAutoresizingNone;
    
    
    
    [self initialize]; // 初始化内部控件
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    // 设置statusbar的背景色
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    CALayer *backLayer = [CALayer layer];
//    backLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 20);
//    backLayer.backgroundColor = [UIColor redColor].CGColor;
//    backLayer.zPosition = 10;
//    [self.view.layer addSublayer:backLayer];
}
#pragma mark - MyHeaderViewDelegate代理方法
-(void)JumpToLoginDestinationVC:(UIButton *)button
{
    if (button.tag == 1002) {
        BaseSettingViewController *setting = [[BaseSettingViewController alloc]init];
        [self.navigationController pushViewController:setting animated:YES];
        return;
    }else if (button.tag == 1003){
        PreferencesSettingController *prefer = [[PreferencesSettingController alloc]init];
        [self.navigationController pushViewController:prefer animated:YES];
        return;
    }
    LoginInViewController *loginVC = [[LoginInViewController alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
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
