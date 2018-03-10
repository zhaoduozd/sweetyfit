//
//  DoraExerciseDataViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 9/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HealthKit/HealthKit.h>
#import "DoraCommonHeader.h"
#import "DoraColorDefineHeader.h"


@interface DoraExerciseDataViewController : UIViewController
@property(nonatomic, strong) UILabel *totalCalorieData;
@property(nonatomic, strong) UILabel *totalCalorieUnit;
@property(nonatomic, strong) UILabel *walkingRunningCalorieData;
@property(nonatomic, strong) UILabel *sportCalorieData;
@end
