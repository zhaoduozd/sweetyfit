//
//  DoraRecomFoodUnitView.m
//  SweetyFit
//
//  Created by Dora Zhao on 16/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraRecomFoodUnitView.h"

@implementation DoraRecomFoodUnitView

-(instancetype) init {
    self = [super init];
    
    float titlewidth = 45;
    float contentwidth = 85;
    float lineheight = 22;
    
    UIView *wrapper = [[UIView alloc] init];
    
    CGRect tempframe = wrapper.frame;
    tempframe.size = CGSizeMake(120, 200);
    wrapper.frame = tempframe;
    
    UIImage *placeholderimage = [UIImage imageNamed:@"placeholder.JPG"];
    _foodImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130, 90)];
    [_foodImage setImage:placeholderimage];
    _foodImage.layer.cornerRadius = 4;
    _foodImage.layer.masksToBounds = YES;
    
    _foodName = [[UILabel alloc] initWithFrame:CGRectMake(5, 90, 130, 30)];
    _foodName.textColor = [UIColor colorWithRed:100/255 green:100/255 blue:100/255 alpha:1];
    _foodName.font = [UIFont systemFontOfSize:13];
    
    _foodCalorie = [UILabel DoraCreateTextSmallLeftTitleName:@""];
    _foodAmount =  [UILabel DoraCreateTextSmallLeftTitleName:@""];
    
    UILabel *foodCalorieTitle = [UILabel DoraCreateTextSmallLeftTitleName:@"热量 ≈"];
    UILabel *foodAmountTitle = [UILabel DoraCreateTextSmallLeftTitleName:@"用量 ≈"];
    
    foodAmountTitle.frame = CGRectMake(5, 120, titlewidth, lineheight);
    _foodAmount.frame = CGRectMake(titlewidth, 120, contentwidth, lineheight);

    foodCalorieTitle.frame = CGRectMake(5, 142, titlewidth, lineheight);
    _foodCalorie.frame = CGRectMake(titlewidth, 142, contentwidth, lineheight);
    
    [wrapper addSubview:foodAmountTitle];
    [wrapper addSubview:foodCalorieTitle];
    [wrapper addSubview:_foodAmount];
    [wrapper addSubview:_foodCalorie];
    [wrapper addSubview:_foodName];
    [wrapper addSubview:_foodImage];
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = AppDefaultBorderColor.CGColor;
    [self addSubview:wrapper];
    return self;
}

@end
