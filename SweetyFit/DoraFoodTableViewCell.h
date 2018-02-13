//
//  DoraFoodTableViewCell.h
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/1/19.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#ifndef DoraFoodTableViewCell_h
#define DoraFoodTableViewCell_h
#import <UIKit/UIKit.h>
#import "DoraCommonHeader.h"

@interface DoraFoodTableViewCell : UITableViewCell
@property(strong, nonatomic) UIImageView *foodImage;
@property(copy, nonatomic) UILabel *foodName;
@property(copy, nonatomic) UILabel *foodDetail;
@end


#endif /* DoraFoodTableViewCell_h */
