//
//  DoraSigninInfoViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 26/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraSigninInfoViewController.h"
#import "DoraScreenInforHeader.h"
#import "DoraColorDefineHeader.h"
#import "DoraLoginHeader.h"

@interface DoraSigninInfoViewController ()
@property(nonatomic, strong) UIScrollView *wrapper;
@end

@implementation DoraSigninInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _wrapper = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight)];
    [self.view addSubview:_wrapper];
    
    [_wrapper setBackgroundColor:AppDefaultBackgroundColor];
    [_wrapper setContentSize:CGSizeMake(DoraScreenWidth, 1000)];
}

@end
