//
//  DoraLosePwdView.h
//  SweetyFit
//
//  Created by Dora Zhao on 7/5/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraAccountViews.h"

@interface DoraLosePwdView : DoraAccountViews
@property(nonatomic, strong) UIButton *submitBtn;
@property(nonatomic, strong) UIButton *goSigninBtn;
@property(nonatomic, strong) UIButton *goLoginBtn;
@property(nonatomic, strong) UIButton *sendBtn;
@property(nonatomic, strong) UIButton *resendBtn;
@property(nonatomic, copy) NSString *tempPwd;


-(void) showLogin;
-(void) showSignin;
-(void) hideLoginSignin;
-(NSDictionary *) getInputData;
@end
