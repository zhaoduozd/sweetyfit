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
    self.backgroundColor = AppDefaultBarTintColor;
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(margin, margin, frame.size.width, titleHeight)];
    //[self.title setTextAlignment:NSTextAlignmentCenter];
    [self.title setFont:[UIFont systemFontOfSize:18]];
    [self.title setTextColor:ChartColorLabelText];
    [self addSubview:self.title];
    

    self.pieChartView = [[PieChartView alloc] init];
    self.pieChartView.delegate = self;
    [self setupPieChartView:self.pieChartView];

    [self addSubview:self.pieChartView];
    self.pieChartView.frame =CGRectMake(margin,margin+titleHeight,self.frame.size.width-2*margin,self.frame.size.width-2*margin);
    self.pieChartView.entryLabelFont = [UIFont systemFontOfSize:12.f];

     [self.pieChartView animateWithXAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
    
    self.suggestView = [[UITextView alloc] init];
    self.suggestView.frame = CGRectMake(margin, titleHeight+self.frame.size.width, self.frame.size.width-2*margin,self.frame.size.height-self.frame.size.width-margin-titleHeight);
    self.suggestView.backgroundColor =AppDefaultBarTintColor;
    self.suggestView.text = @"1.\n2\n3\n4\n5\n";
    [self.suggestView setTextColor:ChartColorLabelText];
    self.suggestView.editable = NO;


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
    chartView.holeColor=AppDefaultBarTintColor;
    chartView.backgroundColor=AppDefaultBarTintColor;
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
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:ChartTextSize],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    self.suggestView.attributedText = [[NSAttributedString alloc] initWithString:[DoraPersonalDataModel getInstance].foodSuggestion attributes:attributes];
    [self.suggestView setTextColor:ChartColorLabelText];
    self.pieChartView.data = [[DoraPersonalDataModel getInstance] getFoodData];
}

-(void)updateExercisePieChartData{
    [self.title setText:@"运动建议"];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:ChartTextSize],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    self.suggestView.attributedText = [[NSAttributedString alloc] initWithString:[DoraPersonalDataModel getInstance].exerciseSuggestion attributes:attributes];
    [self.suggestView setTextColor:ChartColorLabelText];
    self.pieChartView.data = [[DoraPersonalDataModel getInstance] getExerciseData];
}


@end

