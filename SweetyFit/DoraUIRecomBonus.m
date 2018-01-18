//
//  DoraUIRecomBonus.m
//  SweetyFit
//
//  Created by Dora Zhao on 6/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraUIRecomBonus.h"

@implementation DoraUIRecomBonus

-(instancetype) init {
    self = [super init];
    UILabel *modeltitle = [UILabel DoraCreateTextBoldTitleName:@"Bonus！！！"];
    modeltitle.textColor = AppDefaultColor;
    
    
    [self addSubview:modeltitle];
    return self;
}

@end
