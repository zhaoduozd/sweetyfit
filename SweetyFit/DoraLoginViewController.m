//
//  DoraLoginViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 25/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraCommonHeader.h"
#import "DoraLoginViewController.h"
#import "DoraLoginSubViewController.h"
#import "DoraSignInViewController.h"
#import "UIButton+DoraLoginButtonView.h"

@interface DoraLoginViewController ()

@end

@implementation DoraLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setViewBackground];
    [self addFunctionView];
}

- (void) setViewBackground {
    // set background image
    NSString *imageName = @"loginbg.jpg";
    UIImage *bgImage = [UIImage imageNamed:imageName];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    bgImageView.frame = CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight);
    [self.view addSubview:bgImageView];
    
    // add mask layer
    UIView *maskLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight)];
    maskLayer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.65];
    [self.view addSubview:maskLayer];
}

- (void) addFunctionView {
    float topdis = DoraScreenHeight / 4 * 3;
    float btnw = 150;
    float btnh = 50;
    float btnwrapw = btnw * 2 + 50;
    UIView *buttonWrap = [[UIView alloc] initWithFrame:CGRectMake((DoraScreenWidth - btnwrapw)/2, topdis, btnwrapw, btnh)];
    
    UIButton *loginbtn = [UIButton DoraCreateLoginOrangeColorButtonWithWidth:btnw Height:btnh borderRadius:4 Text:@"登录"];
    UIButton *signinbtn = [UIButton DoraCreateLoginOrangeColorButtonWithWidth:btnw Height:btnh borderRadius:4 Text:@"注册"];
    
    CGRect tempFrame = loginbtn.frame;
    tempFrame.origin = CGPointMake(0, 0);
    loginbtn.frame = tempFrame;
    
    tempFrame = signinbtn.frame;
    tempFrame.origin = CGPointMake(btnw + 50, 0);
    signinbtn.frame = tempFrame;
    
    [loginbtn addTarget:self action:@selector(goToLogin:) forControlEvents:UIControlEventTouchUpInside];
    [signinbtn addTarget:self action:@selector(goToSignIn:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonWrap addSubview:loginbtn];
    [buttonWrap addSubview:signinbtn];
    [self.view addSubview:buttonWrap];
}

- (void) goToLogin: (id)sender {
    DoraLoginSubViewController *loginpage = [[DoraLoginSubViewController alloc] init];
    [self presentViewController:loginpage animated:YES completion:^(void) {}];
}

- (void) goToSignIn: (id)sender {
    DoraSignInViewController *signinpage = [[DoraSignInViewController alloc] init];
    [self presentViewController:signinpage animated:YES completion:^(void) {}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
