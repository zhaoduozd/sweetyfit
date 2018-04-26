//
//  DoraLoginInputsView.m
//  SweetyFit
//
//  Created by Dora Zhao on 21/4/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraLoginInputsView.h"
#import "DoraCommonHeader.h"
#import "DoraLoginHeader.h"

@implementation DoraLoginInputsView

-(instancetype) init {
    self = [super init];
    self.frame = CGRectMake(DoraScreenWidth*0.05, 100, DoraScreenWidth*0.9, 150);
    self.loginNotice = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    self.loginNotice.textAlignment = NSTextAlignmentCenter;
    self.loginNotice.textColor = [UIColor redColor];
    self.loginNotice.text = @"用户名不存在或密码错误！";
    self.loginNotice.hidden = YES;
    
    self.usernameField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"用户名" TopDis:50];
    self.passwordField = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"密码" TopDis:100];
    [self.passwordField setSecureTextEntry:YES];
    
    [self addSubview:self.loginNotice];
    [self addSubview:self.usernameField];
    [self addSubview:self.passwordField];
    return self;
}

@end
