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

+(id)getInstance{
    if(!sharedModel){
        sharedModel = [[DoraPersonalDataModel alloc] init];
    }
    return sharedModel;
}
-(BarChartData*)getMonthData{
    if(self.historyData){
        return nil;
    }
    else
        return [self generateHistoryRandomData:100 count:11];
}

-(BarChartData*)getWeekData{
    if(self.historyData){
        for(NSDictionary *dic in self.historyData){
            
        }
        return nil;
    }
    else
        return [self generateHistoryRandomData:100 count:51];
}

-(BarChartData*)getDayData{
    if(self.historyData){
        return nil;
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


@end



