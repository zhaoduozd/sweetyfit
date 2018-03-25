//
//  DoraPersonalProfile.h
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/2/26.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#ifndef DoraPersonalProfile_h
#define DoraPersonalProfile_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DoraCommonHeader.h"

@interface DoraPersonalProfile : UIView

@property(nonatomic,strong) UIImageView *profileImage;
@property(nonatomic,strong) UILabel *userName;
@property(nonatomic,strong) UILabel *userAccount;
@property(nonatomic,strong) UILabel *exerciseLevelName;
@property(nonatomic,strong) UILabel *exerciseLevelMark;

@end

#endif /* DoraPersonalProfile_h */
