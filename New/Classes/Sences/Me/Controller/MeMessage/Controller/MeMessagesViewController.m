//
//  MeMessagesViewController.m
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MeMessagesViewController.h"

@interface MeMessagesViewController ()
@property (strong,nonatomic) UIView *topView;
@end

@implementation MeMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
//    self.topView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.topView];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated:YES];
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
