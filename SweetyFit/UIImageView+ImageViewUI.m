//
//  UIImageView+ImageViewUI.m
//  SweetyFit
//
//  Created by Dora Zhao on 6/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "UIImageView+ImageViewUI.h"

@implementation UIImageView (ImageViewUI)
-(void) DoraSetExerciseShowImageViewPositionY:(float) y {
    self.frame = CGRectMake(0, y, DoraScreenWidth, DoraScreenWidth * 0.618);
    
    
}
@end
