//
//  PersonalDataModel.m
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/3/17.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraPersonalDataModel.h"
#import "DoraColorDefineHeader.h"

@implementation DoraPersonalDataModel

+(DoraPersonalDataModel*)getInstance{
    if(!sharedModel){
        sharedModel = [[DoraPersonalDataModel alloc] init];
        sharedModel.isLoading = YES; // 初始化
        [sharedModel getNetworkData];
    }
    return sharedModel;
}

-(void)setHistoryDataWithArray:(NSArray *)data{
    self.historyData = [[NSMutableArray alloc]init];
    NSDate *curDate = nil;
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSDate *nowDate = [NSDate date];
    NSInteger interval = [zone secondsFromGMTForDate: nowDate];
    for(NSDictionary *dic in data){
        if(curDate){
            NSString *date = [dic objectForKey:@"Date"];
            NSDateFormatter *formatter1 = [[NSDateFormatter alloc]init];
            [formatter1 setDateFormat:@"yyyyMMdd"];
            NSDate *resDate = [formatter1 dateFromString:date];
            resDate = [resDate  dateByAddingTimeInterval: interval];
            NSTimeInterval time = [resDate timeIntervalSinceDate:curDate];
            //开始时间和结束时间的中间相差的时间
            NSInteger days;
            days = ((int)time)/(3600*24);  //一天是24小时*3600秒
            while(days>1){
                curDate = [NSDate dateWithTimeInterval:24*60*60 sinceDate:curDate];
                //curDate = [curDate  dateByAddingTimeInterval: interval];
                NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:curDate,@"Date",@"0",@"Calories", nil];
                [self.historyData addObject:dictionary];
                days-=1;
            }
            
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:resDate,@"Date",[dic objectForKey:@"Calorie"],@"Calories", nil];
            [self.historyData addObject:dictionary];
        }
        else{

            NSString *date = [dic objectForKey:@"Date"];
            
            NSDateFormatter *formatter1 = [[NSDateFormatter alloc]init];
            [formatter1 setDateFormat:@"yyyyMMdd"];
            curDate = [formatter1 dateFromString:date];
            curDate = [curDate  dateByAddingTimeInterval: interval];
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:curDate,@"Date",[dic objectForKey:@"Calorie"],@"Calories", nil];
            [self.historyData addObject:dictionary];
        }
        
    }
}

-(void)setExerciseSuggestionWithArray:(NSArray *)data withString:(NSString*) str{
    self.exerciseSuggestion = str;
    self.exerciseSuggestionData = [[NSMutableArray alloc] initWithArray:data];
}

-(void)setFoodSuggestionWithArray:(NSArray *)data withString:(NSString*) str{
    self.foodSuggestion = str;
    self.foodSuggestionData = [[NSMutableArray alloc] initWithArray:data];
}

-(PieChartData*)getFoodData{
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in self.foodSuggestionData)
    {
        [values addObject:[[PieChartDataEntry alloc] initWithValue: [[dic objectForKey:@"Data"] floatValue] label:[dic objectForKey:@"Type"] icon: [UIImage imageNamed:@"icon"]]];
    }
    
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:values label:@""];
    
    dataSet.drawIconsEnabled = NO;
    
    dataSet.sliceSpace = 2.0;
    dataSet.iconsOffset = CGPointMake(0, 10);
    
    // add a lot of colors
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObject:ChartColorSet1];
    [colors addObject:ChartColorSet2];
    [colors addObject:ChartColorSet3];
    [colors addObject:ChartColorSet4];
    [colors addObject:ChartColorSet5];
    [colors addObject:ChartColorSet6];  
    
    dataSet.colors = colors;
    
    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
    
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
    [data setValueFont:[UIFont systemFontOfSize:ChartTextSize]];
    [data setValueTextColor:ChartColorText];
    
    return data;
}

