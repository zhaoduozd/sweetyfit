//
//  DoraUIRecomExercise.m
//  SweetyFit
//
//  Created by Dora Zhao on 6/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraUIRecomExercise.h"

@implementation DoraUIRecomExercise

-(instancetype) init {
    self = [super init];
    
    float titleY = 0;
    float titleH = 36;
    float playerViewY = titleY + titleH;
    float playerViewH = DoraScreenWidth * 0.618;
    float exerciseListY = playerViewY + playerViewH;
    float exerciseListH = 70;
    float exercisePointsY = exerciseListY + exerciseListH;
    float exercisePointsH = 186;
        
    UILabel *modeltitle = [UILabel DoraCreateTextBoldTitleName:@"推荐de运动"];
    
    _playerView = [UIImageView DoraCreateExerciseShowImageViewPositionY:playerViewY];
    _exerciseList = [UIScrollView DoraCreateScrollWithHeight:exerciseListH Width:DoraScreenWidth contentWidth:DoraScreenWidth contentHeight:exerciseListH viewPositionX:0 viewPositionY:exerciseListY];
    _exercisePoints = [[DoraExercisePointView alloc] init];
    _exercisePoints.frame = CGRectMake(0, exercisePointsY, DoraScreenWidth, exercisePointsH);
    
    [self addSubview:modeltitle];
    [self addSubview:_playerView];
    [self addSubview:_exerciseList];
    [self addSubview:_exercisePoints];
    
    return self;
}

@end
