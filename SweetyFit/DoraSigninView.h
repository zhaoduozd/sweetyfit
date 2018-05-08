//
//  DoraSigninView.h
//  SweetyFit
//
//  Created by Dora Zhao on 7/5/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraAccountViews.h"

@interface DoraSigninView : DoraAccountViews

@property(nonatomic, strong) UIButton *signinBtn;
@property(nonatomic, strong) UIButton *loginLabelBtn;


-(NSDictionary *) getInputData;
@end
