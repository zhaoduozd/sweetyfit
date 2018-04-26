//
//  DoraExerciseActionShowController.h
//  SweetyFit
//
//  Created by Dora Zhao on 26/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraExercisePointView.h"

@interface DoraExerciseActionShowController : UIViewController
@property(nonatomic, copy) NSString *pagetitle;
@property(nonatomic, copy) NSString *tips;
@property(nonatomic, copy) NSString *aid;
@property(nonatomic, strong) UIImageView *imageview;
@property float duration;
@end
