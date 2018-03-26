//
//  UILabel+TextUI.m
//  SweetyFit
//
//  Created by Dora Zhao on 5/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "UILabel+TextUI.h"
#import "DoraColorDefineHeader.h"


@implementation UILabel (TextUI)
+(UILabel *) DoraCreateTextBoldTitleName:(NSString *)titlename {
    UILabel *titlelabel = [[UILabel alloc] init];
    
    titlelabel.text = titlename;
    titlelabel.textColor = AppDefaultFontColor;
    titlelabel.font = [UIFont systemFontOfSize:16];
    titlelabel.frame = CGRectMake(5, 5, DoraScreenWidth, 30);
    
    return titlelabel;
}

+(UILabel *) DoraCreateTextTitleName:(NSString *)titlename {
    UILabel *titlelabel = [[UILabel alloc] init];
    
    titlelabel.text = titlename;
    titlelabel.textColor = AppDefaultFontColor;
    titlelabel.font = [UIFont systemFontOfSize:16];
    titlelabel.frame = CGRectMake(5, 5, DoraScreenWidth, 30);
    
    return titlelabel;
}

+(UILabel *) DoraCreateTextSmallRightTitleName:(NSString *)titlename {
    UILabel *titlelabel = [[UILabel alloc] init];
    
    titlelabel.text = titlename;
    titlelabel.textColor = [UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:.7];
    titlelabel.font = [UIFont systemFontOfSize:13];
    titlelabel.textAlignment = NSTextAlignmentRight;
    
    return titlelabel;
}

+(UILabel *) DoraCreateTextSmallLeftTitleName:(NSString *)titlename {
    UILabel *titlelabel = [[UILabel alloc] init];
    
    titlelabel.text = titlename;
    titlelabel.textColor = [UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:.7];
    titlelabel.font = [UIFont systemFontOfSize:13];
    titlelabel.textAlignment = NSTextAlignmentLeft;
    
    return titlelabel;
}

+(UILabel *) DoraCreateTextSmallCenterTitleName:(NSString *)titlename {
    UILabel *titlelabel = [[UILabel alloc] init];
    
    titlelabel.text = titlename;
    titlelabel.textColor = [UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:.7];
    titlelabel.font = [UIFont systemFontOfSize:13];
    titlelabel.textAlignment = NSTextAlignmentCenter;
    
    return titlelabel;
}

@end
