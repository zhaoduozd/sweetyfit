//
//  DoraUIRecomExercise.h
//  SweetyFit
//
//  Created by Dora Zhao on 6/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraExercisePointView.h"

@interface DoraUIRecomExercise : UIView
@property(nonatomic, strong) UIScrollView *exerciseList;
@property(nonatomic, strong) UIImageView *playerView;
@property(nonatomic, strong) DoraExercisePointView *exercisePoints;

@end
