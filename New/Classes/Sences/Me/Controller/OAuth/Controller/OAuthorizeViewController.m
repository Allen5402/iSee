//
//  OAuthorizeViewController.m
//  New
//
//  Created by lanou3g on 16/8/20.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "OAuthorizeViewController.h"
#import <AFNetworking.h>
#import "SinaAccount.h"
#import "MBProgressHUD+NJ.h"
@interface OAuthorizeViewController ()<UIWebViewDelegate>

@end

@implementation OAuthorizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    webView.delegate = self;
    /*
     URL
     https://api.weibo.com/oauth2/authorize
     请求参数:
     client_id 	true 	string 	申请应用时分配的AppKey。
     redirect_uri 	true 	string 	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。
     */
    NSURL *requestUrl = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=3437247585&redirect_uri=http://www.baidu.com"];
    [webView loadRequest:[NSURLRequest requestWithURL:requestUrl]];
}
#pragma mark - WebView代理方法
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showMessage:@"正在加载数据...."];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUD];
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *string = [NSString stringWithFormat:@"%@",request.URL.absoluteURL];
    NSRange range = [string rangeOfString:@"code="];
    if (range.length > 0) {
        NSUInteger index = range.location + range.length;
        NSString *code = [string substringFromIndex:index];
        // 拿到认证的requestToken发送新的请求，获取AccessToken
        [self obtainAccessTokenWith:code];
        return NO;// 关闭回调网址
    }
    return YES;
}
-(void)obtainAccessTokenWith:(NSString *)code{
    [MBProgressHUD showMessage:@"正在加载数据...."];
    // 创建请求地址
    NSString *requestUrl = @"https://api.weibo.com/oauth2/access_token";
    // 设置请求参数
    NSMutableDictionary *requestDict = [NSMutableDictionary dictionary];
    requestDict[@"code"] = code;
    requestDict[@"client_id"] = @"3437247585";
    requestDict[@"client_secret"] = @"dd10579490420f0335c4212535aaab28";
    requestDict[@"grant_type"] = @"authorization_code";
    requestDict[@"redirect_uri"] = @"www.baidu.com";
    // 发送请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:requestUrl parameters:requestDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        NSLog(@"请求成功>>>>>>>%@",responseObject);
        // 将获取的accessToken同其他账户信息归档
        NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        document = [document stringByAppendingPathComponent:@"account.data"];
        
        SinaAccount *sinaAccount = [SinaAccount SinaAccountWith:responseObject];
        [NSKeyedArchiver archiveRootObject:sinaAccount toFile:document];
        /*
         返回数据
         {
         "access_token": "ACCESS_TOKEN",
         "expires_in": 1234,
         "remind_in":"798114",
         "uid":"12341234"
         }
         */
        [MBProgressHUD hideHUD];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败>>>>>%@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
