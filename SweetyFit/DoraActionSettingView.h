//
//  DoraActionSettingView.h
//  SweetyFit
//
//  Created by Dora Zhao on 16/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoraActionSettingView : UIView
@property(nonatomic, strong) UIButton *submitbtn;
@property(nonatomic, strong) NSMutableDictionary *demanddata;
- (void) clearall;
@end
