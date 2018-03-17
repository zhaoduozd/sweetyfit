//
//  DoraPersonalDataModel.h
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/3/17.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#ifndef DoraPersonalDataModel_h
#define DoraPersonalDataModel_h
#import "SweetyFit-Bridging-Header.h"
@class DoraPersonalDataModel;
static DoraPersonalDataModel *sharedModel = nil;
@interface DoraPersonalDataModel : NSObject
@property NSMutableArray *historyData;
+(id)getInstance;
-(BarChartData*)getMonthData;
-(BarChartData*)getWeekData;
-(BarChartData*)getDayData;
-(BarChartData*)generateHistoryRandomData:(NSInteger)range count:(NSInteger)count;
@end



#endif /* DoraPersonalDataModel_h */
