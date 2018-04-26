//
//  DoraSigninInputsView.h
//  SweetyFit
//
//  Created by Dora Zhao on 21/4/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoraSigninInputsView : UIView
@property (nonatomic, strong) UITextField * usernameField;
@property (nonatomic, strong) UITextField * passwordField;
@property (nonatomic, strong) UITextField * confirmField;
@property (nonatomic, strong) UITextField * emailField;
@property (nonatomic, strong) UILabel *loginNotice;
@end
