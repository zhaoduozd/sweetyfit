//
//  UILabel+TextUI.h
//  SweetyFit
//
//  Created by Dora Zhao on 5/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraCommonHeader.h"
@interface UILabel (TextUI)
+(UILabel *) DoraCreateTextBoldTitleName:(NSString *)titlename;
+(UILabel *) DoraCreateTextTitleName:(NSString *) titlename;
+(UILabel *) DoraCreateTextSmallRightTitleName:(NSString *)titlename;
+(UILabel *) DoraCreateTextSmallLeftTitleName:(NSString *)titlename;
+(UILabel *) DoraCreateTextSmallCenterTitleName:(NSString *)titlename;
+(UILabel *) DoraCreateMultilinesUILabel:(NSString *) text LineNum:(NSUInteger) linenum FontSize:(NSUInteger) fontsize LineSpace:(NSUInteger) linespace TextColor:(UIColor *) textcolor;
@end
