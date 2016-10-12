//
//  LoginInViewController.m
//  New
//
//  Created by lanou3g on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "LoginInViewController.h"

#import "MBProgressHUD+NJ.h"
#import "UIView+Extension.h"
#import "OAuthorizeViewController.h"
#import "OAuthButton.h"
#import "RegisterController.h"
@interface LoginInViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;//账号
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;// 密码
@property (weak, nonatomic) IBOutlet UISwitch *rememberSW; //记住密码
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSW; // 自动登录
@property (weak, nonatomic) IBOutlet UIButton *LoginButton; // 登录按钮
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIButton *goRegisterButton;
@property (weak, nonatomic) IBOutlet UIImageView *OAuthImageView;

@end

@implementation LoginInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置默认值
    [self initialize];
    // 监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TextFieldTextChange) name:UITextFieldTextDidChangeNotification object:self.accountTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TextFieldTextChange) name:UITextFieldTextDidChangeNotification object:self.passwordTextField];
    // 监听按钮
    [self.rememberSW addTarget:self action:@selector(rememberSWValueChange) forControlEvents:UIControlEventValueChanged];
    [self.autoLoginSW addTarget:self action:@selector(autoLoginSWValueChange) forControlEvents:UIControlEventValueChanged];
}
// 顶部返回按钮
- (IBAction)backButton:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)viewDidAppear:(BOOL)animated{
    [self.accountTextField becomeFirstResponder];
}
-(void)initialize{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(popVC) Title:nil Image:@"back_d" HighLight:nil];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(popRootVC) Title:nil Image:@"more16" HighLight:nil];
    // loginButton
    [self.LoginButton  setBackgroundImage:[UIImage imageWithResuableImage:@"concern_border"] forState:UIControlStateNormal];
    // 设置记住密码/自动登录的状态
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.rememberSW.on = [userDefaults boolForKey:@"rememberSWStatus"];
    self.autoLoginSW.on = [userDefaults boolForKey:@"autoLoginSWStatus"];
    // TextField的代理
    self.accountTextField.delegate = self;
    self.passwordTextField.delegate = self;
    // 给按钮添加背景图
    self.bgImageView.image = [UIImage imageWithResuableImage:@"account_button"];
    [self.goRegisterButton setBackgroundImage:[UIImage imageWithResuableImage:@"login_forgot_button"] forState:UIControlStateNormal];
    // 添加OAuth登录按钮
    self.OAuthImageView.image = [UIImage imageWithResuableImage:@"account_button"];
    self.OAuthImageView.userInteractionEnabled = YES;
    OAuthButton *sinaBtn = [OAuthButton ButtonWithImageName:@"account_snslogin_icon_3" TitleName:@"新浪"];
    OAuthButton *tencentBtn = [OAuthButton ButtonWithImageName:@"anchor_sociaty_qq" TitleName:@"QQ"];
    [tencentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sinaBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sinaBtn.frame = CGRectMake(10, 10, 50, 50);
    tencentBtn.frame = CGRectMake(60, 10, 50, 50);
    [sinaBtn addTarget:self action:@selector(sinaLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.OAuthImageView addSubview:sinaBtn];
    [self.OAuthImageView addSubview:tencentBtn];
}
/*************************POP方法*****************************/
-(void)popRootVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)popVC{
    [self.navigationController popViewControllerAnimated:YES];
}


// 通知
-(void)TextFieldTextChange{
    self.LoginButton.enabled = (self.passwordTextField.text.length && self.accountTextField.text.length);
}
// 记住密码跟自动登录相关联
-(void)rememberSWValueChange{
    // 存储偏好设置
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    [userdefault setBool:self.rememberSW.isOn forKey:@"rememberSWStatus"];
    [userdefault synchronize];// 同步设置
}
-(void)autoLoginSWValueChange{
    // 存储偏好设置
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    [userdefault setBool:self.autoLoginSW.isOn forKey:@"autoLoginSWStatus"];
    [userdefault synchronize]; // 同步设置
    if (self.autoLoginSW.isOn) {
        // 修改记住密码的状态
        [self.rememberSW setOn:YES animated:YES];
    }
}
// 删除通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 注册
- (IBAction)Register:(UIButton *)sender {
//    RegisterViewController *reg = [[RegisterViewController alloc]init];
//    __weak typeof(self)weakself = self;
//    reg.loginblock = ^(PersonInfo *person){
//        weakself.accountTextField.text = person.userName;
//        weakself.passwordTextField.text = person.password;
//        self.LoginButton.enabled = YES;
//    };
//    [self.navigationController pushViewController:reg animated:YES];
    RegisterController *regist = [[RegisterController alloc]init];
    [self.navigationController pushViewController:regist animated:YES];
}
// 登录按钮
- (IBAction)LoginAction:(UIButton *)sender {
    [MBProgressHUD showMessage:@"登录中......"];// 显示遮盖
    EMError *error = [[EMClient sharedClient] loginWithUsername:self.accountTextField.text password:self.passwordTextField.text];
    if (!error) {
        [[EMClient sharedClient].options setIsAutoLogin:NO];// 设置为自动登录
        [MBProgressHUD showSuccess:@"登录成功"];// 提示信息
        [MBProgressHUD hideHUD];// 隐藏遮盖
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        NSLog(@"%@",error);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];// 隐藏遮盖
        });
    }
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUD];// 隐藏遮盖
//        [MBProgressHUD showSuccess:@"登录成功"];// 提示信息
//        [self.navigationController popToRootViewControllerAnimated:YES];
//        
//    });
}
#pragma mark - 第三方登录按钮
- (IBAction)sinaLoginAction:(UIButton *)sender {
    OAuthorizeViewController *oauth = [OAuthorizeViewController new];
    [self.navigationController pushViewController:oauth animated:YES];
}

#pragma mark - TextField代理方法
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)strin{
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
