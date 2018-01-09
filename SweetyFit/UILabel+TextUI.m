//
//  UILabel+TextUI.m
//  SweetyFit
//
//  Created by Dora Zhao on 5/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "UILabel+TextUI.h"

@implementation UILabel (TextUI)
+(UILabel *) DoraCreateTextTitleName:(NSString *)titlename {
    UILabel *titlelabel = [[UILabel alloc] init];
    
    titlelabel.text = titlename;
    titlelabel.textColor = AppDefaultFontColor;
    titlelabel.font = [UIFont boldSystemFontOfSize:13];
    titlelabel.frame = CGRectMake(5, 5, DoraScreenWidth, 28);
    
    return titlelabel;
}
@end
