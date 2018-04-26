//
//  DoraExercisePointView.m
//  SweetyFit
//
//  Created by Dora Zhao on 15/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExercisePointView.h"
#import "DoraColorDefineHeader.h"


@implementation DoraExercisePointView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _title = [UILabel DoraCreateTextTitleName:@"动作要领"];
        _title.font = [UIFont boldSystemFontOfSize:14];
        _title.textColor = [UIColor whiteColor];
        _seperateLine = [UIView DoraCreateSeperateLineWithWidth:DoraScreenWidth - 10 Height:1 PositionX:5 PositionY:36];
        _seperateLine.backgroundColor = AppDefaultBorderColor;
        _exercisePointTextWrapper = [UIScrollView DoraCreateScrollWithHeight:150 Width:DoraScreenWidth contentWidth:DoraScreenWidth contentHeight:150 viewPositionX:0 viewPositionY:31];
        _speechSwitch = [UIButton DoraCreateOrangeLineButtonWithWidth:140 Height:26 borderRadius:4 Text:@"开启音频讲解" X:DoraScreenWidth - 145 Y:5];
        _tips = [[UILabel alloc] initWithFrame:CGRectMake(5, 41, DoraScreenWidth-10, 140)];
        _tips.textColor = [UIColor whiteColor];
        [_tips setNumberOfLines:0];
        _tips.lineBreakMode =NSLineBreakByWordWrapping;
        _tips.font = [UIFont systemFontOfSize:14];
        // _tips.textAlignment = NSTextAlignmentCenter;
                
        self.backgroundColor = AppDefaultBarTintColor;
        
        
        [self addSubview:_title];
        [self addSubview:_seperateLine];
        [self addSubview:_exercisePointTextWrapper];
        [self addSubview:_speechSwitch];
        [self addSubview:_tips];
    }
    return self;
}

@end
