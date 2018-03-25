//
//  DoraLoginSubViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 25/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraLoginSubViewController.h"
#import "DoraLoginHeader.h"
#import "DoraColorDefineHeader.h"
#import "DoraScreenInforHeader.h"
#import "DoraRootNavigationViewController.h"


@interface DoraLoginSubViewController ()

@end

@implementation DoraLoginSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:AppDefaultBackgroundColor];
    [self addFunctionElements];
}

- (void) addFunctionElements {
    float topdis = 150;
    CGRect tempframe;
    
    self.loginNotice = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, DoraScreenWidth, 30)];
    self.loginNotice.textColor = [UIColor redColor];
    self.loginNotice.text = @"用户名不存在或密码错误！";
    self.loginNotice.textAlignment = NSTextAlignmentCenter;
    self.loginNotice.hidden = YES;
    
    _usernameField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"账户名（手机号/邮箱）" TopDis:topdis];
    _passwordField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"密码" TopDis:topdis + 60];
    [_passwordField setSecureTextEntry:YES];
    
    UIButton *loginButton = [UIButton DoraCreateLoginOrangeColorButtonWithWidth:DoraScreenWidth/2 Height:50 borderRadius:3 Text:@"登录"];
    tempframe = loginButton.frame;
    tempframe.origin = CGPointMake(DoraScreenWidth/4, topdis + 120 + 60);
    loginButton.frame = tempframe;
    [loginButton addTarget:self action:@selector(Login:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_usernameField];
    [self.view addSubview:_passwordField];
    [self.view addSubview:loginButton];
    [self.view addSubview:self.loginNotice];
}

- (void) Login:(id) sender {
    __weak DoraLoginSubViewController *weakself = self;
    
    NSString *usernametext = _usernameField.text;
    NSString *passwordtext = _passwordField.text;
    NSString *passwordMD5 = [passwordtext MD5];
    
    NSString *urlString = [serverurl stringByAppendingString:@"/account/login?u="];
    urlString = [urlString stringByAppendingString:usernametext];
    urlString = [urlString stringByAppendingString:@"&p="];
    urlString = [urlString stringByAppendingString:passwordMD5];
    NSURL *url = [NSURL URLWithString:urlString];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer= [AFHTTPRequestSerializer new];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        responseObject = (NSDictionary *)responseObject;
        NSString *loginResult = [responseObject objectForKey:@"login"];
        
        if ([loginResult isEqualToString:@"succeed"]) {
            [weakself SetLoginStatus:usernametext];
        } else {
            self.loginNotice.hidden = NO;
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
    }];
    
}

- (void) SetLoginStatus:(NSString *) uname {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:uname forKey:@"uid"];
    
    DoraRootNavigationViewController *mainpage = [[DoraRootNavigationViewController alloc] init];
    [self presentViewController:mainpage animated:YES completion:^ (void){}];
}

@end
