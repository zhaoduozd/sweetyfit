//
//  DoraPersonalSuggestion.m
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/2/26.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraPersonalSuggestion.h"
#import "DoraColorDefineHeader.h"
#define margin 5
#define titleHeight 30
@implementation DoraPersonalSuggestion

-(id)init{
    return [super init];
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = AppDefaultBackgroundColor;
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(margin, margin, frame.size.width, titleHeight)];
    //[self.title setTextAlignment:NSTextAlignmentCenter];
    [self.title setFont:[UIFont boldSystemFontOfSize:18]];
    [self addSubview:self.title];
    
    self.parties = @[
                @"Party A", @"Party B", @"Party C", @"Party D", @"Party E", @"Party F",
                @"Party G", @"Party H", @"Party I", @"Party J", @"Party K", @"Party L",
                @"Party M", @"Party N", @"Party O", @"Party P", @"Party Q", @"Party R",
                @"Party S", @"Party T", @"Party U", @"Party V", @"Party W", @"Party X",
                @"Party Y", @"Party Z"
                ];
    
    self.pieChartView = [[PieChartView alloc] init];
    self.pieChartView.delegate = self;
    [self setupPieChartView:self.pieChartView];

    [self addSubview:self.pieChartView];
    self.pieChartView.frame =CGRectMake(margin,margin+titleHeight,self.frame.size.width-2*margin,self.frame.size.width-2*margin);
    self.pieChartView.entryLabelFont = [UIFont systemFontOfSize:12.f];

    [self updateChartData];
     [self.pieChartView animateWithXAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
    
    self.suggestView = [[UITextView alloc] init];
    self.suggestView.frame = CGRectMake(margin, titleHeight+self.frame.size.width, self.frame.size.width-2*margin,self.frame.size.height-self.frame.size.width-margin-titleHeight);
    self.suggestView.backgroundColor =AppDefaultBackgroundColor;
    self.suggestView.text = @"1.\n2\n3\n4\n5\n";
    
    [self addSubview: self.suggestView];

    return self;
}

- (void)updateChartData
{
    [self setDataCount:4 range:100.00f];
}


- (void)setDataCount:(int)count range:(double)range
{
    double mult = range;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        [values addObject:[[PieChartDataEntry alloc] initWithValue:(arc4random_uniform(mult) + mult / 5) label:self.parties[i % self.parties.count] icon: [UIImage imageNamed:@"icon"]]];
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
    
    self.pieChartView.data = data;
    [self.pieChartView highlightValues:nil];
}

- (void)setupPieChartView:(PieChartView *)chartView
{
    chartView.usePercentValuesEnabled = YES;
    chartView.drawSlicesUnderHoleEnabled = NO;
    chartView.holeRadiusPercent = 0.35;
    chartView.transparentCircleRadiusPercent = 1;
    chartView.chartDescription.enabled = NO;
    [chartView setExtraOffsetsWithLeft:1.f top:1.f right:1.f bottom:1.f];
    
    chartView.drawCenterTextEnabled = NO;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    ChartLegend *l = self.pieChartView.legend;
    l.enabled = NO;
    
    chartView.drawHoleEnabled = YES;
    chartView.holeColor=AppDefaultBackgroundColor;
    chartView.backgroundColor=AppDefaultBackgroundColor;
    chartView.rotationAngle = 0.0;
    chartView.rotationEnabled = YES;
    chartView.highlightPerTapEnabled = YES;
}

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}

@end

