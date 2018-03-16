//
//  DoraPersonalSuggestion.h
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/2/26.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#ifndef DoraPersonalSuggestion_h
#define DoraPersonalSuggestion_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DoraCommonHeader.h"
#import "SweetyFit-Bridging-Header.h"
@interface DoraPersonalSuggestion : UIView<ChartViewDelegate>

@property(strong,nonatomic) NSArray *parties;
@property(strong,nonatomic) UILabel *title;
@property(strong,nonatomic) UITextView *suggestView;
@property(strong,nonatomic) PieChartView *pieChartView;
@property(strong,nonatomic) PieChartData *pieChartData;
@end

#endif /* DoraPersonalSuggestion_h */
