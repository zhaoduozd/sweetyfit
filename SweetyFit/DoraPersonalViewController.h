//
//  DoraPersonalViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 12/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraCommonHeader.h"
#import "DoraPersonalHistory.h"
#import "DoraPersonalProfile.h"
#import "DoraPersonalSuggestion.h"
#import "DoraPersonalTableCell.h"

@interface DoraPersonalViewController : UIViewController

@property(nonatomic,strong) DoraPersonalProfile *personalProfile;
@property(nonatomic,strong) DoraPersonalSuggestion *personalSuggestion;
@property(nonatomic,strong) DoraPersonalHistory *personalHistory;
@property(nonatomic,strong) DoraPersonalTableCell *personalBodyData;
@property(nonatomic,strong) DoraPersonalTableCell *personalSetAlert;
@property(nonatomic,strong) UIButton *personalSignOut;

@end
