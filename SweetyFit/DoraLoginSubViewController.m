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
    _usernameField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"账户名（手机号/邮箱）" TopDis:topdis];

    _passwordField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"密码" TopDis:topdis + 60];
    [_passwordField setSecureTextEntry:YES];
    
    UIButton *loginButton = [UIButton DoraCreateLoginOrangeColorButtonWithWidth:DoraScreenWidth/2 Height:50 borderRadius:3 Text:@"登录"];
    CGRect tempframe = loginButton.frame;
    tempframe.origin = CGPointMake(DoraScreenWidth/4, topdis + 120 + 60);
    loginButton.frame = tempframe;
    
    [loginButton addTarget:self action:@selector(Login:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_usernameField];
    [self.view addSubview:_passwordField];
    [self.view addSubview:loginButton];
}

- (void) Login:(id) sender {
    NSString *usernametext = _usernameField.text;
    NSString *passwordtext = _passwordField.text;
    NSString *passwordMD5 = [passwordtext MD5];
    
    NSString *urlString = @"http://127.0.0.1:3000/account/login?u=";
    urlString = [urlString stringByAppendingString:usernametext];
    urlString = [urlString stringByAppendingString:@"&p="];
    urlString = [urlString stringByAppendingString:passwordMD5];
    NSURL *url = [NSURL URLWithString:urlString];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer= [AFHTTPRequestSerializer new];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"succeed results: %@", responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"yes");
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
        
    }];
    
    DoraRootNavigationViewController *mainpage = [[DoraRootNavigationViewController alloc] init];
    [self presentViewController:mainpage animated:YES completion:^ (void){}];
}

@end
