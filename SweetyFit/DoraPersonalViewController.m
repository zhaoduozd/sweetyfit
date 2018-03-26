//
//  DoraPersonalViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 12/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DoraPersonalViewController.h"
#import "DoraColorDefineHeader.h"
#import "DoraLoginViewController.h"

#define signOutHeight 50
#define ProfileHeight 100
#define SuggestionHeight 500
#define HistoryHeight 330
#define Margin 5
#define segmentColor [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.8]

@interface DoraPersonalViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) UIScrollView *containerView;
@end

@implementation DoraPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight-40)];
    self.containerView.contentSize = CGSizeMake(DoraScreenWidth, ProfileHeight+2*SuggestionHeight+HistoryHeight+5*Margin+signOutHeight+30);
    self.containerView.delegate = self;
    self.containerView.canCancelContentTouches=NO;
    self.containerView.delaysContentTouches=YES;
    [self.view addSubview:self.containerView];
    
    self.personalProfile = [[DoraPersonalProfile alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, ProfileHeight)];
    
    [self.containerView addSubview:self.personalProfile];
    
    UIView *segmentLine0 = [[UIView alloc] initWithFrame:CGRectMake(DoraScreenWidth*0.05,ProfileHeight+0.5*Margin,DoraScreenWidth*0.9,1)];
    segmentLine0.backgroundColor = segmentColor;
    [self.containerView addSubview:segmentLine0];
    
    self.personalSuggestionExercise = [[DoraPersonalSuggestion alloc] initWithFrame:CGRectMake(0,ProfileHeight+Margin,DoraScreenWidth,SuggestionHeight)];
    [DoraPersonalDataModel getInstance].exerciseDelegate = self.personalSuggestionExercise;
    [self.containerView addSubview:self.personalSuggestionExercise];
    
    UIView *segmentLine1 = [[UIView alloc] initWithFrame:CGRectMake(DoraScreenWidth*0.05,ProfileHeight+1.5*Margin+SuggestionHeight,DoraScreenWidth*0.9,1)];
    segmentLine1.backgroundColor = segmentColor;
    [self.containerView addSubview:segmentLine1];
    
    self.personalSuggestionFood= [[DoraPersonalSuggestion alloc] initWithFrame:CGRectMake(0,ProfileHeight+2* Margin+SuggestionHeight,DoraScreenWidth,SuggestionHeight)];
    [DoraPersonalDataModel getInstance].foodDelegate = self.personalSuggestionFood;
    [self.containerView addSubview:self.personalSuggestionFood];
    
    UIView *segmentLine2 = [[UIView alloc] initWithFrame:CGRectMake(DoraScreenWidth*0.05,ProfileHeight+2.5*Margin+SuggestionHeight*2,DoraScreenWidth*0.9,1)];
    segmentLine2.backgroundColor = segmentColor;
    [self.containerView addSubview:segmentLine2];
    
    self.personalHistory =[[DoraPersonalHistory alloc]initWithFrame:CGRectMake(0,ProfileHeight+3*Margin+2*SuggestionHeight,DoraScreenWidth,HistoryHeight)];
    [DoraPersonalDataModel getInstance].historyDelegate = self.personalHistory;
    [self.containerView addSubview:self.personalHistory];
    
    self.personalSignOut = [[UIButton alloc]initWithFrame:CGRectMake(Margin,ProfileHeight+4*Margin+SuggestionHeight*2+HistoryHeight,DoraScreenWidth-2*Margin,signOutHeight)];
    
    [self.personalSignOut addTarget:self action:@selector(signOutClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.personalSignOut setTitle:@"退出登录" forState:UIControlStateNormal];
    [self.personalSignOut setBackgroundColor:AppDefaultColor];
    [self.containerView addSubview:self.personalSignOut];
    
    self.view.backgroundColor = AppDefaultBarTintColor;
    
    // self.navigationController.navigationBarHidden = YES;


    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)signOutClick:(id)sender{
    //这个sender其实就是UIButton，因此通过sender.tag就可以拿到刚才的参数
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"uid"];
    
    [self presentViewController:[[DoraLoginViewController alloc] init]  animated:YES completion:^ (void){}];
    
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
