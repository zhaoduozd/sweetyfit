//
//  DoraFoodTableViewCellButton.m
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/1/19.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#import "DoraFoodTableViewCellButton.h"

@implementation DoraFoodTableViewCellButton

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    float height = frame.size.height;
    float width = frame.size.width;
    
    self.foodName = [[UILabel alloc] initWithFrame:CGRectMake(10, height/2 - 30, width, 26)];
    self.foodDetail = [[UILabel alloc] initWithFrame:CGRectMake(width/2, height-40, width/2, 26)];
    self.foodCalorie = [[UILabel alloc] initWithFrame:CGRectMake(10, height-40, width/2, 26)];
    self.foodLevel = [[UILabel alloc] initWithFrame:CGRectMake(width-20, 0, 20, 20)];
    
    UIColor *fontColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    CALayer *maskLayer = [[CALayer alloc] init];
    
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:4];
    
    maskLayer.frame = CGRectMake(0, 0, width, height);
    maskLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6].CGColor;
    
    self.foodName.font = [UIFont boldSystemFontOfSize:16.0];
    self.foodName.textColor = [UIColor whiteColor];
    
    self.foodDetail.font = [UIFont systemFontOfSize:12.0];
    self.foodDetail.textColor = fontColor;
    
    self.foodCalorie.font = [UIFont systemFontOfSize:12.0];
    self.foodCalorie.textColor = fontColor;
    
    self.foodLevel.font = [UIFont boldSystemFontOfSize:15];
    self.foodLevel.textColor = AppDefaultColor;
    
    [[self layer] addSublayer:maskLayer];
    [self addSubview:self.foodName];
    [self addSubview:self.foodDetail];
    [self addSubview:self.foodCalorie];
    [self addSubview:self.foodLevel];
    
    return self;
}

@end

