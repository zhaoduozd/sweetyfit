//
//  DoraRecomViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 12/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DoraRecomViewController.h"
#import "DoraRecomFoodUnitView.h"
#import "DoraRecomFoodContentWrapperView.h"
#import <AFNetworking/AFNetworking.h>

@interface DoraRecomViewController ()
@property (nonatomic, strong) UILabel *texttest;
@end

@implementation DoraRecomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = AppDefaultBackgroundColor;
    
    _recomRootView = [[DoraUIScrollViewRecomWrapper alloc] init];
    _recomExerciseView = [[DoraUIRecomExercise alloc] init];
    _recomExerciseDataView = [[DoraUIRecomExerciseData alloc] init];
    _recomFoodView = [[DoraUIRecomFood alloc] init];
    _recomBonusView = [[DoraUIRecomBonus alloc] init];
    
    [self setViewsFrame];
    [self setExerciseView];
    [self setExerciseDataView];
    [self setFoodView];
    [self setBonusView];
    
    [_recomRootView addSubview:_recomExerciseView];
    [_recomRootView addSubview:_recomExerciseDataView];
    [_recomRootView addSubview:_recomFoodView];
    [_recomRootView addSubview:_recomBonusView];
        
    [self.view addSubview:_recomRootView];
    
    // simulate
    // NSString *urlString = @"http://itunes.apple.com/search?term=metallica";
    NSString *urlString = @"127.0.0.1:3000";
    NSURL *url = [NSURL URLWithString:urlString];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"results: %@", responseObject);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"results: %@", error);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Dora Function Set Views

-(void) setViewsFrame {
    float titleHeight = 36;
    float seperateHeight = 5;
    
    float exerciseY = 0;
    float exerciseH = titleHeight + DoraScreenWidth * 0.618 + 70 + 186;
    
    float exerciseDataY = exerciseY + exerciseH;
    float exerciseDataH = titleHeight + 200;
    
    float foodY = exerciseDataY + exerciseDataH;
    float foodH = titleHeight + 870;
    
    float bonusY = foodY + foodH;
    float bonusH = 300;

    _recomExerciseView.frame = CGRectMake(0, exerciseY, DoraScreenWidth, exerciseH);
    _recomExerciseDataView.frame = CGRectMake(0, exerciseDataY, DoraScreenWidth, exerciseDataH);
    _recomFoodView.frame = CGRectMake(0, foodY, DoraScreenWidth, foodH);
    _recomBonusView.frame = CGRectMake(0, bonusY, DoraScreenWidth, bonusH);
    
    [_recomRootView setScrollBasicUI:bonusY+bonusH+seperateHeight*2];
}

-(void) setExerciseView {
    // Gif Player
    UIImage *TDoraImage = [UIImage imageNamed:@"placeholder3.jpg"];
    [_recomExerciseView.playerView setImage:TDoraImage];
    
    
    // Exercise List
    float imagewidth = 80;
    float imagenumber = 10;
    float exerciseListHeight = _recomExerciseView.exerciseList.frame.size.height;
    float exerciseListContentWidth = 5 + (imagewidth + 5) * imagenumber;
    UIImage *imageHolder = [UIImage imageNamed:@"placeholder3.jpg"];

    _recomExerciseView.exerciseList.contentSize = CGSizeMake(exerciseListContentWidth, exerciseListHeight);
    
    // Put Data into List
    for (int i = 0; i < 10; ++i) {
        UIButton *btn = [UIButton DoraCreateBlackMaskButtonWithWidth: imagewidth Height:60 borderRaduis:4 titleText:@"背部运动" imageBackground:imageHolder];
        float x;
        
        if (i == 0) {
            x = 5;
        } else {
            x = (5 + imagewidth) * i + 5;
        }
        
        CGRect tempframe = btn.frame;
        tempframe.origin = CGPointMake(x, 5);
        btn.frame = tempframe;
        
        [_recomExerciseView.exerciseList addSubview:btn];
    }
    
    // Set Exercise Points
    
}

-(void) setExerciseDataView {
    _recomExerciseDataView.totalCalorieData.text = @"1694";
    _recomExerciseDataView.walkingRunningCalorieData.text = @"1000Kcal";
    _recomExerciseDataView.sportCalorieData.text = @"694Kcal";
}

-(void) setFoodView {
    NSArray *foodWrapperTitles = @[@"主食（碳水化合物）", @"肉蛋类（蛋白质）", @"果蔬类（纤维素&维生素）", @"油脂类"];
    NSMutableArray *foodWrappers;
    int foodnum = 1;
    
    for (int i = 0; i < 4; ++i) {
        DoraRecomFoodContentWrapperView *contentView = [[DoraRecomFoodContentWrapperView alloc] init];
        contentView.frame = CGRectMake(0, 5 + i*220, DoraScreenWidth, 220);
        contentView.wrapperTitle.text = foodWrapperTitles[i];
        contentView.foodList.contentSize = CGSizeMake(420, 190);
        
        for (int j = 0; j < 3; ++j) {
            NSString *foodname = [NSString stringWithFormat:@"food%d.jpeg", foodnum];
            foodnum++;
            DoraRecomFoodUnitView *test = [[DoraRecomFoodUnitView alloc] init];
            CGRect tempframe = test.frame;
            tempframe.origin = CGPointMake(5 + j * (130 + 8), 0);
            test.frame = tempframe;
            [test.foodImage setImage:[UIImage imageNamed:foodname]];
            test.foodName.text = @"有机花菜";
            test.foodType.text = @"蔬菜";
            test.foodAmount.text = @"如图为100g";
            test.foodCalorie.text = @"190Kcal";
            
            [contentView.foodList addSubview:test];
        }
        
        [_recomFoodView.foodContentWrapper addSubview:contentView];
    }
    
}

-(void) setBonusView {
    
}
@end




