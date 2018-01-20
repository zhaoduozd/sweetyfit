//
//  DoraFoodTableViewCellButton.h
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/1/19.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#ifndef DoraFoodTableViewCellButton_h
#define DoraFoodTableViewCellButton_h

#import <UIKit/UIKit.h>
#import "DoraCommonHeader.h"

@interface DoraFoodTableViewCellButton : UIButton
@property(nonatomic, strong) UIImage *foodImage;
@property(nonatomic, strong) UILabel *foodName;
@property(nonatomic, strong) UILabel *foodCalorie;
@property(nonatomic, strong) UILabel *foodDetail;
@property(nonatomic, strong) UILabel *foodLevel;
@end

#endif /* DoraFoodTableViewCellButton_h */
