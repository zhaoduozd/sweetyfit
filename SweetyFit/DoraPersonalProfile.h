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
@interface DoraPersonalProfile : NSObject

@property(nonatomic,strong) UIImageView *profileImage;
@property(nonatomic,strong) UIText *userName;
@property(nonatomic,strong) UIText *userAccount;
@property(nonatomic,strong) UIText *exerciseLevelName;
@property(nonatomic,strong) UIText *exerciseLevelMark;

@end

#endif /* DoraPersonalProfile_h */
