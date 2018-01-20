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
#import "DoraFoodTableViewCellButton.h"
#import "DoraCommonHeader.h"

@interface DoraFoodTableViewCell : UITableViewCell
@property(strong, nonatomic) DoraFoodTableViewCellButton *leftFood;
@property(strong, nonatomic) DoraFoodTableViewCellButton *rightFood;
@end


#endif /* DoraFoodTableViewCell_h */
