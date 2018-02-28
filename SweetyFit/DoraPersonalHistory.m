//
//  DoraPersonalHistory.m
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/2/26.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraPersonalHistory.h"
@interface DoraPersonalHistory ()
@property(nonatomic, strong) NSArray *Titles;
@end

@implementation DoraPersonalHistory

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self.Titles = @[@"月", @"周", @"日"];
    
    self.backgroundColor = AppDefaultBarTintColor;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    return self;
}

@end
