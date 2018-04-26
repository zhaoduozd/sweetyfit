//
//  DoraExerciseButtonWrapper.h
//  SweetyFit
//
//  Created by Dora Zhao on 26/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraExericiseTableViewCellButton.h"


@interface DoraExerciseButtonWrapper : UIView
@property(nonatomic, strong) UIImageView *imageview;
@property(nonatomic, strong) DoraExericiseTableViewCellButton *button;
@property float duration;
@end
