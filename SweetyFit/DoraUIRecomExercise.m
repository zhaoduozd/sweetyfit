//
//  DoraUIRecomExercise.m
//  SweetyFit
//
//  Created by Dora Zhao on 6/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraUIRecomExercise.h"
#import "UIImageView+imageViewUI.h"

@implementation DoraUIRecomExercise

-(void) DoraSetUIElements {
    UILabel *modeltitle = [UILabel DoraCreateTextTitleName:@"今日运动推荐"];
    UIImageView *gifwrapper = [[UIImageView alloc] init];
    [gifwrapper DoraSetExerciseShowImageViewPositionY:28];
    
    [self addSubview:modeltitle];
    
    self.frame = CGRectMake(0, 0, DoraScreenWidth, 28 + DoraScreenWidth * 0.618 + 50 + 200);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
