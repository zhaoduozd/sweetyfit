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
    float fieldHeight = 40;
    float leftMargin = 0 * DoraScreenWidth;
    
    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(leftMargin, topdis, fieldWidth, fieldHeight)];
    
    [textfield setPlaceholder:placeholder];
    [textfield setBorderStyle:UITextBorderStyleRoundedRect];
    textfield.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    return textfield;
}

+(UITextField *) DoraCreateSigninGetInfoTextFieldWithUnit:(NSString *) unit Frame:(CGRect) frame{
    UITextField *textfield = [[UITextField alloc] init];
    
    textfield.frame = frame;
    
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    
    UILabel *unitLabel = [[UILabel alloc] init];
    unitLabel.text = unit;
    
    //textfield.rightView = unitLabel;
    
    
    return textfield;
}
@end
