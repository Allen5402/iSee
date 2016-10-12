//
//  TaskViewController.m
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "TaskViewController.h"
#import "MBProgressHUD+NJ.h"
@interface TaskViewController ()<UIWebViewDelegate>

@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动广场";
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    webView.scalesPageToFit = YES;
    self.view = webView;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://3g.163.com/ntes/special/00340BF8/hdlb.html"]]];
    // Do any additional setup after loading the view.
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showMessage:@"正在加载信息。。。。。"];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUD];
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
