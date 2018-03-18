//
//  PersonalDataModel.m
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/3/17.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraPersonalDataModel.h"

@implementation DoraPersonalDataModel

+(DoraPersonalDataModel*)getInstance{
    if(!sharedModel){
        sharedModel = [[DoraPersonalDataModel alloc] init];
    }
    [sharedModel getNetworkData];
    return sharedModel;
}
-(BarChartData*)getMonthData{
    if(self.historyData){
        NSDate *curDate = nil;
        NSMutableArray *yVals = [[NSMutableArray alloc] init];
        NSInteger xVal = 1;
        CGFloat yVal = 0;
        NSInteger accumulate = 0;
        NSInteger monthDays = 0;
        BOOL start = YES;
        
        for(NSDictionary *dic in self.historyData){
            curDate = [dic objectForKey:@"Date"];
            accumulate = [self getNumberOfDaysInMonth:curDate];
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSUInteger unitFlags =     NSCalendarUnitYear |    NSCalendarUnitMonth |    NSCalendarUnitDay |    NSCalendarUnitHour |    NSCalendarUnitMinute |    NSCalendarUnitSecond;
            NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:curDate];
            
            NSInteger month = [dateComponent month];
            while(xVal<month && start){
                [yVals addObject:[[BarChartDataEntry alloc] initWithX:xVal y:yVal]];
                xVal+=1;
                yVal=0;
            }
            start = NO;
            if(monthDays == 0 ){
                monthDays = accumulate;
            }
            
            if(monthDays!=accumulate){
                accumulate=0;
                monthDays = accumulate;
                [yVals addObject:[[BarChartDataEntry alloc] initWithX:xVal y:yVal]];
                xVal+=1;
                yVal= [[dic objectForKey:@"Calories"] floatValue];
            }
            else{
                 yVal += [[dic objectForKey:@"Calories"] floatValue];
            }
        }
        while(xVal<=12){
            [yVals addObject:[[BarChartDataEntry alloc] initWithX:xVal y:yVal]];
            xVal+=1;
            yVal=0;
        }
        BarChartDataSet *set1 = nil;
        
        set1 = [[BarChartDataSet alloc] initWithValues:yVals label:@""];
        
        [set1 setColors:@[UIColor.cyanColor]];
        set1.drawIconsEnabled = NO;
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont systemFontOfSize:10.f]];
        [data setValueTextColor:UIColor.blackColor];
        
        data.barWidth = 0.9f;
        
        return data;
    }
    else
        return [self generateHistoryRandomData:100 count:11];
}

-(BarChartData*)getWeekData{
    if(self.historyData){
        NSDate *curDate = nil;
        NSMutableArray *yVals = [[NSMutableArray alloc] init];
        NSInteger xVal = 1;
        CGFloat yVal = 0;
        NSInteger accumulate = 0;
        for(NSDictionary *dic in self.historyData){
            curDate = [dic objectForKey:@"Date"];
            accumulate+=1;
            yVal += [[dic objectForKey:@"Calories"] floatValue];
            if(accumulate==7){
                accumulate=0;
                [yVals addObject:[[BarChartDataEntry alloc] initWithX:xVal y:yVal]];
                xVal+=1;
                yVal=0;
            }
        }
        while(xVal<=52){
            [yVals addObject:[[BarChartDataEntry alloc] initWithX:xVal y:yVal]];
            xVal+=1;
            yVal = 0;
        }
        BarChartDataSet *set1 = nil;
        
        set1 = [[BarChartDataSet alloc] initWithValues:yVals label:@""];
        
        [set1 setColors:@[UIColor.cyanColor]];
        set1.drawIconsEnabled = NO;
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont systemFontOfSize:10.f]];
        [data setValueTextColor:UIColor.blackColor];
        
        data.barWidth = 0.9f;
        
        return data;
    }
    else
        return [self generateHistoryRandomData:100 count:51];
}

-(BarChartData*)getDayData{
    if(self.historyData){
        NSDate *curDate = nil;
        NSMutableArray *yVals = [[NSMutableArray alloc] init];
        NSInteger xVal = 1;
        CGFloat yVal = 0;
        NSInteger accumulate = 0;
        for(NSDictionary *dic in self.historyData){
            curDate = [dic objectForKey:@"Date"];
            accumulate+=1;
            yVal += [[dic objectForKey:@"Calorie"] floatValue];
            [yVals addObject:[[BarChartDataEntry alloc] initWithX:xVal y:yVal]];
            xVal+=1;
            yVal=0;
            
        }
        while(xVal<=365){
            [yVals addObject:[[BarChartDataEntry alloc] initWithX:xVal y:yVal]];
            xVal+=1;
        }
        BarChartDataSet *set1 = nil;
        
        set1 = [[BarChartDataSet alloc] initWithValues:yVals label:@""];
        
        [set1 setColors:@[UIColor.cyanColor]];
        set1.drawIconsEnabled = NO;
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont systemFontOfSize:10.f]];
        [data setValueTextColor:UIColor.blackColor];
        
        data.barWidth = 0.9f;
        
        return data;
    }
    else
        return [self generateHistoryRandomData:100 count:364];
}

