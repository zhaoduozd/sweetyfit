//
//  UITextField+DoraLoginInput.m
//  SweetyFit
//
//  Created by Dora Zhao on 26/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "UITextField+DoraLoginInput.h"
#import "DoraCommonHeader.h"

@implementation UITextField (DoraLoginInput)
+(UITextField *) DoraCreateLoginInputFieldWithPlaceHolder:(NSString *) placeholder TopDis:(float) topdis {
    float fieldWidth = 0.9 * DoraScreenWidth;
    float fieldHeight = 50;
    float leftMargin = 0.05 * DoraScreenWidth;
    
    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(leftMargin, topdis, fieldWidth, fieldHeight)];
    
    [textfield setPlaceholder:placeholder];
    [textfield setBorderStyle:UITextBorderStyleRoundedRect];
    
    return textfield;
}

+(UITextField *) DoraCreateSigninGetInfoTextFieldWithUnit:(NSString *) unit {
    UITextField *textfield = [[UITextField alloc] init];
    
    float textfieldw = 100;
    CGRect tempframe = textfield.frame;
    tempframe.size = CGSizeMake(textfieldw, 36);
    textfield.frame = tempframe;
    
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    
    UILabel *unitLabel = [[UILabel alloc] init];
    unitLabel.text = unit;
    
    //textfield.rightView = unitLabel;
    
    
    return textfield;
}
@end
