//
//  DoraRecomViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 12/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraUIScrollViewRecomWrapper.h"
#import "DoraUIRecomExercise.h"
#import "DoraUIRecomExerciseData.h"
#import "DoraUIRecomFood.h"
#import "DoraUIRecomBonus.h"

#import "SDWebImage/UIImageView+WebCache.h"

@interface DoraRecomViewController : UIViewController
@property(nonatomic, strong) DoraUIScrollViewRecomWrapper *recomRootView;
@property(nonatomic, strong) DoraUIRecomExercise *recomExerciseView;
@property(nonatomic, strong) DoraUIRecomExerciseData *recomExerciseDataView;
@property(nonatomic, strong) DoraUIRecomFood *recomFoodView;
@property(nonatomic, strong) DoraUIRecomBonus *recomBonusView;


@end
