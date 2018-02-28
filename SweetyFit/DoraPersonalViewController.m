//
//  DoraPersonalViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 12/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DoraPersonalViewController.h"

@interface DoraPersonalViewController ()
@property(nonatomic,strong) UIScrollView *containerView;
@end

@implementation DoraPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight)];
    [self.view addSubview:self.containerView];
    
    self.personalProfile = [[DoraPersonalProfile alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, 100)];
    
    [self.containerView addSubview:self.personalProfile];
    
    self.personalSuggestionExercise = [[DoraPersonalSuggestion alloc] initWithFrame:CGRectMake(0,100+5,DoraScreenWidth/2-1,300)];
    
    [self.containerView addSubview:self.personalSuggestionExercise];
    
    self.personalSuggestionFood= [[DoraPersonalSuggestion alloc] initWithFrame:CGRectMake(DoraScreenWidth/2+1,100+5,DoraScreenWidth/2-1,300)];
    [self.containerView addSubview:self.personalSuggestionFood];
    
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
