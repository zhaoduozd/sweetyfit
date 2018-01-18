//
//  UIButton+DoraButtonUI.h
//  SweetyFit
//
//  Created by Dora Zhao on 15/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DoraButtonUI)
+(UIButton *) DoraCreateOrangeLineButtonWithWidth:(float) width Height:(float) height borderRadius:(float) radius Text:(NSString *) textContent;
+(UIButton *) DoraCreateOrangeColorButtonWithWidth:(float) width Height:(float) height borderRadius:(float) radius Text:(NSString *) textContent;
+(UIButton *) DoraCreateBlackMaskBigButtonWithWidth:(float) width Height:(float) height borderRaduis:(float) radius titleText:(NSString *) titleTextContent detailTextTime:(NSString *)detailTime detailTextCalorie:(NSString *)calorie imageBackground:(UIImage *)image;
+(UIButton *) DoraCreateBlackMaskButtonWithWidth:(float) width Height:(float) height borderRaduis:(float) radius titleText:(NSString *) titleTextContent imageBackground:(UIImage *)image;
@end