-(PieChartData*)getExerciseData{
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in self.exerciseSuggestionData)
    {
        [values addObject:[[PieChartDataEntry alloc] initWithValue: [[dic objectForKey:@"Data"] floatValue] label:[dic objectForKey:@"Type"] icon: [UIImage imageNamed:@"icon"]]];
    }
    
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:values label:@""];
    
    dataSet.drawIconsEnabled = NO;
    
    dataSet.sliceSpace = 2.0;
    dataSet.iconsOffset = CGPointMake(0, 10);
    
    // add a lot of colors
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObject:ChartColorSet1];
    [colors addObject:ChartColorSet2];
    [colors addObject:ChartColorSet3];
    [colors addObject:ChartColorSet4];
    [colors addObject:ChartColorSet5];
    [colors addObject:ChartColorSet6];
    dataSet.colors = colors;
    
    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
    
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
    [data setValueFont:[UIFont systemFontOfSize:ChartTextSize]];
    [data setValueTextColor:ChartColorText];
    
    return data;
}

-(void)getNetworkData{
    sharedModel.isLoading=YES;
    NSString *urlString = [serverurl stringByAppendingString:@"/account/personal?u="];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"uid"]){
        urlString = [urlString stringByAppendingString:[defaults objectForKey:@"uid"]];
    }
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"personal data require start");
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer= [AFHTTPRequestSerializer new];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary *json = (NSDictionary *)responseObject;
        NSDictionary *fadvice = [json objectForKey:@"dietAdvice"];
        NSDictionary *eadvice = [json objectForKey:@"exerciseAdvice"];
        if([[json objectForKey:@"history"] count]!=0){
            NSArray *history = [[NSArray alloc] initWithArray:[json objectForKey:@"history"]];
            NSLog(@"%@", history);
            [self setHistoryDataWithArray:history];
        }
        NSDictionary *fdic = [[fadvice objectForKey:@"Data"] objectAtIndex:0];
        NSDictionary *edic = [[eadvice objectForKey:@"Data"] objectAtIndex:0];
        NSString *fcontent = [fadvice objectForKey:@"Advice"];
        NSString *econtent = [eadvice objectForKey:@"Advice"];
        self.level = [json objectForKey:@"level"];
        NSMutableArray *fdata = [[NSMutableArray alloc] init];
        NSMutableArray *edata = [[NSMutableArray alloc] init];
        for(int i=0;i<[[fdic objectForKey:@"Type"] count];i++){
            NSDictionary *tempdict = [NSDictionary dictionaryWithObjectsAndKeys:[fdic objectForKey:@"Data"][i],@"Data",[fdic objectForKey:@"Type"][i],@"Type",nil];
            [fdata addObject:tempdict];
        }
        
        for(int i=0;i<[[edic objectForKey:@"Type"] count];i++){
            [edata addObject:[NSDictionary dictionaryWithObjectsAndKeys:[edic objectForKey:@"Data"][i],@"Data",[edic objectForKey:@"Type"][i],@"Type",nil]];
        }
        
        [self setFoodSuggestionWithArray:fdata withString:fcontent];
        [self setExerciseSuggestionWithArray:edata withString:econtent];
        
        
        sharedModel.isLoading = NO;
        
        if(self.historyDelegate && [self.historyDelegate respondsToSelector:@selector(updateBarChartData)]){
            [self.historyDelegate updateBarChartData];
        }
        
        if(self.foodDelegate && [self.foodDelegate respondsToSelector:@selector(updateFoodPieChartData)]){
            [self.foodDelegate updateFoodPieChartData];
        }
        
        if(self.exerciseDelegate && [self.exerciseDelegate respondsToSelector:@selector(updateExercisePieChartData)]){
            [self.exerciseDelegate updateExercisePieChartData];
        }
        
        if(self.profileDelegate && [self.profileDelegate respondsToSelector:@selector(updateProfileData)]){
            [self.profileDelegate updateProfileData];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
    }];
    
    
}


@end



