//
//  DoraUIRecomExerciseData.m
//  SweetyFit
//
//  Created by Dora Zhao on 6/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraUIRecomExerciseData.h"

@implementation DoraUIRecomExerciseData

-(void) DoraSetUIElements {
    UILabel *modeltitle = [UILabel DoraCreateTextTitleName:@"今日运动数据"];
    
    
    [self addSubview:modeltitle];
    
    self.frame = CGRectMake(0,  28 + DoraScreenWidth * 0.618 + 50 + 200, DoraScreenWidth,  260);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
