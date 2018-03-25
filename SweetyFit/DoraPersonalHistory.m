//
//  DoraPersonalHistory.m
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/2/26.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraPersonalHistory.h"
#import "DoraColorDefineHeader.h"
#import "DoraPersonalDataModel.h"
#define margin 5
#define titleHeight 30
@interface DoraPersonalHistory ()<ChartViewDelegate,DoraPersonalDataObserver>
@property(nonatomic, strong) UIButton *button_day;
@property(nonatomic, strong) UIButton *button_week;
@property(nonatomic, strong) UIButton *button_month;
@property(nonatomic, assign) NSInteger status;
@end

@implementation DoraPersonalHistory

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.status = 0;
    
    self.backgroundColor = AppDefaultBackgroundColor;
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(margin, margin, frame.size.width, titleHeight)];
    //[self.title setTextAlignment:NSTextAlignmentCenter];
    self.title.text = @"运动历史";
    [self.title setFont:[UIFont boldSystemFontOfSize:18]];
    [self addSubview:self.title];
    
    CGFloat btn_width = (self.frame.size.width-margin*2)/3;
    self.button_day = [[UIButton alloc]initWithFrame:CGRectMake(margin, margin+titleHeight,btn_width,30)];
    [self.button_day setTitle:@"日" forState:UIControlStateNormal];
    [self.button_day addTarget:self action:@selector(downButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.button_day setBackgroundColor:[UIColor grayColor]];
    
    self.button_week = [[UIButton alloc]initWithFrame:CGRectMake(margin+btn_width, margin+titleHeight,btn_width,30)];
    [self.button_week setTitle:@"周" forState:UIControlStateNormal];
    [self.button_week addTarget:self action:@selector(downButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.button_week setBackgroundColor:[UIColor darkGrayColor]];
    
    self.button_month = [[UIButton alloc]initWithFrame:CGRectMake(margin+btn_width*2, margin+titleHeight,btn_width,30)];
    [self.button_month setTitle:@"月" forState:UIControlStateNormal];
    [self.button_month addTarget:self action:@selector(downButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.button_month setBackgroundColor:[UIColor darkGrayColor]];
    
    [self addSubview:self.button_day];
    [self addSubview:self.button_week];
    [self addSubview:self.button_month];
    
    self.barChartView=[[BarChartView alloc] initWithFrame:CGRectMake(margin, margin+30+margin+titleHeight,self.frame.size.width-margin*2,self.frame.size.height-3*margin-30-titleHeight)];
    [self setUpBarChart];
    [self addSubview:self.barChartView];

    //self.barChartView.data = [[DoraPersonalDataModel getInstance] getDayData];
    [self.barChartView highlightValues:nil];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    return self;
}

-(void)setUpBarChart{
    
    self.barChartView.chartDescription.enabled = NO;
    
    self.barChartView.drawGridBackgroundEnabled = NO;
    
    self.barChartView.dragEnabled = NO;
    [self.barChartView setScaleEnabled:NO];
    self.barChartView.pinchZoomEnabled = NO;
    
    // ChartYAxis *leftAxis = chartView.leftAxis;
    
    ChartXAxis *xAxis = self.barChartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    
    self.barChartView.rightAxis.enabled = NO;
  
    self.barChartView.delegate = self;
    
    self.barChartView.drawBarShadowEnabled = NO;
    self.barChartView.drawValueAboveBarEnabled = YES;
    
    self.barChartView.maxVisibleCount = 60;
    
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelFont = [UIFont systemFontOfSize:10.f];
    xAxis.drawGridLinesEnabled = NO;
    xAxis.labelTextColor = UIColor.blackColor;
    xAxis.granularity = 1.0; // only intervals of 1 day
    xAxis.labelCount = 7;
    xAxis.valueFormatter = [[DayAxisValueFormatter alloc] initForChart:self.barChartView];
    
    NSNumberFormatter *leftAxisFormatter = [[NSNumberFormatter alloc] init];
    leftAxisFormatter.minimumFractionDigits = 0;
    leftAxisFormatter.maximumFractionDigits = 1;
    leftAxisFormatter.negativeSuffix = @"Cal";
    leftAxisFormatter.positiveSuffix = @"Cal";
    
    ChartYAxis *leftAxis = self.barChartView.leftAxis;
    leftAxis.labelFont = [UIFont systemFontOfSize:10.f];
    leftAxis.labelCount = 8;
    leftAxis.labelTextColor = UIColor.blackColor;
    leftAxis.valueFormatter = [[ChartDefaultAxisValueFormatter alloc] initWithFormatter:leftAxisFormatter];
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
    leftAxis.spaceTop = 0.15;
    leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
    
    ChartYAxis *rightAxis = self.barChartView.rightAxis;
    rightAxis.enabled = NO;
    
    ChartLegend *l = self.barChartView.legend;
    l.enabled = NO;
}


-(void)downButtonPressed:(UIButton *)btn{
    if([btn isEqual:self.button_day]){
        self.status = 0;
    }
    if([btn isEqual:self.button_week]){
        self.status = 1;
    }
    if([btn isEqual:self.button_month]){
        self.status = 2;
    }
    [self.button_day setBackgroundColor:[UIColor darkGrayColor]];
    [self.button_week setBackgroundColor:[UIColor darkGrayColor]];
    [self.button_month setBackgroundColor:[UIColor darkGrayColor]];
    [self updateBarChartData];
}

-(BarChartData*)getMonthData{
    if([DoraPersonalDataModel getInstance].historyData){
        NSDate *curDate = nil;
        NSMutableArray *yVals = [[NSMutableArray alloc] init];
        NSInteger xVal = 1;
        CGFloat yVal = 0;
        NSInteger accumulate = 0;
        NSInteger monthDays = 0;
        BOOL start = YES;
        
        for(NSDictionary *dic in [DoraPersonalDataModel getInstance].historyData){
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
    return nil;
}

-(BarChartData*)getWeekData{
    if([DoraPersonalDataModel getInstance].historyData){
        NSDate *curDate = nil;
        NSMutableArray *yVals = [[NSMutableArray alloc] init];
        NSInteger xVal = 1;
        CGFloat yVal = 0;
        NSInteger accumulate = 0;
        for(NSDictionary *dic in [DoraPersonalDataModel getInstance].historyData){
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
    return nil;
}

-(BarChartData*)getDayData{
    if([DoraPersonalDataModel getInstance].historyData){
        NSDate *curDate = nil;
        NSMutableArray *yVals = [[NSMutableArray alloc] init];
        NSInteger xVal = 1;
        CGFloat yVal = 0;
        NSInteger accumulate = 0;
        for(NSDictionary *dic in [DoraPersonalDataModel getInstance].historyData){
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
    return nil;
}
//测试用
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

- (NSInteger)getNumberOfDaysInMonth:(NSDate*)date
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit: NSCalendarUnitMonth
                                  forDate:date];
    return range.length;
}


-(void)updateBarChartData{
    if(![DoraPersonalDataModel getInstance].isLoading){
        switch (self.status) {
            case 0:
                [self.button_day setBackgroundColor:[UIColor grayColor]];
                self.barChartView.data = [self getDayData];
                break;
            case 1:
                [self.button_week setBackgroundColor:[UIColor grayColor]];
                self.barChartView.data = [self getWeekData];
                break;
            case 2:
                [self.button_month setBackgroundColor:[UIColor grayColor]];
                self.barChartView.data = [self getMonthData];
                break;
            default:
                break;
        }
    }
}

@end
