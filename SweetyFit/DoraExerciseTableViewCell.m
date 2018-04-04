//
//  DoraExerciseTableViewCell.m
//  SweetyFit
//
//  Created by Dora Zhao on 18/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseTableViewCell.h"

@implementation DoraExerciseTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    float btnW = (DoraScreenWidth - 45) / 2;
    float btnH = btnW * 0.6;
    
    _leftExercise = [[DoraExerciseButtonWrapper alloc] initWithFrame:CGRectMake(15, 5, btnW, btnH)];
    _rightExercise = [[DoraExerciseButtonWrapper alloc] initWithFrame:CGRectMake(25 + btnW, 5, btnW, btnH)];
    
    [self.contentView addSubview:_leftExercise];
    [self.contentView addSubview:_rightExercise];
    
    return self;
}

@end
