//
//  UIButton+DoraLoginButtonView.m
//  SweetyFit
//
//  Created by Dora Zhao on 25/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "UIButton+DoraLoginButtonView.h"
#import "DoraCommonHeader.h"

@implementation UIButton (DoraLoginButtonView)
+(UIButton *) DoraCreateLoginOrangeColorButtonWithWidth:(float) width Height:(float) height borderRadius:(float) radius Text:(NSString *) textContent {
    UIButton *button = [[UIButton alloc] init];
    
    button.backgroundColor = AppDefaultColor;
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button.layer setCornerRadius: radius];
    [button setTitle:textContent forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    CGRect tempframe = button.frame;
    tempframe.size = CGSizeMake(width, height);
    button.frame = tempframe;
    
    return button;
}

+(UIButton *) DoraCreateGetInfoPureColorButtonWithX:(float) x Y:(float) y Text:(NSString *) textContent {
    UIButton *button = [[UIButton alloc] init];
    
    float btnh = 26;
    float btnw = 80;
    
    button.frame = CGRectMake(x, y, btnw, btnh);
    button.titleLabel.text = textContent;
    [button.layer setBorderWidth:1];
    [button.layer setBorderColor:AppDefaultColor.CGColor];
    [button.layer setCornerRadius:2];
    [button.titleLabel setTextColor:AppDefaultColor];
    
    return button;
}
@end







