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
#import "DoraCommonHeader.h"
@class DoraPersonalDataModel;
static DoraPersonalDataModel *sharedModel = nil;

@interface DoraPersonalDataModel : NSObject

@property(nonatomic,strong) NSMutableArray *historyData;
@property(nonatomic,strong) NSMutableArray *exerciseSuggestionData;
@property(nonatomic,strong) NSMutableArray *foodSuggestionData;
@property(nonatomic,strong) NSString *exerciesSuggestion;
@property(nonatomic,strong) NSString *foodSuggestion;

+(DoraPersonalDataModel*)getInstance;
//network
-(void)getNetworkData;
//for histroty data
-(BarChartData*)getMonthData;
-(BarChartData*)getWeekData;
-(BarChartData*)getDayData;
-(BarChartData*)generateHistoryRandomData:(NSInteger)range count:(NSInteger)count;
-(void)setHistoryDataWithArray:(NSArray *)data;
//for suggestion
-(PieChartData*)getFoodData;
-(PieChartData*)getExerciseData;
-(void)setExerciseSuggestionWithArray:(NSArray *)data withString:(NSString*) str;
-(void)setFoodSuggestionWithArray:(NSArray *)data withString:(NSString*) str;
@end
#endif /* DoraPersonalDataModel_h */
