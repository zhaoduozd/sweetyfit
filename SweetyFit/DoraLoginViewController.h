//
//  DoraLoginViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 25/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraLoginInputsView.h"
#import "DoraSigninInputsView.h"

@interface DoraLoginViewController : UIViewController
@property(nonatomic, strong) DoraLoginInputsView *loginInputView;
@property(nonatomic, strong) DoraSigninInputsView *signinInputView;
@property(nonatomic, strong) UIButton *loginBtn;
@property(nonatomic, strong) UIButton *signinBtn;
@property(nonatomic, strong) UILabel *loginLabel;
@property(nonatomic, strong) UILabel *signinLabel;
@property(nonatomic, strong) UIButton *loginLabelbtn;
@property(nonatomic, strong) UIButton *signinLabelbtn;
@property(nonatomic, strong) UILabel *pageTitle;
@end
