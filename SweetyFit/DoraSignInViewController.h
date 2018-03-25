//
//  DoraSignInViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 25/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoraSignInViewController : UIViewController
@property(nonatomic, strong) UITextField *accountName;
@property(nonatomic, strong) UITextField *nickName;
@property(nonatomic, strong) UITextField *selfIntro;
@property(nonatomic, strong) UIDatePicker *birthday;
@property(nonatomic, strong) UITextField *password;
@property(nonatomic, strong) UILabel *siginNotice;
@end
