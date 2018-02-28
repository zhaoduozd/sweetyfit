//
//  UIView+DoraViewUI.m
//  SweetyFit
//
//  Created by Dora Zhao on 15/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "UIView+DoraViewUI.h"
#import "UIScrollView+DoraScrollUI.h"
#import "DoraColorDefineHeader.h"


@implementation UIView (DoraViewUI)
+(UIView *) DoraCreateSeperateLineWithWidth:(float) width Height:(float) height PositionX:(float) x PositionY:(float) y {
    UIView *seperateLine = [[UIView alloc] init];
    seperateLine.frame = CGRectMake(x, y, width, height);
    seperateLine.backgroundColor = AppDefaultBorderColor;
    return seperateLine;
}

@end