-(BarChartData*)generateHistoryRandomData:(NSInteger)range count:(NSInteger)count{
    double start = 1.0;
    
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    
    for (int i = start; i < start + count + 1; i++)
    {
        double mult = (range + 1);
        double val = (double) (arc4random_uniform(mult));
        if (arc4random_uniform(100) < 25) {
            [yVals addObject:[[BarChartDataEntry alloc] initWithX:i y:val icon: [UIImage imageNamed:@"icon"]]];
        } else {
            [yVals addObject:[[BarChartDataEntry alloc] initWithX:i y:val]];
        }
    }
    
    BarChartDataSet *set1 = nil;
   
    set1 = [[BarChartDataSet alloc] initWithValues:yVals label:@""];

    [set1 setColors:@[UIColor.cyanColor]];
    set1.drawIconsEnabled = NO;
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:set1];
    
    BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
    [data setValueFont:[UIFont systemFontOfSize:10.f]];
    [data setValueTextColor:UIColor.blackColor];
    
    data.barWidth = 0.9f;
    
    return data;
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
            [formatter1 setDateFormat:@"yyyy-MM-dd"];
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
            
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:resDate,@"Date",[dic objectForKey:@"Calories"],@"Calories", nil];
            [self.historyData addObject:dictionary];
        }
        else{

            NSString *date = [dic objectForKey:@"Date"];
            
            NSDateFormatter *formatter1 = [[NSDateFormatter alloc]init];
            [formatter1 setDateFormat:@"yyyy-MM-dd"];
            curDate = [formatter1 dateFromString:date];
            curDate = [curDate  dateByAddingTimeInterval: interval];
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:curDate,@"Date",[dic objectForKey:@"Calories"],@"Calories", nil];
            [self.historyData addObject:dictionary];
        }
        
    }
}

-(void)setExerciseSuggestionWithArray:(NSArray *)data withString:(NSString*) str{
    self.exerciesSuggestion = str;
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
        [values addObject:[[PieChartDataEntry alloc] initWithValue: [[dic objectForKey:@"Value"] floatValue] label:[dic objectForKey:@"Label"] icon: [UIImage imageNamed:@"icon"]]];
    }
    
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:values label:@""];
    
    dataSet.drawIconsEnabled = NO;
    
    dataSet.sliceSpace = 2.0;
    dataSet.iconsOffset = CGPointMake(0, 10);
    
    // add a lot of colors
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObject:[UIColor colorWithRed:255/255.f green:255/255.f blue:0/255.f alpha:1.f]];
    [colors addObject:[UIColor colorWithRed:0/255.f green:0/255.f blue:255/255.f alpha:1.f]];
    [colors addObject:[UIColor colorWithRed:255/255.f green:0/255.f blue:0/255.f alpha:1.f]];
    [colors addObject:[UIColor colorWithRed:0/255.f green:255/255.f blue:0/255.f alpha:1.f]];
    
    dataSet.colors = colors;
    
    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
    
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
    [data setValueFont:[UIFont systemFontOfSize:12.0f]];
    [data setValueTextColor:UIColor.blackColor];
    
    return data;
}

-(PieChartData*)getExerciseData{
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in self.exerciseSuggestionData)
    {
        [values addObject:[[PieChartDataEntry alloc] initWithValue: [[dic objectForKey:@"Num"] floatValue] label:[dic objectForKey:@"Name"] icon: [UIImage imageNamed:@"icon"]]];
    }
    
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:values label:@""];
    
    dataSet.drawIconsEnabled = NO;
    
    dataSet.sliceSpace = 2.0;
    dataSet.iconsOffset = CGPointMake(0, 10);
    
    // add a lot of colors
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObject:[UIColor colorWithRed:255/255.f green:255/255.f blue:0/255.f alpha:1.f]];
    [colors addObject:[UIColor colorWithRed:0/255.f green:0/255.f blue:255/255.f alpha:1.f]];
    [colors addObject:[UIColor colorWithRed:255/255.f green:0/255.f blue:0/255.f alpha:1.f]];
    [colors addObject:[UIColor colorWithRed:0/255.f green:255/255.f blue:0/255.f alpha:1.f]];
    
    dataSet.colors = colors;
    
    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
    
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
    [data setValueFont:[UIFont systemFontOfSize:12.0f]];
    [data setValueTextColor:UIColor.blackColor];
    
    return data;
}

-(void)getNetworkData{
    NSString *urlString = [serverurl stringByAppendingString:@"/account/personal?u="];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    urlString = [urlString stringByAppendingString:[defaults objectForKey:@"uid"]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer= [AFHTTPRequestSerializer new];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        responseObject = (NSDictionary *)responseObject;
        NSDictionary *fadvice = [responseObject objectForKey:@"fadvice"];
        NSDictionary *eadvice = [responseObject objectForKey:@"eadvice"];
        NSArray *history = [[NSArray alloc] initWithObjects:[responseObject objectForKey:@"history"],nil];
        NSArray *fdata = [fadvice objectForKey:@"AdviceData"];
        NSArray *edata = [eadvice objectForKey:@"AdviceData"];
        NSString *fcontent = [fadvice objectForKey:@"AdviceContent"];
        NSString *econtent = [fadvice objectForKey:@"AdviceContent"];
        [self setFoodSuggestionWithArray:fdata withString:fcontent];
        [self setExerciseSuggestionWithArray:edata withString:econtent];
        [self setHistoryDataWithArray:history];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
    }];
    
}

- (NSInteger)getNumberOfDaysInMonth:(NSDate*)date
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit: NSCalendarUnitMonth
                                  forDate:date];
    return range.length;
}
@end



