//
//  DoraRootNavigationViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 9/12/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//
#import "DoraCommonHeader.h"
#import "DoraRootNavigationViewController.h"
#import "DoraRecomViewController.h"
#import "DoraExerciseViewController.h"
#import "DoraFoodViewController.h"
#import "DoraPersonalViewController.h"

@interface DoraRootNavigationViewController ()

@property(nonatomic, strong) NSArray *Titles;
@property(nonatomic, strong) NSArray *Icons;
@property(nonatomic, strong) NSArray *ClassNames;

@end

@implementation DoraRootNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Titles = @[@"推荐", @"运动", @"食物", @"我"];
    self.Icons = @[@"recom", @"exercise", @"food", @"personal"];
    self.ClassNames = @[@"DoraRecomViewController", @"DoraExerciseViewController", @"DoraFoodViewController", @"DoraPersonalViewController"];

    [self addChildrenVC];
    self.tabBar.tintColor = AppDefaultColor;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

-(void)addChildrenVC {
    for (int i = 0; i<_Titles.count; i++) {
        Class class = NSClassFromString(_ClassNames[i]);
        UIViewController *vc = [[class alloc] init];
        
        vc.title = _Titles[i];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
        nav.tabBarItem.title = _Titles[i];
        nav.tabBarItem.image = [UIImage imageNamed:_Icons[i]];
        
        // 导航栏背景色
        [nav.navigationBar setBarTintColor: AppDefaultBarTintColor];
        [nav.navigationBar setTranslucent:NO];
        [nav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
        
        [self addChildViewController:nav];
    }
}

@end
