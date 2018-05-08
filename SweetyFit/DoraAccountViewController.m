//
//  DoraAccountViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 7/5/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraAccountViewController.h"


#import "NSString+MD5.h"
#import "DoraCommonHeader.h"
#import "DoraColorDefineHeader.h"
#import "UIButton+DoraLoginButtonView.h"
#import "DoraSigninInfoViewController.h"
#import "DoraRootNavigationViewController.h"

@interface DoraAccountViewController ()

@end

@implementation DoraAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewBackground];
    [self initialUIElements];
    [self bindEvents];
}

- (void) setViewBackground {
    NSString *imageName = @"loginbg";
    UIImage *bgImage = [UIImage imageNamed:imageName];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    UIView *maskLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight)];
    
    bgImageView.frame = CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight);
    [maskLayer setBackgroundColor:[UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.85]];
    
    [self.view addSubview:bgImageView];
    [self.view addSubview:maskLayer];
}

- (void) initialUIElements {
    self.signinView = [[DoraSigninView alloc] init];
    self.loginView = [[DoraLoginView alloc] init];
    self.pwdView = [[DoraLosePwdView alloc] init];
    
    self.signinView.hidden = YES;
    self.pwdView.hidden = YES;
    
    
    [self.view addSubview:_signinView];
    [self.view addSubview:_loginView];
    [self.view addSubview:_pwdView];
}

- (void) bindEvents {
    [_signinView.signinBtn addTarget:self action:@selector(SignIn) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.loginBtn addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchUpInside];
    [_pwdView.submitBtn addTarget:self action:@selector(ChangePwd) forControlEvents:UIControlEventTouchUpInside];
    
    [_signinView.loginLabelBtn addTarget:self action:@selector(showLoginView) forControlEvents:UIControlEventTouchUpInside];
    
    [_loginView.goSigninBtn addTarget:self action:@selector(showSigninView) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.goPwdBtn addTarget:self action:@selector(showPwdView) forControlEvents:UIControlEventTouchUpInside];
    
    [_pwdView.goSigninBtn addTarget:self action:@selector(showSigninView) forControlEvents:UIControlEventTouchUpInside];
    [_pwdView.goLoginBtn addTarget:self action:@selector(showLoginView) forControlEvents:UIControlEventTouchUpInside];
}

- (void) showSigninView {
    _signinView.hidden = NO;
    _pwdView.hidden = YES;
    _loginView.hidden = YES;
}

- (void) showLoginView {
    _loginView.hidden = NO;
    _pwdView.hidden = YES;
    _signinView.hidden = YES;
}

- (void) showPwdView {
    _pwdView.hidden = NO;
    _loginView.hidden = YES;
    _signinView.hidden = YES;
}

- (void) ExitAccount {
    
}

- (void) SignIn {
    
    NSDictionary *data = [_signinView getInputData];
    
    if ([data isEqual:nil]) {
        return;
    }
    
    NSString *urlString = [serverurl stringByAppendingString: @"/account/signin"];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer= [AFHTTPRequestSerializer new];
    
    [manager POST:urlString parameters:data progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        responseObject = (NSDictionary *)responseObject;
        NSString *signinResult = [responseObject objectForKey:@"signin"];
        if ([signinResult isEqualToString:@"succeed"]) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:[data objectForKey:@"uid"] forKey:@"uid"];
            DoraSigninInfoViewController *nextpage = [[DoraSigninInfoViewController alloc] init];
            [self presentViewController:nextpage animated:YES completion:^(void){}];
        } else {
            [_signinView setSigninNotice:@"用户名已存在"];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
        [_signinView setSigninNotice:@"网络繁忙，请稍后再试！"];
    }];
}

- (void) Login {
    NSDictionary *data = [[NSDictionary alloc] initWithDictionary:[_loginView getInputData]];
    if (data == nil) {
        return;
    }
    
    __weak DoraAccountViewController *weakself = self;
    
    NSString *urlString = [serverurl stringByAppendingString:@"/account/login/"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer= [AFHTTPRequestSerializer new];
    
    [manager POST:urlString parameters:data progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        responseObject = (NSDictionary *)responseObject;
        NSString *loginResult = [responseObject objectForKey:@"login"];
        NSLog(@"%@", loginResult);
        if ([loginResult isEqualToString:@"succeed"]) {
            [weakself SetLoginStatus:[data objectForKey:@"uid"]];
        } else {
            [_loginView setSigninNotice:@"用户名或密码不正确！"];
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
        [_loginView setSigninNotice:@"网络繁忙，请稍后再试！"];
    }];
}

- (void) ChangePwd {
    NSDictionary *data = [[NSDictionary alloc] initWithDictionary:[_pwdView getInputData]];
    
    if (data == nil) {
        return;
    }
    
    [_pwdView.submitBtn setTitle:@"加载中，请稍后……" forState:UIControlStateDisabled];
    _pwdView.submitBtn.enabled = NO;
    [_pwdView.submitBtn setBackgroundColor:AppDisableDefaultColor];
    
    NSString *urlString = [serverurl stringByAppendingString:@"/account/login/"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer= [AFHTTPRequestSerializer new];
    [manager POST:urlString parameters:data progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        responseObject = (NSDictionary *)responseObject;
        if ([[responseObject objectForKey:@"status"] isEqualToString:@"succesful"]) {
            [_pwdView.submitBtn setTitle:@"提交" forState:UIControlStateDisabled];
            [_pwdView showLogin];
        } else {
            if ([[responseObject objectForKey:@"temppwd"] isEqualToString:@"false"]) {
                [_pwdView setSigninNotice:@"临时密码不正确！"];
            }
            [_pwdView.submitBtn setTitle:@"提交" forState:UIControlStateDisabled];
            _pwdView.submitBtn.enabled = YES;
            [_pwdView.submitBtn setBackgroundColor:AppDefaultColor];
            [_pwdView showSignin];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
        [_pwdView.submitBtn setTitle:@"提交" forState:UIControlStateDisabled];
        _pwdView.submitBtn.enabled = YES;
        [_pwdView.submitBtn setBackgroundColor:AppDefaultColor];
        [_pwdView setSigninNotice:@"网络繁忙， 请稍后再试！"];
    }];
}

- (void) SetLoginStatus:(NSString *) uname {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:uname forKey:@"uid"];
    
    DoraRootNavigationViewController *mainpage = [[DoraRootNavigationViewController alloc] init];
    [self presentViewController:mainpage animated:YES completion:^ (void){}];
}



@end
