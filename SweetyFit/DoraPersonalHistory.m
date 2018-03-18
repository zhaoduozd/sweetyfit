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
@interface DoraPersonalHistory ()<ChartViewDelegate>
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
    self.barChartView.data = [[DoraPersonalDataModel getInstance] getDayData];
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
    switch (self.status) {
        case 0:
            [self.button_day setBackgroundColor:[UIColor grayColor]];
            self.barChartView.data = [[DoraPersonalDataModel getInstance] getDayData];
            break;
        case 1:
            [self.button_week setBackgroundColor:[UIColor grayColor]];
            self.barChartView.data = [[DoraPersonalDataModel getInstance] getWeekData];
            break;
        case 2:
            [self.button_month setBackgroundColor:[UIColor grayColor]];
            self.barChartView.data = [[DoraPersonalDataModel getInstance] getMonthData];
            break;
        default:
            break;
    }
}

@end
