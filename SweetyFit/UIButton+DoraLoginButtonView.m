//
//  UIButton+DoraLoginButtonView.m
//  SweetyFit
//
//  Created by Dora Zhao on 25/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "UIButton+DoraLoginButtonView.h"
#import "DoraCommonHeader.h"
#import "DoraColorDefineHeader.h"

@implementation UIButton (DoraLoginButtonView)
+(UIButton *) DoraCreateOrangeLineButtonWithWidth:(float) width Height:(float) height borderRadius:(float) radius Text:(NSString *) textContent X:(float) x Y:(float) y {
    UIButton *button = [[UIButton alloc] init];
    
    button.layer.borderColor = AppDefaultColor.CGColor;
    button.layer.borderWidth = 1;
    [button.layer setCornerRadius:radius];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:textContent forState:UIControlStateNormal];
    [button setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    
    button.frame = CGRectMake(x, y, width, height);
    
    return button;
}
+(UIButton *) DoraCreateOrangeColorButtonWithWidth:(float) width Height:(float) height borderRadius:(float) radius Text:(NSString *) textContent X:(float) x Y:(float) y {
    UIButton *button = [[UIButton alloc] init];
    
    button.backgroundColor = AppDefaultColor;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button.layer setCornerRadius: radius];
    [button setTitle:textContent forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.frame = CGRectMake(x, y, width, height);
    
    return button;
}

+(UIButton *) DoraCreateGetInfoPureColorButtonWithX:(float) x Y:(float) y Text:(NSString *) textContent {
    UIButton *button = [[UIButton alloc] init];
    
    float btnh = 30;
    float btnw = 100;
    
    button.frame = CGRectMake(x, y, btnw, btnh);
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:textContent forState:UIControlStateNormal];
    [button setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [button.layer setBorderWidth:1];
    [button.layer setBorderColor:AppDefaultColor.CGColor];
    [button.layer setCornerRadius:2];
    //[button.titleLabel setTextColor:AppDefaultColor];
    
    return button;
}
@end







