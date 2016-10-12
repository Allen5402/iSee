//
//  NewsTabBarController.m
//  New
//
//  Created by nattinessYang on 16/8/12.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "NewsTabBarController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "TopicViewController.h"
#import "MeViewController.h"
#import "BaseNavigationController.h"
#import "ReadViewController.h"
#import "MeNavigationController.h"
@interface NewsTabBarController ()

@end

@implementation NewsTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    
    // 设置子控制器
    
    [self setupChildVC:[[NewsViewController alloc] init] title:@"新闻" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildVC:[[VideoViewController alloc] init] title:@"视频" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVC:[[ReadViewController alloc] init] title:@"主题" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
//    MeViewController *meVC = [[MeViewController alloc]init];
//    meVC.tabBarItem.title = @"我" ;
//    meVC.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
//    meVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
//    MeNavigationController *nav = [[MeNavigationController alloc] initWithRootViewController:meVC];
//    // 添加为子控制器
//    [self  addChildViewController:nav];
    
    [self setupChildVC:[[MeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    // 更换tabBar
    [self setValue:[[UITabBar alloc] init] forKeyPath:@"tabBar"];
    
}

// 初始化子控制器
- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    // 设置文字和图片
    vc.tabBarItem.title = title ;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
//    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
    // 添加为子控制器
    [self  addChildViewController:vc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
