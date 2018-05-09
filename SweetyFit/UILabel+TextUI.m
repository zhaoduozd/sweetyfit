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

+(UILabel *) DoraCreateMultilinesUILabel:(NSString *) text LineNum:(NSUInteger) linenum FontSize:(NSUInteger) fontsize LineSpace:(NSUInteger) linespace TextColor:(UIColor *) textcolor {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontsize];
    label.numberOfLines = linenum;
    label.textColor = textcolor;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    label.attributedText = attributedString;
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}

@end
