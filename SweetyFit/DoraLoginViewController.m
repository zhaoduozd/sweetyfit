//
//  DoraLoginViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 25/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "NSString+MD5.h"
#import "DoraCommonHeader.h"
#import "UIButton+DoraLoginButtonView.h"
#import "DoraSigninInfoViewController.h"
#import "DoraRootNavigationViewController.h"

#import "DoraLoginViewController.h"



@interface DoraLoginViewController ()

@end

@implementation DoraLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setViewBackground];
    [self createViews];
    [self setLoginView];
    [self setLoginBtn];
    [self setLoginLabel];
    [self setUpForDismissKeyboard];
}

-(void) setUpForDismissKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view removeGestureRecognizer:singleTapGR];
                }];
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    [self.view endEditing:YES];
}

- (void) setViewBackground {
    NSString *imageName = @"loginbg";
    UIImage *bgImage = [UIImage imageNamed:imageName];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    UIView *maskLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight)];
    
    bgImageView.frame = CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight);
    [maskLayer setBackgroundColor:[UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.85]];
    
    [self.view addSubview:bgImageView];
    [self.view addSubview:maskLayer];
}

-(void) createViews {
    self.pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(DoraScreenWidth*0.05, 30, DoraScreenWidth-30, 70)];
    self.pageTitle.font = [UIFont boldSystemFontOfSize:28];
    
    self.loginInputView = [[DoraLoginInputsView alloc] init];
    self.loginBtn = [UIButton DoraCreateOrangeColorButtonWithWidth:DoraScreenWidth*0.9 Height:40 borderRadius:3 Text:@"登录" X:DoraScreenWidth*0.05 Y:300];
    self.loginLabel = [UILabel DoraCreateTextSmallCenterTitleName:@"没有账户？"];
    self.loginLabel.frame = CGRectMake(0, 360, DoraScreenWidth, 30);
    self.loginLabelbtn = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:30 borderRadius:2 Text:@"去注册" X:DoraScreenWidth/2-50 Y:400];
    
    
    
    self.signinInputView = [[DoraSigninInputsView alloc] init];
    self.signinBtn =  [UIButton DoraCreateOrangeColorButtonWithWidth:DoraScreenWidth*0.9 Height:40 borderRadius:3 Text:@"注册" X:DoraScreenWidth*0.05 Y:400];
    self.signinLabel = [UILabel DoraCreateTextSmallCenterTitleName:@"已有账户？"];
    self.signinLabel.frame = CGRectMake(0, 460, DoraScreenWidth, 30);
    self.signinLabelbtn = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:30 borderRadius:2 Text:@"去登录" X:DoraScreenWidth/2-50 Y:500];
    
    self.loginInputView.hidden = YES;
    self.loginBtn.hidden = YES;
    self.loginLabel.hidden = YES;
    self.loginLabelbtn.hidden = YES;
    self.signinInputView.hidden = YES;
    self.signinBtn.hidden = YES;
    self.signinLabel.hidden = YES;
    self.signinLabelbtn.hidden = YES;
    
    [self.loginLabelbtn addTarget:self action:@selector(switchSignin) forControlEvents:UIControlEventTouchUpInside];
    [self.signinLabelbtn addTarget:self action:@selector(switchLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.signinBtn addTarget:self action:@selector(signin) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_pageTitle];
    [self.view addSubview:_loginInputView];
    [self.view addSubview:_loginBtn];
    [self.view addSubview:_loginLabel];
    [self.view addSubview:_loginLabelbtn];
    [self.view addSubview:_signinInputView];
    [self.view addSubview:_signinBtn];
    [self.view addSubview:_signinLabel];
    [self.view addSubview:_signinLabelbtn];
}

-(void) setLoginView {
    self.loginInputView.usernameField.text = @"";
    self.loginInputView.passwordField.text = @"";
    self.loginInputView.hidden = NO;
    self.signinInputView.hidden = YES;
}

-(void) setSigninView {
    self.signinInputView.usernameField.text = @"";
    self.signinInputView.passwordField.text = @"";
    self.signinInputView.confirmField.text = @"";
    self.signinInputView.emailField.text = @"";
    self.signinInputView.hidden = NO;
    self.loginInputView.hidden = YES;
}

-(void) setLoginBtn {
    self.loginBtn.hidden = NO;
    self.signinBtn.hidden = YES;
}

-(void) setSignBtn {
    self.signinBtn.hidden = NO;
    self.loginBtn.hidden = YES;

}

-(void) setLoginLabel {
    self.loginLabel.hidden = NO;
    self.loginLabelbtn.hidden = NO;
    self.signinLabel.hidden = YES;
    self.signinLabelbtn.hidden = YES;
    self.pageTitle.text = @"登录";
}

-(void) setSigninLabel {
    self.loginLabel.hidden = YES;
    self.loginLabelbtn.hidden = YES;
    self.signinLabel.hidden = NO;
    self.signinLabelbtn.hidden = NO;
    self.pageTitle.text = @"注册";
}

