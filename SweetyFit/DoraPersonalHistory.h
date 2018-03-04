//
//  DoraPersonalHistory.h
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/2/26.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#ifndef DoraPersonalHistory_h
#define DoraPersonalHistory_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DoraCommonHeader.h"
#import "SweetyFit-Bridging-Header.h"
#import "DayAxisValueFormatter.h"
@interface DoraPersonalHistory : UIView
@property (nonatomic, strong) BarChartView *barChartView;

@property(nonatomic,strong) UIButton *buttonMonth;
@property(nonatomic,strong) UIButton *buttonWeek;
@property(nonatomic,strong) UIButton *buttonDay;
@end

#endif /* DoraPersonalHistory_h */
