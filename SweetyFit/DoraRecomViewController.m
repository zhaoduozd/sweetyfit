//
//  DoraRecomViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 12/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DoraRecomViewController.h"
#import "DoraColorDefineHeader.h"
#import <AFNetworking/AFNetworking.h>
#import <HealthKit/HealthKit.h>

@interface DoraRecomViewController ()
@property (nonatomic, strong) UILabel *texttest;
@end

@implementation DoraRecomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = AppDefaultBackgroundColor;
    // self.navigationController.navigationBarHidden = YES;

    
    _recomRootView = [[DoraUIScrollViewRecomWrapper alloc] init];
    _recomExercise = [[DoraExerciseRecomViewController alloc] init];
    //_recomExerciseData = [[DoraExerciseDataViewController alloc] init];
    _recomFood = [[DoraFoodRecomViewController alloc] init];
    //_recomBonusView = [[DoraUIRecomBonus alloc] init];
    
    [_recomRootView addSubview:_recomExercise.view];
    //[_recomRootView addSubview:_recomExerciseData.view];
    [_recomRootView addSubview:_recomFood.view];
    //[_recomRootView addSubview:_recomBonusView];
    
    [self setViewsFrame];
    [self.view addSubview:_recomRootView];
}

-(void) setViewsFrame {
    float titleHeight = 40;
    float seperateHeight = 5;
    
    float exerciseY = 0;
    float exerciseH = titleHeight + DoraScreenWidth * 0.618 + 70 + 186;
    
    float exerciseDataY = exerciseY + exerciseH;
    float exerciseDataH = titleHeight + 200;
    
    float foodY = exerciseDataY + exerciseDataH;
    float foodH = titleHeight + 1070;
    
    float bonusY = foodY + foodH;
    float bonusH = 300;
    

    _recomExercise.view.frame = CGRectMake(0, exerciseY, DoraScreenWidth, exerciseH);
    _recomExerciseData.view.frame = CGRectMake(0, exerciseDataY, DoraScreenWidth, exerciseDataH);
    _recomFood.view.frame = CGRectMake(0, foodY, DoraScreenWidth, foodH);
    _recomBonusView.frame = CGRectMake(0, bonusY, DoraScreenWidth, bonusH);
    
    //NSLog(@"set page height");
    [_recomRootView setScrollBasicUI:foodY+foodH+seperateHeight*2];
}

@end




