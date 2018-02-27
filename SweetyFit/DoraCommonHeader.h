//
//  DoraCommonHeader.h
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/1/20.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#ifndef DoraCommonHeader_h
#define DoraCommonHeader_h
// Documents

#import "UILabel+TextUI.h"
#import "UIImageView+ImageViewUI.h"
#import "UIScrollView+DoraScrollUI.h"
#import "UIView+DoraViewUI.h"
#import "UIButton+DoraButtonUI.h"

// Screen information

#define DoraScreenWidth [UIScreen mainScreen].bounds.size.width
#define DoraScreenHeight [UIScreen mainScreen].bounds.size.height

// Networking information

#define DoraTimeOutIntervel 30
#define DoraRequestUrl @"http://dorasweetyfit.com:3000"

// Colors

#define AppDefaultColor [UIColor colorWithRed:233.0/255.0 green:98.0/255.0 blue:8.0/255.0 alpha:1]

#define AppDefaultBackgroundColor [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1]

#define AppDefaultBorderColor [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1]

#define AppDefaultFontColor [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1]

#define AppDefaultSubViewBackgroundColor [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1]

#define AppDefaultBarTintColor [UIColor colorWithRed:60.0/255.0 green:60.0/255.0 blue:60.0/255.0 alpha:1]

#define AppLoginTextColor [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1]

#define AppLoginBorderColor [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1].CGColor

#define textColorWhite [UIColor whiteColor]

#endif /* DoraCommonHeader_h */
