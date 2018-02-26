//
//  UIView+DoraLoginGetInfoQueView.m
//  SweetyFit
//
//  Created by Dora Zhao on 26/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "UIView+DoraLoginGetInfoQueView.h"
#import "DoraScreenInforHeader.h"
#import "DoraColorDefineHeader.h"
#import "UILabel+TextUI.h"

@implementation UIView (DoraLoginGetInfoQueView)
+ (UIView *) DoraCreateQuestionViewWithHeight:(float)height Y:(float) y Title:(NSString *) title{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(-1, y, DoraScreenWidth, height)];
    [view.layer setBorderWidth:1];
    [view.layer setBorderColor:AppDefaultBorderColor.CGColor];
    [view setBackgroundColor:AppDefaultSubViewBackgroundColor];
    
    UILabel *titleLabel = [UILabel DoraCreateTextTitleName:title];
    titleLabel.frame = CGRectMake(10, 5, DoraScreenWidth - 20, 30);
    
    [view addSubview:titleLabel];
    return view;
}
@end
