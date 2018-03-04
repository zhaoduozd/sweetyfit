//
//  DoraPersonalViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 12/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DoraPersonalViewController.h"
#import "DoraColorDefineHeader.h"

#define ProfileHeight 100
#define SuggestionHeight 280
#define HistoryHeight 300
#define Margin 5

@interface DoraPersonalViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) UIScrollView *containerView;
@end

@implementation DoraPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight-40)];
    self.containerView.contentSize = CGSizeMake(DoraScreenWidth, ProfileHeight+SuggestionHeight+HistoryHeight+2*Margin);
    self.containerView.delegate = self;
    self.containerView.canCancelContentTouches=NO;
    self.containerView.delaysContentTouches=YES;
    
    [self.view addSubview:self.containerView];
    
    self.personalProfile = [[DoraPersonalProfile alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, ProfileHeight)];
    
    [self.containerView addSubview:self.personalProfile];
    
    self.personalSuggestionExercise = [[DoraPersonalSuggestion alloc] initWithFrame:CGRectMake(0,ProfileHeight+Margin,DoraScreenWidth/2-1,SuggestionHeight)];
    
    [self.containerView addSubview:self.personalSuggestionExercise];
    
    self.personalSuggestionFood= [[DoraPersonalSuggestion alloc] initWithFrame:CGRectMake(DoraScreenWidth/2+1,ProfileHeight+Margin,DoraScreenWidth/2-1,SuggestionHeight)];
    [self.containerView addSubview:self.personalSuggestionFood];
    
    self.personalHistory =[[DoraPersonalHistory alloc]initWithFrame:CGRectMake(0,ProfileHeight+2*Margin+SuggestionHeight,DoraScreenWidth,SuggestionHeight)];
    [self.containerView addSubview:self.personalHistory];
    
    self.view.backgroundColor = AppDefaultBackgroundColor;
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
