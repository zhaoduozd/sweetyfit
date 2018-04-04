//
//  DoraExerciseButtonWrapper.m
//  SweetyFit
//
//  Created by Dora Zhao on 26/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseButtonWrapper.h"

@implementation DoraExerciseButtonWrapper

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    float height = frame.size.height;
    float width = frame.size.width;
    
    self.button = [[DoraExericiseTableViewCellButton alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    self.button.exerciseName = [[UILabel alloc] initWithFrame:CGRectMake(10, height/2 - 30, width, 26)];
    self.button.exerciseTime = [[UILabel alloc] initWithFrame:CGRectMake(width/2, height-40, width/2, 26)];
    self.button.exerciseCalorie = [[UILabel alloc] initWithFrame:CGRectMake(10, height-40, width/2, 26)];
    self.button.exerciseLevel = [[UILabel alloc] initWithFrame:CGRectMake(width-25, 5, 20, 20)];
    
    UIColor *fontColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    CALayer *maskLayer = [[CALayer alloc] init];
    
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:4];
    
    maskLayer.frame = CGRectMake(0, 0, width, height);
    maskLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6].CGColor;
    
    self.button.exerciseName.font = [UIFont boldSystemFontOfSize:16.0];
    self.button.exerciseName.textColor = [UIColor whiteColor];
    
    self.button.exerciseTime.font = [UIFont systemFontOfSize:12.0];
    self.button.exerciseTime.textColor = fontColor;
    
    self.button.exerciseCalorie.font = [UIFont systemFontOfSize:12.0];
    self.button.exerciseCalorie.textColor = fontColor;
    
    //self.exerciseLevel.font = [UIFont boldSystemFontOfSize:15];
    //self.exerciseLevel.textColor = AppDefaultColor;
    
    [[self.button layer] addSublayer:maskLayer];
    [self.button addSubview:self.button.exerciseName];
    [self.button addSubview:self.button.exerciseTime];
    [self.button addSubview:self.button.exerciseCalorie];
    //[self.button addSubview:self.exerciseLevel];
    
    [self.button setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:self.imageview];
    [self addSubview:self.button];
    
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
