//
//  DoraExericiseTableViewCellButton.h
//  SweetyFit
//
//  Created by Dora Zhao on 19/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraCommonHeader.h"
@interface DoraExericiseTableViewCellButton : UIButton
@property(nonatomic, strong) UIImage *exerciseImage;
@property(nonatomic, strong) UILabel *exerciseName;
@property(nonatomic, strong) UILabel *exerciseCalorie;
@property(nonatomic, strong) UILabel *exerciseTime;
@property(nonatomic, strong) UILabel *exerciseLevel;
@end
