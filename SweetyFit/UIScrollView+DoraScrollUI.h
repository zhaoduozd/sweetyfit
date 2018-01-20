//
//  UIScrollView+DoraScrollUI.h
//  SweetyFit
//
//  Created by Dora Zhao on 12/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraCommonHeader.h"
@interface UIScrollView (DoraScrollUI)
+(UIScrollView *) DoraCreateScrollWithHeight:(float) scrollHeight  Width:(float) scrollWidht contentWidth:(float) contentWidth contentHeight:(float) contentHeight viewPositionX:(float) x viewPositionY:(float) y;
@end
