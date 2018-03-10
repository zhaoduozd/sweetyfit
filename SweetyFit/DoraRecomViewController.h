//
//  DoraRecomViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 12/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraUIScrollViewRecomWrapper.h"
#import "DoraExerciseRecomViewController.h"
#import "DoraFoodRecomViewController.h"
#import "DoraExerciseDataViewController.h"
#import "DoraUIRecomBonus.h"

@interface DoraRecomViewController : UIViewController
@property(nonatomic, strong) DoraUIScrollViewRecomWrapper *recomRootView;
@property(nonatomic, strong) DoraExerciseRecomViewController *recomExercise;
@property(nonatomic, strong) DoraExerciseDataViewController *recomExerciseData;
@property(nonatomic, strong) DoraFoodRecomViewController *recomFood;
@property(nonatomic, strong) DoraUIRecomBonus *recomBonusView;


@end
