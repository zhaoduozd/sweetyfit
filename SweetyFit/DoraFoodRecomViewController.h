//
//  DoraFoodRecomViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 8/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UILabel+TextUI.h"
#import "DoraColorDefineHeader.h"
#import "DoraRecomFoodUnitView.h"
#import "DoraRecomFoodContentWrapperView.h"


@interface DoraFoodRecomViewController : UIViewController
@property(nonatomic, strong) UIView *foodContentWrapper;
@property(nonatomic, strong) UILabel *mealName;
@property(nonatomic, strong) UIImageView *dishimg;

@end