-(void) switchLogin {
    [self setLoginView];
    [self setLoginBtn];
    [self setLoginLabel];
}

-(void) switchSignin {
    [self setSigninView];
    [self setSignBtn];
    [self setSigninLabel];
}



-(NSString *) verifyUsername:(NSString *) username {
    NSString *acceptable = @"YES";
    if (username.length < 4) {
        acceptable = @"用户名不少于4个字符！";
    }
    return acceptable;
}

-(NSString *) verifyPassword:(NSString *) pwd {
    NSString *acceptable = @"YES";
    if (pwd.length < 8) {
        acceptable = @"密码不少于8个字符！";
    } else {
        NSString *regular = @"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).*$";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self MATCHES %@",regular];
        if (![predicate evaluateWithObject:pwd]) {
            acceptable = @"密码应同时包含数字，小写字母以及大写字母！";
        }
    }
    return acceptable;
}

-(NSString *) verifyConfirmWithPwd:(NSString *) pwd Con:(NSString *) con {
    NSString *acceptable = @"YES";
    if (![pwd isEqualToString:con]){
        acceptable = @"密码和确认密码不一致！";
    }
    return acceptable;
}

-(NSString *) verifyEmail:(NSString *) email {
    NSString *acceptable = @"YES";
    
    return acceptable;
}

- (void) signin {
    NSString *usernameText = self.signinInputView.usernameField.text;
    NSString *passwordText = self.signinInputView.passwordField.text;
    NSString *confirmText = self.signinInputView.confirmField.text;
    NSString *emailText = self.signinInputView.emailField.text;
    
    NSString *verifyUsername = [self verifyUsername:usernameText];
    if (![verifyUsername isEqualToString:@"YES"]) {
        self.signinInputView.loginNotice.text = verifyUsername;
        self.signinInputView.loginNotice.hidden = NO;
        return;
    }
    
    NSString *verifyPwd = [self verifyPassword:passwordText];
    if (![verifyPwd isEqualToString:@"YES"]) {
        self.signinInputView.loginNotice.text= verifyPwd;
        self.signinInputView.loginNotice.hidden = NO;
        return;
    }
    
    NSString *verifyConfirm = [self verifyConfirmWithPwd:passwordText Con:confirmText];
    if (![verifyConfirm isEqualToString:@"YES"]) {
        self.signinInputView.loginNotice.text= verifyConfirm;
        self.signinInputView.loginNotice.hidden = NO;
        return;
    }

    NSString *verifyEmail = [self verifyEmail:emailText];
    if (![verifyEmail isEqualToString:@"YES"]) {
        self.signinInputView.loginNotice.text= verifyEmail;
        self.signinInputView.loginNotice.hidden = NO;
        return;
    }

    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:usernameText forKey:@"uid"];
    [dict setObject:[passwordText MD5] forKey:@"pwd"];
    [dict setObject:emailText forKey:@"email"];
    
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
            self.signinInputView.loginNotice.text = @"用户名重复！";
            self.signinInputView.loginNotice.hidden = NO;
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
        self.signinInputView.loginNotice.text = @"网络繁忙，请稍后再试！";
    }];
}

-(void) login {
    __weak DoraLoginViewController *weakself = self;
    
    NSString *usernametext = self.loginInputView.usernameField.text;
    NSString *passwordtext = self.loginInputView.passwordField.text;
    
    if (usernametext.length < 4 || passwordtext.length < 8) {
        self.loginInputView.loginNotice.text = @"用户名和密码可以为空，且应满足相应长度！";
        self.loginInputView.loginNotice.hidden = NO;
        return;
    }
    
    NSString *passwordMD5 = [passwordtext MD5];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSString *urlString = [serverurl stringByAppendingString:@"/account/login/"];
   
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [dict setObject:usernametext forKey:@"uid"];
    [dict setObject:passwordMD5 forKey:@"pwd"];
    NSLog(@"%@", dict);
    manager.requestSerializer= [AFHTTPRequestSerializer new];
    [manager POST:urlString parameters:dict progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        responseObject = (NSDictionary *)responseObject;
        NSString *loginResult = [responseObject objectForKey:@"login"];
        NSLog(@"%@", loginResult);
        if ([loginResult isEqualToString:@"succeed"]) {
            [weakself SetLoginStatus:usernametext];
        } else {
            self.loginInputView.loginNotice.text = @"用户名或密码不正确！";
            self.loginInputView.loginNotice.hidden = NO;        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
        self.loginInputView.loginNotice.text = @"网络繁忙，请稍后再试！";
        self.loginInputView.loginNotice.hidden = NO;
    }];
}

- (void) SetLoginStatus:(NSString *) uname {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:uname forKey:@"uid"];
    
    DoraRootNavigationViewController *mainpage = [[DoraRootNavigationViewController alloc] init];
    [self presentViewController:mainpage animated:YES completion:^ (void){}];
}





@end
