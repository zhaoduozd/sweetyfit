//
//  DoraUIRecomExerciseData.m
//  SweetyFit
//
//  Created by Dora Zhao on 6/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraUIRecomExerciseData.h"

@implementation DoraUIRecomExerciseData

-(instancetype) init {
    self = [super init];
    self.frame = CGRectMake(0,  28 + DoraScreenWidth * 0.618 + 50 + 200, DoraScreenWidth,  260);
    
    _totalCalorieData = [[UILabel alloc] init];
    _totalCalorieUnit = [[UILabel alloc] init];
    _walkingRunningCalorieData = [[UILabel alloc] init];
    _sportCalorieData = [[UILabel alloc] init];
    
    UILabel *modeltitle = [UILabel DoraCreateTextBoldTitleName:@"今天消耗de热量"];
    UILabel *totaltitle = [UILabel DoraCreateTextSmallRightTitleName:@"总消耗"];
    UILabel *walkingtitle = [UILabel DoraCreateTextSmallRightTitleName:@"跑步 + 走路:"];
    UILabel *sporttitle = [UILabel DoraCreateTextSmallRightTitleName:@"运动:"];

    
    UIView *sportDataWrapper = [[UIView alloc] initWithFrame:CGRectMake(-1, 36, DoraScreenWidth+2, 200)];
    sportDataWrapper.backgroundColor = AppDefaultSubViewBackgroundColor;
    sportDataWrapper.layer.borderWidth = 1;
    sportDataWrapper.layer.borderColor = AppDefaultBorderColor.CGColor;
    
    totaltitle.frame = CGRectMake(10, 60, 80, 30);
    walkingtitle.frame = CGRectMake(10, 120, 80, 30);
    sporttitle.frame = CGRectMake(10, 150, 80, 30);
    
    _totalCalorieData.font = [UIFont systemFontOfSize:80];
    _totalCalorieData.frame = CGRectMake(100, 10, 200, 90);
    _totalCalorieData.text = @"";
    _totalCalorieData.textAlignment = NSTextAlignmentCenter;
    _totalCalorieData.textColor =  [UIColor colorWithRed:255.0/255.0 green:113.0/255.0 blue:5.0/255.0 alpha:.7];
    
    _totalCalorieUnit.font = [UIFont systemFontOfSize:30];
    _totalCalorieUnit.frame = CGRectMake(300, 50, 100, 45);
    _totalCalorieUnit.text = @"Kcal";
    _totalCalorieUnit.textColor = [UIColor grayColor];
    
    _walkingRunningCalorieData.font = [UIFont systemFontOfSize:16];
    _walkingRunningCalorieData.frame = CGRectMake(110, 120, 200, 30);
    _walkingRunningCalorieData.text = @"";
    _walkingRunningCalorieData.textColor = [UIColor grayColor];
    
    _sportCalorieData.font = [UIFont systemFontOfSize:16];
    _sportCalorieData.frame = CGRectMake(110, 150, 200, 30);
    _sportCalorieData.text = @"";
    _sportCalorieData.textColor = [UIColor grayColor];
    
    
    [sportDataWrapper addSubview:totaltitle];
    [sportDataWrapper addSubview:walkingtitle];
    [sportDataWrapper addSubview:sporttitle];
    
    [sportDataWrapper addSubview:_totalCalorieData];
    [sportDataWrapper addSubview:_totalCalorieUnit];
    [sportDataWrapper addSubview:_walkingRunningCalorieData];
    [sportDataWrapper addSubview:_sportCalorieData];
    
    [self addSubview:modeltitle];
    [self addSubview:sportDataWrapper];
    
    return self;
}

@end
