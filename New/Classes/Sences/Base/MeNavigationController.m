//
//  MeNavigationController.m
//  New
//
//  Created by lanou3g on 16/8/19.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MeNavigationController.h"

@interface MeNavigationController ()

@end

@implementation MeNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}
+(void)initialize{
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.tintColor = [UIColor whiteColor];
    navBar.barTintColor = [UIColor redColor];
    navBar.barStyle = UIBarStyleBlack;
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(pop) Title:nil Image:@"back" HighLight:nil];
    viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(popRootVC) Title:nil Image:@"more16" HighLight:nil];
    [super pushViewController:viewController animated:animated];
}
-(void)pop{
    [self popViewControllerAnimated:YES];
}
-(void)popRootVC{
    [self popToRootViewControllerAnimated:YES];
}
@end
