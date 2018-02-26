//
//  UITextField+DoraLoginInput.h
//  SweetyFit
//
//  Created by Dora Zhao on 26/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (DoraLoginInput)
+(UITextField *) DoraCreateLoginInputFieldWithPlaceHolder:(NSString *) placeholder TopDis:(float) topdis;
+(UITextField *) DoraCreateSigninGetInfoTextFieldWithUnit:(NSString *) unit;
@end
