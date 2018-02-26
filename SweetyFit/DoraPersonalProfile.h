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
@interface DoraPersonalProfile : UIView

@property(nonatomic,strong) UIImageView *profileImage;
@property(nonatomic,strong) UITextView *userName;
@property(nonatomic,strong) UITextView *userAccount;
@property(nonatomic,strong) UITextView *exerciseLevelName;
@property(nonatomic,strong) UITextView *exerciseLevelMark;

@end

#endif /* DoraPersonalProfile_h */
