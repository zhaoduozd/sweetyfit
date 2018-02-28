//
//  DoraUIScrollViewRecomWrapper.m
//  SweetyFit
//
//  Created by Dora Zhao on 22/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DoraUIScrollViewRecomWrapper.h"
#import "DoraColorDefineHeader.h"

@implementation DoraUIScrollViewRecomWrapper

-(void) setScrollBasicUI:(float) contentSizeHeight {
    self.frame = CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight);
    self.contentSize = CGSizeMake(DoraScreenWidth, contentSizeHeight);
    self.backgroundColor = AppDefaultBackgroundColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
