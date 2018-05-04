//
//  DoraSigninInputsView.m
//  SweetyFit
//
//  Created by Dora Zhao on 21/4/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraSigninInputsView.h"
#import "DoraCommonHeader.h"
#import "DoraLoginHeader.h"

@implementation DoraSigninInputsView

-(instancetype) init {
    self = [super init];
    self.frame = CGRectMake(DoraScreenWidth*0.05, 100, DoraScreenWidth*0.9, 450);
    self.loginNotice = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    self.loginNotice.textAlignment = NSTextAlignmentCenter;
    self.loginNotice.textColor = [UIColor redColor];
    self.loginNotice.text = @"注册失败";
    self.loginNotice.hidden = YES;
    
    self.usernameField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"*用户名" TopDis:50];
    self.passwordField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"*密码" TopDis:100];
    self.confirmField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"*确认密码" TopDis:150];
    self.emailField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"*预留邮箱，用于找回密码" TopDis:200];
    [self.passwordField setSecureTextEntry:YES];
    [self.confirmField setSecureTextEntry:YES];
    
    [self addSubview:self.loginNotice];
    [self addSubview:self.usernameField];
    [self addSubview:self.passwordField];
    [self addSubview:self.confirmField];
    [self addSubview:self.emailField];
    return self;
}

@end
