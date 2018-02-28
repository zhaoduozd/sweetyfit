//
//  UIButton+DoraButtonUI.m
//  SweetyFit
//
//  Created by Dora Zhao on 15/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "UIButton+DoraButtonUI.h"
#import "DoraColorDefineHeader.h"


@implementation UIButton (DoraButtonUI)
+(UIButton *) DoraCreateOrangeLineButtonWithWidth:(float) width Height:(float) height borderRadius:(float) radius Text:(NSString *) textContent {
    UIButton *button = [[UIButton alloc] init];
    
    button.layer.borderColor = AppDefaultColor.CGColor;
    button.layer.borderWidth = 1;
    [button.layer setCornerRadius:radius];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:textContent forState:UIControlStateNormal];
    [button setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    
    CGRect tempframe = button.frame;
    tempframe.size = CGSizeMake(width, height);
    button.frame = tempframe;

    return button;
}
+(UIButton *) DoraCreateOrangeColorButtonWithWidth:(float) width Height:(float) height borderRadius:(float) radius Text:(NSString *) textContent {
    UIButton *button = [[UIButton alloc] init];
    
    button.backgroundColor = AppDefaultColor;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button.layer setCornerRadius: radius];
    [button setTitle:textContent forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    CGRect tempframe = button.frame;
    tempframe.size = CGSizeMake(width, height);
    button.frame = tempframe;

    return button;
}
+(UIButton *) DoraCreateBlackMaskBigButtonWithWidth:(float) width Height:(float) height borderRaduis:(float) radius titleText:(NSString *) titleTextContent detailTextTime:(NSString *)detailTime detailTextCalorie:(NSString *)calorie imageBackground:(UIImage *)image {
    UIButton *button = [[UIButton alloc] init];
    UILabel *btnTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, height/2-20, width, 26)];
    UILabel *btnTime = [[UILabel alloc] initWithFrame:CGRectMake(width/2, height-40, width/2, 26)];
    UILabel *btnCalorie = [[UILabel alloc] initWithFrame:CGRectMake(10, height-40, width/2, 26)];
    UIColor *fontColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    CALayer *maskLayer = [[CALayer alloc] init];
    
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:radius];
    
    maskLayer.frame = CGRectMake(0, 0, width, height);
    maskLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6].CGColor;
    
    btnTitle.text = titleTextContent;
    btnTitle.font = [UIFont boldSystemFontOfSize:16.0];
    btnTitle.textColor = [UIColor whiteColor];
    
    btnTime.text = detailTime;
    btnTime.font = [UIFont systemFontOfSize:12.0];
    btnTime.textColor = fontColor;
    
    btnCalorie.text = calorie;
    btnCalorie.font = [UIFont systemFontOfSize:12.0];
    btnCalorie.textColor = fontColor;
    
    [[button layer] addSublayer:maskLayer];
    [button addSubview:btnTitle];
    [button addSubview:btnTime];
    [button addSubview:btnCalorie];
    
    CGRect tempframe = button.frame;
    tempframe.size = CGSizeMake(width, height);
    button.frame = tempframe;
    
    return button;
}

+(UIButton *) DoraCreateBlackMaskButtonWithWidth:(float) width Height:(float) height borderRaduis:(float) radius titleText:(NSString *) titleTextContent imageBackground:(UIImage *)image {
    UIButton *button = [[UIButton alloc] init];
    UILabel *btntitle = [[UILabel alloc] init];
    CALayer *maskLayer = [[CALayer alloc] init];
    
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:radius];
    
    btntitle.text = titleTextContent;
    btntitle.textColor = [UIColor whiteColor];
    btntitle.textAlignment = NSTextAlignmentCenter;
    btntitle.font = [UIFont boldSystemFontOfSize:13];
    btntitle.frame = CGRectMake(0, 0, 80, 60);
    
    maskLayer.frame = CGRectMake(0, 0, width, height);
    maskLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5].CGColor;
    [[button layer] addSublayer:maskLayer];
    [button addSubview:btntitle];
    
    CGRect tempframe = button.frame;
    tempframe.size = CGSizeMake(width, height);
    button.frame = tempframe;
    
    return button;
}

@end
