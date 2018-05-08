//
//  DoraLosePwdView.m
//  SweetyFit
//
//  Created by Dora Zhao on 7/5/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraLosePwdView.h"
#import "UIButton+DoraButtonUI.h"
#import "UITextField+DoraLoginInput.h"
#import <AFNetworking/AFNetworking.h>
#import "DoraColorDefineHeader.h"
#import "NSString+MD5.h"

@implementation DoraLosePwdView {
    UILabel *emailTitleLabel;
    UILabel *emailCollectLabel;
    UILabel *emailLabel;
    UILabel *signinLabel;
    UILabel *loginLabel;
    UITextField *tempPwd;
    UITextField *newPwd;
    UITextField *confirmPwd;
    UITextField *userName;
    UITextField *reserveEmail;
    
    UIButton *userConfirmBtn;
    UIButton *emailConfirmBtn;
    
    NSString *uid;
    NSString *email;
}

-(instancetype) init {
    self = [super init];
    [self setPageTitle:@"修改密码"];
    [self initialUserNameCollection];
    [self initialEmailCollection];
    [self initialMainPage];
    [self hideMainPage];
    [self hideEmailCollection];
    [self showUserNameCollection];
    [self bindEvents];
    return self;
}

-(void) initialUserNameCollection {
    userName = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"请输入用户名" TopDis:120];
    userConfirmBtn = [UIButton DoraCreateOrangeColorButtonWithWidth:self.frame.size.width Height:40 borderRadius:2 Text:@"确认" X:0 Y:180];
    
    [self addSubview:userName];
    [self addSubview:userConfirmBtn];
}

-(void) initialEmailCollection {
    emailCollectLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, self.frame.size.width, 40)];
    emailCollectLabel.textAlignment = NSTextAlignmentCenter;
    emailCollectLabel.text = @"请输入您的预留邮箱";
    emailCollectLabel.font = [UIFont boldSystemFontOfSize:20];
    
    emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, self.frame.size.width, 40)];
    emailLabel.textAlignment = NSTextAlignmentCenter;
    emailLabel.text = @"198****@163.com";
    emailLabel.font = [UIFont boldSystemFontOfSize:20];
    
    reserveEmail = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"请输入预留邮箱" TopDis:210];
    emailConfirmBtn = [UIButton DoraCreateOrangeColorButtonWithWidth:self.frame.size.width Height:40 borderRadius:2 Text:@"确认" X:0 Y:270];
    
    [self addSubview:emailCollectLabel];
    [self addSubview:reserveEmail];
    [self addSubview:emailConfirmBtn];
}

-(void) initialMainPage {
    emailTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, self.frame.size.width, 40)];
    emailTitleLabel.textAlignment = NSTextAlignmentCenter;
    emailTitleLabel.text = @"验证码已发送至您的预留邮箱:";
    emailTitleLabel.font = [UIFont boldSystemFontOfSize:20];

    _sendBtn = [UIButton DoraCreateOrangeColorButtonWithWidth:200 Height:40 borderRadius:2 Text:@"发送验证码" X:self.frame.size.width/2-100 Y:260];
    
    tempPwd = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"请输入验证码" TopDis:210];
    newPwd = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"新密码（大小写字母以及数字不少于6位）" TopDis:260];
    confirmPwd = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"确认密码" TopDis:310];
    
    
    _submitBtn =  [UIButton DoraCreateOrangeColorButtonWithWidth:self.frame.size.width Height:40 borderRadius:3 Text:@"提交" X:0 Y:370];
    
    signinLabel = [UILabel DoraCreateTextSmallCenterTitleName:@"验证码错误!"];
    signinLabel.frame = CGRectMake(0, 430, self.frame.size.width, 30);
    signinLabel.textColor = [UIColor redColor];
    signinLabel.textAlignment = NSTextAlignmentCenter;
    signinLabel.font = [UIFont systemFontOfSize:16];
    _goSigninBtn = [UIButton DoraCreateOrangeLineButtonWithWidth:120 Height:30 borderRadius:2 Text:@"注册新账户" X:self.frame.size.width/2-60 Y:470];
    
    
    loginLabel = [UILabel DoraCreateTextSmallCenterTitleName:@"密码修改成功！"];
    loginLabel.frame = CGRectMake(0, 430, self.frame.size.width, 30);
    loginLabel.textAlignment = NSTextAlignmentCenter;
    loginLabel.font = [UIFont systemFontOfSize:16];
    _goLoginBtn = [UIButton DoraCreateOrangeLineButtonWithWidth:120 Height:30 borderRadius:2 Text:@"去登录" X:self.frame.size.width/2-60 Y:470];
    
    [self hideLoginSignin];
    [self addSubview:userName];
    [self addSubview:reserveEmail];
    
    [self addSubview:emailTitleLabel];
    [self addSubview:emailLabel];
    [self addSubview:tempPwd];
    [self addSubview:newPwd];
    [self addSubview:confirmPwd];
    [self addSubview:_submitBtn];
    [self addSubview:signinLabel];
    [self addSubview:_goSigninBtn];
    [self addSubview:loginLabel];
    [self addSubview:_goLoginBtn];
    
}

