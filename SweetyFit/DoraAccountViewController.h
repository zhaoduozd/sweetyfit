//
//  DoraAccountViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 7/5/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraSigninView.h"
#import "DoraLoginView.h"
#import "DoraLosePwdView.h"
#import <AFNetworking/AFNetworking.h>


@interface DoraAccountViewController : UIViewController
@property(nonatomic, strong) DoraSigninView *signinView;
@property(nonatomic, strong) DoraLoginView *loginView;
@property(nonatomic, strong) DoraLosePwdView *pwdView;
@end
