//
//  DoraSignInViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 25/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraSignInViewController.h"
#import "DoraLoginHeader.h"
#import "DoraSigninInfoViewController.h"
#import "DoraColorDefineHeader.h"
#import "DoraScreenInforHeader.h"
#import "UILabel+TextUI.h"
#import "NSString+MD5.h"

@interface DoraSignInViewController ()

@end

@implementation DoraSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:AppDefaultBackgroundColor];
    [self addFunctionElements];
}

- (void) addFunctionElements {
    float topdis = 80;
    
    self.siginNotice = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, DoraScreenWidth, 30)];
    self.siginNotice.textColor = [UIColor redColor];
    self.siginNotice.textAlignment = NSTextAlignmentCenter;
    self.siginNotice.hidden = YES;
    
    UILabel *birthlabel = [UILabel DoraCreateTextTitleName:@"生日（为更准确地为您推荐，请填写正确的生日）"];
    birthlabel.frame = CGRectMake(0.05 * DoraScreenWidth, topdis + 62*4 + 30, DoraScreenWidth, 20);
    _accountName = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"用户名（手机号/邮箱）" TopDis:topdis];
    _nickName = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"昵称" TopDis:topdis + 50 * 1 + 12];
    _selfIntro = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"自我介绍" TopDis:topdis + 50 * 2 + 12 * 2];
    _password = [UITextField DoraCreateLoginInputFieldWithPlaceHolder:@"密码(0～9，a~z，A~Z不少于8位字符)" TopDis:topdis + 62 * 3];
    
    [_password setSecureTextEntry:YES];
    
    _birthday = [[UIDatePicker alloc] initWithFrame:CGRectMake(0.05 * DoraScreenWidth, topdis + 62 * 4 + 60, 0.9 * DoraScreenWidth, 167)];
    _birthday.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    _birthday.datePickerMode = UIDatePickerModeDate;
    [_birthday setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *signInButton = [UIButton DoraCreateLoginOrangeColorButtonWithWidth:DoraScreenWidth/2 Height:50 borderRadius:3 Text:@"注册"];
    
    CGRect tempframe = signInButton.frame;
    tempframe.origin = CGPointMake(DoraScreenWidth/4, topdis + 62 * 4 + 60 + 167 + 30);
    signInButton.frame = tempframe;
    
    [signInButton addTarget:self action:@selector(SignIn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_accountName];
    [self.view addSubview:_nickName];
    [self.view addSubview:_selfIntro];
    [self.view addSubview:_birthday];
    [self.view addSubview:_password];
    [self.view addSubview:_siginNotice];
    [self.view addSubview:signInButton];
    [self.view addSubview:birthlabel];
}

- (void) SignIn:(id) sender {
    NSString *usernameText = _accountName.text;
    NSString *passwordText = [_password.text MD5];
    NSString *selfIntroText = _selfIntro.text;
    NSString *nicknameText = _nickName.text;
    NSDate *birthDate = _birthday.date;
    
    NSLog(@"%@", birthDate);
    
    if (usernameText.length < 4) {
        self.siginNotice.text = @"用户名不能少于4个字符！";
        self.siginNotice.hidden = NO;
        return;
    }

    if (_password.text.length < 8) {
        self.siginNotice.text = @"密码不能少于8个字符！";
        self.siginNotice.hidden = NO;
        return;
    }

    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:usernameText forKey:@"uid"];
    [dict setObject:passwordText forKey:@"pwd"];
    [dict setObject:selfIntroText forKey:@"selfIntro"];
    [dict setObject:nicknameText forKey:@"nickname"];
    [dict setObject:birthDate forKey:@"birthday"];
    
    NSString *urlString = [serverurl stringByAppendingString: @"/account/signin"];
    NSURL *url = [NSURL URLWithString:urlString];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer= [AFHTTPRequestSerializer new];
    
    [manager POST:url.absoluteString parameters:dict progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        responseObject = (NSDictionary *)responseObject;
        NSString *signinResult = [responseObject objectForKey:@"signin"];
        
        if ([signinResult isEqualToString:@"succeed"]) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:usernameText forKey:@"uid"];
            
            DoraSigninInfoViewController *nextpage = [[DoraSigninInfoViewController alloc] init];
            [self presentViewController:nextpage animated:YES completion:^(void){}];
        } else {
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
    }];
}

@end
