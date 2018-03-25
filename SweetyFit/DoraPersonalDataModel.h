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

#define ChartLabelTextSize 15
#define ChartTextSize 15

@class DoraPersonalDataModel;
@protocol DoraPersonalDataObserver;
static DoraPersonalDataModel *sharedModel = nil;

@interface DoraPersonalDataModel : NSObject

@property(nonatomic,strong) id historyDelegate;
@property(nonatomic,strong) id foodDelegate;
@property(nonatomic,strong) id exerciseDelegate;
@property(nonatomic,strong) id profileDelegate;
@property(nonatomic,assign) BOOL isLoading;
@property(nonatomic,strong) NSString *level;
@property(nonatomic,strong) NSMutableArray *historyData;
@property(nonatomic,strong) NSMutableArray *exerciseSuggestionData;
@property(nonatomic,strong) NSMutableArray *foodSuggestionData;
@property(nonatomic,strong) NSString *exerciseSuggestion;
@property(nonatomic,strong) NSString *foodSuggestion;

+(DoraPersonalDataModel*)getInstance;
//network
-(void)getNetworkData;
//for histroty data

-(void)setHistoryDataWithArray:(NSArray *)data;
//for suggestion
-(PieChartData*)getFoodData;
-(PieChartData*)getExerciseData;
-(void)setExerciseSuggestionWithArray:(NSArray *)data withString:(NSString*) str;
-(void)setFoodSuggestionWithArray:(NSArray *)data withString:(NSString*) str;
@end

@protocol DoraPersonalDataObserver
@optional
-(void)updateFoodPieChartData;
-(void)updateExercisePieChartData;
-(void)updateBarChartData;
-(void)updateProfileData;
@end
#endif /* DoraPersonalDataModel_h */
