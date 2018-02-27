//
//  DoraPersonalProfile.m
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/2/26.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraPersonalProfile.h"

#define margin 5
#define imageSize self.frame.size.height-2*margin
#define textWidth 100


@implementation DoraPersonalProfile

-(id)init{
    return [super init];
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = AppDefaultBarTintColor;
    
    self.profileImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"placeholder"]];
    self.profileImage.frame = CGRectMake(margin, margin, imageSize, imageSize);
    
    [self addSubview:self.profileImage];
    
    CGFloat userNameX = margin*2+imageSize;
    CGFloat userNameheight = 25.0f;
    self.userName = [[UILabel alloc] initWithFrame:CGRectMake(userNameX, frame.size.height-margin*2-userNameheight*2, textWidth, userNameheight)];
    self.userName.text = @"user name";
    self.userName.textColor = textColorWhite;
    self.userName.font = [UIFont boldSystemFontOfSize:20];
    [self addSubview:self.userName];
    
    self.userAccount = [[UILabel alloc] initWithFrame:CGRectMake(userNameX, frame.size.height-margin-userNameheight, textWidth, userNameheight)];
    self.userAccount.text = @"user acct";
    self.userAccount.textColor = textColorWhite;
    [self addSubview:self.userAccount];
    
    CGFloat exerciseLevelMarkWidth = 40;
    CGFloat exerciseLevelMarkX = frame.size.width-margin-exerciseLevelMarkWidth;
    self.exerciseLevelMark = [[UILabel alloc] initWithFrame:CGRectMake(exerciseLevelMarkX, frame.size.height-margin-userNameheight, exerciseLevelMarkWidth, 25)];
    self.exerciseLevelMark.text = @"SSS";
    self.exerciseLevelMark.textColor = textColorWhite;
    [self addSubview:self.exerciseLevelMark];
    
    CGFloat exerciseLevelNameWidth = 80;
    CGFloat exerciseLevelNameX = exerciseLevelMarkX - exerciseLevelNameWidth;
    self.exerciseLevelName = [[UILabel alloc] initWithFrame:CGRectMake(exerciseLevelNameX, frame.size.height-margin-userNameheight,exerciseLevelNameWidth, 25)];
    self.exerciseLevelName.text = @"运动等级:";
    self.exerciseLevelName.textColor = textColorWhite;
    [self addSubview:self.exerciseLevelName];

    return self;
}

@end
