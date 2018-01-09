//
//  DoraUIRecomFood.m
//  SweetyFit
//
//  Created by Dora Zhao on 6/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraUIRecomFood.h"

@implementation DoraUIRecomFood

-(void) DoraSetUIElements {
    UILabel *modeltitle = [UILabel DoraCreateTextTitleName:@"今日饮食"];
    
    
    [self addSubview:modeltitle];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
