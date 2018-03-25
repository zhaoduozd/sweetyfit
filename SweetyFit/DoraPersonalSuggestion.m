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
#import "DoraPersonalDataModel.h"
#define margin 5
#define titleHeight 30

@interface DoraPersonalSuggestion()<ChartViewDelegate,DoraPersonalDataObserver>

@end
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

     [self.pieChartView animateWithXAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
    
    self.suggestView = [[UITextView alloc] init];
    self.suggestView.frame = CGRectMake(margin, titleHeight+self.frame.size.width, self.frame.size.width-2*margin,self.frame.size.height-self.frame.size.width-margin-titleHeight);
    self.suggestView.backgroundColor =AppDefaultBackgroundColor;
    self.suggestView.text = @"1.\n2\n3\n4\n5\n";
    
    [self addSubview: self.suggestView];

    return self;
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
    l.horizontalAlignment = ChartLegendHorizontalAlignmentRight;
    l.verticalAlignment = ChartLegendVerticalAlignmentTop;
    l.orientation = ChartLegendOrientationVertical;
    l.drawInside = NO;
    l.xEntrySpace = 14.0;
    [l setFont:[UIFont systemFontOfSize:ChartTextSize]];
    l.yEntrySpace = 0.0;
    l.yOffset = 0.0;
    [l setTextColor:ChartColorLabelText];
    //l.enabled = NO;
    
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

-(void)updateFoodPieChartData{
    [self.title setText:@"饮食建议"];
    [self.suggestView setText:[DoraPersonalDataModel getInstance].foodSuggestion];
    [self.suggestView setFont:[UIFont systemFontOfSize:16]];
    self.pieChartView.data = [[DoraPersonalDataModel getInstance] getFoodData];
}

-(void)updateExercisePieChartData{
    [self.title setText:@"运动建议"];
    [self.suggestView setText:[DoraPersonalDataModel getInstance].exerciseSuggestion];
    [self.suggestView setFont:[UIFont systemFontOfSize:16]];
    self.pieChartView.data = [[DoraPersonalDataModel getInstance] getExerciseData];
}

@end

