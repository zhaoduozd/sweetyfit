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
#import "NSString+MD5.h"

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

-(BOOL)isValidateEmail:(NSString *)email {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

-(NSDictionary *) getInputData {
    NSString *uid = usernameField.text;
    NSString *pwd = passwordField.text;
    NSString *cpwd = confirmField.text;
    NSString *email = emailField.text;
    NSDictionary *result = [[NSDictionary alloc] initWithObjectsAndKeys:@"false", @"input", nil];
    
    if (uid.length < 4) {
        [self setSigninNotice:@"用户名不少于4位！"];
        return result;
    } else if (pwd.length < 6) {
        [self setSigninNotice:@"密码不少于6位"];
        return result;
    } else if ([self isValidateEmail:email] == NO) {
        [self setSigninNotice:@"邮箱格式不正确！"];
        return result;
    } else if ([pwd isEqualToString:cpwd] == NO) {
        [self setSigninNotice:@"确认密码输入不正确！"];
        return result;
    }
    
    NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:@"true", @"input", uid, @"uid", [pwd MD5], @"pwd", email, @"email", nil];
    
    return data;
}



@end


















