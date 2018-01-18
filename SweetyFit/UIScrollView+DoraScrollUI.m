//
//  UIScrollView+DoraScrollUI.m
//  SweetyFit
//
//  Created by Dora Zhao on 12/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "UIScrollView+DoraScrollUI.h"

@implementation UIScrollView (DoraScrollUI)
+(UIScrollView *) DoraCreateScrollWithHeight:(float) scrollHeight  Width:(float) scrollWidht contentWidth:(float) contentWidth contentHeight:(float) contentHeight viewPositionX:(float) x viewPositionY:(float) y {
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(x, y, scrollWidht, scrollHeight);
    scrollView.contentSize = CGSizeMake(contentWidth, contentHeight);
    
    return scrollView;
}
@end
