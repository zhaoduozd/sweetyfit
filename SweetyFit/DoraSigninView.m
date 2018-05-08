//
//  DoraSigninView.m
//  SweetyFit
//
//  Created by Dora Zhao on 7/5/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraSigninView.h"
#import "UITextField+DoraLoginInput.h"
#import "UILabel+TextUI.h"
#import "UIButton+DoraButtonUI.h"

@implementation DoraSigninView {
    UILabel *signinNotice;
    UITextField * usernameField;
    UITextField * passwordField;
    UITextField * confirmField;
    UITextField * emailField;
    UILabel *loginLabel;
}

-(instancetype) init {
    self = [super init];
    
    [self setPageTitle:@"注册"];
    [self initialUIElements];
    
    return self;
}

-(void) initialUIElements {
    
    usernameField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"用户名：不少于4位" TopDis:140];
    passwordField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"密码：合法字符为a~z,A~Z,0~9,长度不少于6位" TopDis:190];
    confirmField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"确认密码" TopDis:240];
    emailField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"预留邮箱，用于找回密码" TopDis:290];
    [passwordField setSecureTextEntry:YES];
    [confirmField setSecureTextEntry:YES];
    
    _signinBtn =  [UIButton DoraCreateOrangeColorButtonWithWidth:DoraScreenWidth*0.9 Height:40 borderRadius:3 Text:@"注册" X:0 Y:370];
    loginLabel = [UILabel DoraCreateTextSmallCenterTitleName:@"已有账户？"];
    loginLabel.frame = CGRectMake(0, 435, self.frame.size.width, 30);
    _loginLabelBtn = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:30 borderRadius:2 Text:@"去登录" X:self.frame.size.width/2-52 Y:470];
    
    [self addSubview:usernameField];
    [self addSubview:passwordField];
    [self addSubview:confirmField];
    [self addSubview:emailField];
    [self addSubview:_signinBtn];
    [self addSubview:loginLabel];
    [self addSubview:_loginLabelBtn];
}

-(NSDictionary *) getInputData {
    NSDictionary *result;
    return result;
}



@end


















