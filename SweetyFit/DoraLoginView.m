//
//  DoraLoginView.m
//  SweetyFit
//
//  Created by Dora Zhao on 7/5/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraLoginView.h"
#import "UITextField+DoraLoginInput.h"
#import "UILabel+TextUI.h"
#import "UIButton+DoraButtonUI.h"
#import "NSString+MD5.h"

@implementation DoraLoginView {
    UITextField * usernameField;
    UITextField * passwordField;
    UILabel *signinLabel;
    UILabel *pwdLabel;
}

-(instancetype) init {
    self = [super init];
    
    [self setPageTitle:@"登录"];
    [self initialUIElements];
    
    return self;
}

-(void) initialUIElements {
    
    usernameField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"*用户名" TopDis:140];
    passwordField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"*密码" TopDis:190];
    [passwordField setSecureTextEntry:YES];
    
    _loginBtn =  [UIButton DoraCreateOrangeColorButtonWithWidth:DoraScreenWidth*0.9 Height:40 borderRadius:3 Text:@"登录" X:0 Y:270];
    
    signinLabel = [UILabel DoraCreateTextSmallCenterTitleName:@"没有账户？"];
    signinLabel.frame = CGRectMake(0, 335, 120, 30);
    _goSigninBtn = [UIButton DoraCreateOrangeLineButtonWithWidth:120 Height:30 borderRadius:2 Text:@"去注册" X:0 Y:365];
    
    
    pwdLabel = [UILabel DoraCreateTextSmallCenterTitleName:@"忘记密码？"];
    pwdLabel.frame = CGRectMake(self.frame.size.width-120, 335, 120, 30);
    _goPwdBtn = [UIButton DoraCreateOrangeLineButtonWithWidth:120 Height:30 borderRadius:2 Text:@"修改密码" X:self.frame.size.width-120 Y:365];
    
    
    
    [self addSubview:usernameField];
    [self addSubview:passwordField];
    [self addSubview:_loginBtn];
    [self addSubview:signinLabel];
    [self addSubview:_goSigninBtn];
    [self addSubview:pwdLabel];
    [self addSubview:_goPwdBtn];
}

-(NSDictionary *) getInputData {
    NSString *userid = usernameField.text;
    NSString *pwd = passwordField.text;
    
    if (userid.length < 4 || pwd.length < 6) {
        [self setSigninNotice:@"用户名或密码不正确！"];
        return nil;
    }
    NSDictionary *result = [[NSDictionary alloc] initWithObjectsAndKeys:userid, @"uid", [pwd MD5], @"pwd", nil];
    return result;
}



@end









