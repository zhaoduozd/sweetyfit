//
//  UIButton+DoraLoginButtonView.h
//  SweetyFit
//
//  Created by Dora Zhao on 25/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DoraLoginButtonView)
+(UIButton *) DoraCreateLoginOrangeColorButtonWithWidth:(float) width Height:(float) height borderRadius:(float) radius Text:(NSString *) textContent;
+(UIButton *) DoraCreateGetInfoPureColorButtonWithX:(float) x Y:(float) y Text:(NSString *) textContent;
@end
