//
//  DoraLoginView.h
//  SweetyFit
//
//  Created by Dora Zhao on 7/5/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraAccountViews.h"

@interface DoraLoginView : DoraAccountViews
@property(nonatomic, strong) UIButton *loginBtn;
@property(nonatomic, strong) UIButton *goSigninBtn;
@property(nonatomic, strong) UIButton *goPwdBtn;

-(NSDictionary *) getInputData;
@end
