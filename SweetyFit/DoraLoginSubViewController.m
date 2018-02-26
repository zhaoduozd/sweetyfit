//
//  DoraLoginSubViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 25/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraLoginSubViewController.h"
#import "UITextField+DoraLoginInput.h"
#import "DoraCommonHeader.h"
#import "UIButton+DoraLoginButtonView.h"

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
    UITextField *usernameField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"用户名（手机号/邮箱）" TopDis:topdis];

    UITextField *passwordField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"密码" TopDis:topdis + 60];
    [passwordField setSecureTextEntry:YES];
    
    UIButton *loginButton = [UIButton DoraCreateLoginOrangeColorButtonWithWidth:DoraScreenWidth/2 Height:50 borderRadius:3 Text:@"登录"];
    CGRect tempframe = loginButton.frame;
    tempframe.origin = CGPointMake(DoraScreenWidth/4, topdis + 120 + 60);
    loginButton.frame = tempframe;

    [self.view addSubview:usernameField];
    [self.view addSubview:passwordField];
    [self.view addSubview:loginButton];
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
