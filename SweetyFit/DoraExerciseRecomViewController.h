//
//  DoraExerciseRecomViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 7/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HealthKit/HealthKit.h>
#import <AFNetworking/AFNetworking.h>
#import "DoraExercisePointView.h"
#import "DoraScreenInforHeader.h"
#import "DoraCommonHeader.h"
#import "DoraExerciseDataViewController.h"


@interface DoraExerciseRecomViewController : UIViewController
@property(nonatomic, strong) UIImageView *gifplayer;
@property(nonatomic, strong) UIScrollView *exerciselist;
@property(nonatomic, strong) DoraExercisePointView *pointtips;
@property(nonatomic, strong) DoraExerciseDataViewController *recomExerciseData;
@end
