//
//  DoraRecomViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 12/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DoraRecomViewController.h"
#import "DoraUIScrollViewRecomWrapper.h"
#import "DoraUIRecomExercise.h"
#import "DoraUIRecomExerciseData.h"
#import "DoraUIRecomFood.h"
#import "DoraUIRecomBonus.h"

//#import "SDWebImage/UIImageView+WebCache.h"



@interface DoraRecomViewController ()

@property (nonatomic, strong) UILabel *texttest;

@end

@implementation DoraRecomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = AppDefaultBackgroundColor;
    
    DoraUIScrollViewRecomWrapper *recomRootView = [[DoraUIScrollViewRecomWrapper alloc] init];
    DoraUIRecomExercise *recomExerciseView = [[DoraUIRecomExercise alloc] init];
    DoraUIRecomExerciseData *recomExerciseDataView = [[DoraUIRecomExerciseData alloc] init];
    DoraUIRecomFood *recomFoodView = [[DoraUIRecomFood alloc] init];
    DoraUIRecomBonus *recomBonusView = [[DoraUIRecomBonus alloc] init];
    
    [recomExerciseView DoraSetUIElements];
    [recomExerciseDataView DoraSetUIElements];
    [recomFoodView DoraSetUIElements];
    [recomBonusView DoraSetUIElements];
    
    [recomRootView setScrollBasicUI:800];
    [recomRootView addSubview:recomExerciseView];
    [recomRootView addSubview:recomExerciseDataView];
    [recomRootView addSubview:recomFoodView];
    [recomRootView addSubview:recomBonusView];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    //[imageView sd_setImageWithURL:[NSURL URLWithString:@"127.0.0.1:3000"] placeholderImage:[UIImage imageNamed:@"exercise.png"]];
    [recomExerciseView addSubview:imageView];
    
    [self.view addSubview:recomRootView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
