//
//  DoraUIRecomFood.m
//  SweetyFit
//
//  Created by Dora Zhao on 6/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraUIRecomFood.h"
#import "DoraColorDefineHeader.h"

@implementation DoraUIRecomFood

-(instancetype) init {
    self = [super init];
    UILabel *modeltitle = [UILabel DoraCreateTextBoldTitleName:@"推荐de美食"];
    
    _foodContentWrapper = [[UIView alloc] initWithFrame:CGRectMake(-1, 36, DoraScreenWidth + 2, 870)];
    _foodContentWrapper.backgroundColor = AppDefaultSubViewBackgroundColor;
    _foodContentWrapper.layer.borderColor = AppDefaultBorderColor.CGColor;
    _foodContentWrapper.layer.borderWidth = 1;
    
    [self addSubview:_foodContentWrapper];
    [self addSubview:modeltitle];
    return self;
}

@end
