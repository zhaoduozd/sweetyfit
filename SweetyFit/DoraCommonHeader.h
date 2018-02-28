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

#endif /* DoraCommonHeader_h */
