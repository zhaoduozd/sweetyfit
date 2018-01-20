//
//  DoraExercisePointView.h
//  SweetyFit
//
//  Created by Dora Zhao on 15/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraCommonHeader.h"
@interface DoraExercisePointView : UIView
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIScrollView *exercisePointTextWrapper;
@property (nonatomic, strong) UIButton *speechSwitch;
@property (nonatomic, strong) UIView *seperateLine;
@end
