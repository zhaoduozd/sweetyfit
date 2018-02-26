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
    UILabel *birthlabel = [UILabel DoraCreateTextTitleName:@"选择生日"];
    birthlabel.frame = CGRectMake(0.05 * DoraScreenWidth, topdis + 62*4 + 30, 100, 20);
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
    [self.view addSubview:signInButton];
    [self.view addSubview:birthlabel];
}

- (void) SignIn:(id) sender {
    NSString *usernameText = _accountName.text;
    NSString *passwordText = [_password.text MD5];
    NSString *selfIntroText = _selfIntro.text;
    NSString *nicknameText = _nickName.text;
    NSDate *birthDate = _birthday.date;
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:usernameText forKey:@"userid"];
    [dict setObject:passwordText forKey:@"pwd"];
    [dict setObject:selfIntroText forKey:@"selfIntro"];
    [dict setObject:nicknameText forKey:@"nickname"];
    [dict setObject:birthDate forKey:@"birthday"];
    
//    NSString *urlString = @"http://120.77.42.160:3000/account/signin";
//    NSURL *url = [NSURL URLWithString:urlString];
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer= [AFHTTPRequestSerializer new];
//    [manager POST:url.absoluteString parameters:dict progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//
//        DoraSigninInfoViewController *getInfoPage = [[DoraSigninInfoViewController alloc] init];
//        [self presentViewController:getInfoPage animated:YES completion:^(void) {}];
//
//        NSLog(@"succeed results: %@", responseObject);
//        if ([responseObject isKindOfClass:[NSDictionary class]]) {
//            NSLog(@"yes");
//        }
//
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"fail results: %@", error);
//
//    }];

    
    
    DoraSigninInfoViewController *getInfoPage = [[DoraSigninInfoViewController alloc] init];
    [self presentViewController:getInfoPage animated:YES completion:^(void) {}];
}

@end
