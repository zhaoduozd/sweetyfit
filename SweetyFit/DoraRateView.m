//
//  DoraRateView.m
//  SweetyFit
//
//  Created by Dora Zhao on 26/4/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraRateView.h"
#import "DoraScreenInforHeader.h"
#import "UIButton+DoraButtonUI.h"
#import "DoraColorDefineHeader.h"

@implementation DoraRateView {
    UIButton *low;
    UIButton *yes;
    UIButton *high;
}

- (instancetype) init {
    self = [super init];
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.9]];
    self.frame = CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight);
    
    UILabel *q1 = [[UILabel alloc] init];
    q1.text = @"运动强度如何？";
    q1.textColor = [UIColor whiteColor];
    q1.font = [UIFont boldSystemFontOfSize:16];
    q1.frame = CGRectMake(20, 20, DoraScreenWidth-40, 40);
    
    
    low = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"低" X:20 Y:70];
    yes = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"适中" X:130 Y:70];
    high = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"高" X:240 Y:70];
    
    [low addTarget:self action:@selector(tenbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [yes addTarget:self action:@selector(fiftybtnevent) forControlEvents:UIControlEventTouchUpInside];
    [high addTarget:self action:@selector(twentybtnevent) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:q1];
    [self addSubview:low];
    [self addSubview:yes];
    [self addSubview:high];
    
    self.submitbtn = [UIButton DoraCreateOrangeColorButtonWithWidth:260 Height:40 borderRadius:4 Text:@"确认" X:(DoraScreenWidth-260)/2 Y:200];
    [self addSubview:self.submitbtn];
    
    self.hidden = YES;
    return self;
}

-(void) tenbtnevent {
    [self cleartime];
    [low setBackgroundColor:AppDefaultColor];
    [low setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

-(void) fiftybtnevent {
    [self cleartime];
    [yes setBackgroundColor:AppDefaultColor];
    [yes setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

-(void) twentybtnevent {
    [self cleartime];
    [high setBackgroundColor:AppDefaultColor];
    [high setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void) cleartime {
    [low setBackgroundColor:[UIColor clearColor]];
    [low setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [yes setBackgroundColor:[UIColor clearColor]];
    [yes setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [high setBackgroundColor:[UIColor clearColor]];
    [high setTitleColor:AppDefaultColor forState:UIControlStateNormal];
}

@end
