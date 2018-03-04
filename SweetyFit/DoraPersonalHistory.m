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
#define margin 5
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
    self.backgroundColor = AppDefaultBarTintColor;
    CGFloat btn_width = (self.frame.size.width-margin*2)/3;
    self.button_day = [[UIButton alloc]initWithFrame:CGRectMake(margin, margin,btn_width,30)];
    [self.button_day setTitle:@"日" forState:UIControlStateNormal];
    [self.button_day addTarget:self action:@selector(downButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.button_day setBackgroundColor:[UIColor grayColor]];
    
    self.button_week = [[UIButton alloc]initWithFrame:CGRectMake(margin+btn_width, margin,btn_width,30)];
    [self.button_week setTitle:@"周" forState:UIControlStateNormal];
    [self.button_week addTarget:self action:@selector(downButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.button_week setBackgroundColor:[UIColor darkGrayColor]];
    
    self.button_month = [[UIButton alloc]initWithFrame:CGRectMake(margin+btn_width*2, margin,btn_width,30)];
    [self.button_month setTitle:@"月" forState:UIControlStateNormal];
    [self.button_month addTarget:self action:@selector(downButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.button_month setBackgroundColor:[UIColor darkGrayColor]];
    
    [self addSubview:self.button_day];
    [self addSubview:self.button_week];
    [self addSubview:self.button_month];
    
    self.barChartView=[[BarChartView alloc] initWithFrame:CGRectMake(margin, margin+30+margin,self.frame.size.width-margin*2,self.frame.size.height-3*margin-30)];
    [self setUpBarChart];
    [self addSubview:self.barChartView];
    [self setDataCount:365 range:100];
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
    xAxis.labelTextColor = UIColor.whiteColor;
    xAxis.granularity = 1.0; // only intervals of 1 day
    xAxis.labelCount = 7;
    xAxis.valueFormatter = [[DayAxisValueFormatter alloc] initForChart:self.barChartView];
    
    NSNumberFormatter *leftAxisFormatter = [[NSNumberFormatter alloc] init];
    leftAxisFormatter.minimumFractionDigits = 0;
    leftAxisFormatter.maximumFractionDigits = 1;
    leftAxisFormatter.negativeSuffix = @" H";
    leftAxisFormatter.positiveSuffix = @" H";
    
    ChartYAxis *leftAxis = self.barChartView.leftAxis;
    leftAxis.labelFont = [UIFont systemFontOfSize:10.f];
    leftAxis.labelCount = 8;
    leftAxis.labelTextColor = UIColor.whiteColor;
    leftAxis.valueFormatter = [[ChartDefaultAxisValueFormatter alloc] initWithFormatter:leftAxisFormatter];
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
    leftAxis.spaceTop = 0.15;
    leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
    
    ChartYAxis *rightAxis = self.barChartView.rightAxis;
    rightAxis.enabled = NO;
    
    ChartLegend *l = self.barChartView.legend;
    l.enabled = NO;
}


- (void)setDataCount:(int)count range:(double)range
{
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
    if (self.barChartView.data.dataSetCount > 0)
    {
        set1 = (BarChartDataSet *)self.barChartView.data.dataSets[0];
        set1.values = yVals;
        [self.barChartView.data notifyDataChanged];
        [self.barChartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[BarChartDataSet alloc] initWithValues:yVals label:@""];
        [set1 setColors:ChartColorTemplates.material];
        set1.drawIconsEnabled = NO;
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont systemFontOfSize:10.f]];
        [data setValueTextColor:UIColor.whiteColor];
        
        data.barWidth = 0.9f;
        
        self.barChartView.data = data;
    }
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
            [self setDataCount:365 range:100];
            break;
        case 1:
            [self.button_week setBackgroundColor:[UIColor grayColor]];
            [self setDataCount:52 range:100];
            break;
        case 2:
            [self.button_month setBackgroundColor:[UIColor grayColor]];
            [self setDataCount:12 range:100];
            break;
        default:
            break;
    }
}

@end
