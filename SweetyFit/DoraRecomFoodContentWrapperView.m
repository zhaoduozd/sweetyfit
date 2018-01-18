//
//  DoraRecomFoodContentWrapper.m
//  SweetyFit
//
//  Created by Dora Zhao on 17/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraRecomFoodContentWrapperView.h"

@implementation DoraRecomFoodContentWrapperView

-(instancetype) init {
    self = [super init];
    _wrapperTitle = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, DoraScreenWidth, 30)];
    _wrapperTitle.textColor = [UIColor colorWithRed:200/255 green:200/255 blue:200/255 alpha:1];
    _wrapperTitle.font = [UIFont boldSystemFontOfSize:14];
    _wrapperTitle.text = @"Dora";
    
    _foodList = [UIScrollView DoraCreateScrollWithHeight:190 Width:DoraScreenWidth contentWidth:DoraScreenWidth contentHeight:190 viewPositionX:0 viewPositionY:30];
    
    [self addSubview:_wrapperTitle];
    [self addSubview:_foodList];
    return self;
}

@end