-(void) bindEvents {
    [userConfirmBtn addTarget:self action:@selector(userConfirm) forControlEvents:UIControlEventTouchUpInside];
    [emailConfirmBtn addTarget:self action:@selector(emailConfirm) forControlEvents:UIControlEventTouchUpInside];
}



-(void) setEmailText:(NSString *) emailText {
    emailLabel.text = emailText;
}

-(void) showUserNameCollection {
    self.notice.hidden = YES;
    
    userName.hidden = NO;
    userConfirmBtn.hidden = NO;
    
    userName.text = @"";
}

-(void) showEmailCollection {
    self.notice.hidden = YES;
    
    emailCollectLabel.hidden = NO;
    emailLabel.hidden = NO;
    reserveEmail.hidden = NO;
    emailConfirmBtn.hidden = NO;
    
    reserveEmail.text = @"";
}

-(void) showMainPage {
    self.notice.hidden = YES;
    
    emailTitleLabel.hidden = NO;
    emailLabel.hidden = NO;
    tempPwd.hidden = NO;
    newPwd.hidden = NO;
    confirmPwd.hidden = NO;
    _submitBtn.hidden = NO;
    
    tempPwd.text = @"";
    newPwd.text = @"";
    confirmPwd.text = @"";
}

-(void) hideUserNameCollection {
    userName.hidden = YES;
    userConfirmBtn.hidden = YES;
}

-(void) hideEmailCollection {
    emailCollectLabel.hidden = YES;
    emailLabel.hidden = YES;
    reserveEmail.hidden = YES;
    emailConfirmBtn.hidden = YES;
}

-(void) hideMainPage {
    emailTitleLabel.hidden = YES;
    emailLabel.hidden = YES;
    tempPwd.hidden = YES;
    newPwd.hidden = YES;
    confirmPwd.hidden = YES;
    _submitBtn.hidden = YES;

}

-(void) showLogin {
    loginLabel.hidden = NO;
    _goLoginBtn.hidden = NO;
    signinLabel.hidden = YES;
    _goSigninBtn.hidden = YES;
}

-(void) showSignin {
    signinLabel.hidden = NO;
    _goSigninBtn.hidden = NO;
    loginLabel.hidden = YES;
    _goLoginBtn.hidden = YES;
}

-(void) hideLoginSignin {
    signinLabel.hidden = YES;
    _goSigninBtn.hidden = YES;
    loginLabel.hidden = YES;
    _goLoginBtn.hidden = YES;
}

-(NSDictionary *) getInputData {
    NSString *tpwd = tempPwd.text;
    NSString *npwd = newPwd.text;
    NSString *cpwd = confirmPwd.text;
    
    if ([tpwd isEqualToString:@""]) {
        [self setSigninNotice:@"验证码不正确！"];
        return nil;
    } else if (npwd.length < 6) {
        [self setSigninNotice:@"密码不少于6位！"];
        return nil;
    } else if ([npwd isEqualToString:cpwd] == NO) {
        [self setSigninNotice:@"确认密码与密码不符！"];
        return nil;
    }
    
    NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:uid, @"uid", [npwd MD5], @"pwd", tpwd, @"tpwd", nil];
    return data;
}

-(void) setEmail:(NSString *) emailText {
    NSString *tempEmail = [[[emailText substringToIndex:1] stringByAppendingString:@"****"] stringByAppendingString:[emailText substringFromIndex:5]];
    email = emailText;
    emailLabel.text = tempEmail;
}


/*  Network Requirements  */

-(void) userConfirm {
    
    uid = userName.text;

    if (uid.length < 4) {
        [self setSigninNotice:@"用户名不正确！"];
        return;
    }

    __weak DoraLosePwdView *weakself = self;
    userConfirmBtn.enabled = NO;
    [userConfirmBtn setBackgroundColor:AppDisableDefaultColor];

    NSString *urlString = [[serverurl stringByAppendingString:@"/losepwd/getemail?u="] stringByAppendingString:uid];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer= [AFHTTPRequestSerializer new];
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        responseObject = (NSDictionary *)responseObject;
        
        [weakself setEmail:[responseObject objectForKey:@"email"]];
        [weakself hideUserNameCollection];
        [weakself hideMainPage];
        [weakself showEmailCollection];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
        [self setSigninNotice:@"网络繁忙，请稍后再试！"];
        userConfirmBtn.enabled = YES;
        [userConfirmBtn setBackgroundColor:AppDefaultColor];
    }];

}

-(void) emailConfirm {
    __weak DoraLosePwdView *weakself = self;
    
    if ([reserveEmail.text isEqualToString:email]) {
        emailConfirmBtn.enabled = NO;
        [emailConfirmBtn setBackgroundColor:AppDisableDefaultColor];
        
        NSString *urlString = [[serverurl stringByAppendingString:@"/sendemail?e="] stringByAppendingString:email];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        manager.requestSerializer= [AFHTTPRequestSerializer new];
        [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            
            [weakself showMainPage];
            [weakself hideEmailCollection];
            [weakself hideUserNameCollection];
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"fail results: %@", error);
            [self setSigninNotice:@"网络繁忙，请稍后再试！"];
            emailConfirmBtn.enabled = YES;
        }];
    } else {
        [self setSigninNotice:@"您输入的邮箱不正确！"];
    }
}

@end












