//
//  DoraExericiseTableViewCellButton.m
//  SweetyFit
//
//  Created by Dora Zhao on 19/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExericiseTableViewCellButton.h"

@implementation DoraExericiseTableViewCellButton

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    float height = frame.size.height;
    float width = frame.size.width;
    
    self.exerciseName = [[UILabel alloc] initWithFrame:CGRectMake(10, height/2 - 30, width, 26)];
    self.exerciseTime = [[UILabel alloc] initWithFrame:CGRectMake(width/2, height-40, width/2, 26)];
    self.exerciseCalorie = [[UILabel alloc] initWithFrame:CGRectMake(10, height-40, width/2, 26)];
    self.exerciseLevel = [[UILabel alloc] initWithFrame:CGRectMake(width-20, 0, 20, 20)];
    
    UIColor *fontColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    CALayer *maskLayer = [[CALayer alloc] init];
    
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:4];
    
    maskLayer.frame = CGRectMake(0, 0, width, height);
    maskLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6].CGColor;
    
    self.exerciseName.font = [UIFont boldSystemFontOfSize:16.0];
    self.exerciseName.textColor = [UIColor whiteColor];
    
    self.exerciseTime.font = [UIFont systemFontOfSize:12.0];
    self.exerciseTime.textColor = fontColor;
    
    self.exerciseCalorie.font = [UIFont systemFontOfSize:12.0];
    self.exerciseCalorie.textColor = fontColor;
    
    self.exerciseLevel.font = [UIFont boldSystemFontOfSize:15];
    self.exerciseLevel.textColor = AppDefaultColor;
    
    [[self layer] addSublayer:maskLayer];
    [self addSubview:self.exerciseName];
    [self addSubview:self.exerciseTime];
    [self addSubview:self.exerciseCalorie];
    [self addSubview:self.exerciseLevel];
    
    return self;
}

@end
