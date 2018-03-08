//
//  DoraExerciseRecomViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 7/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "DoraExercisePointView.h"
#import "DoraScreenInforHeader.h"
#import "DoraCommonHeader.h"


@interface DoraExerciseRecomViewController : UIViewController
@property(nonatomic, strong) UIImageView *gifplayer;
@property(nonatomic, strong) UIScrollView *exerciselist;
@property(nonatomic, strong) DoraExercisePointView *pointtips;
@end
