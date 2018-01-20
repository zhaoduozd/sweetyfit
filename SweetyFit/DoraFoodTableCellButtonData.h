//
//  DoraFoodTableCellButtonData.h
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/1/20.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#ifndef DoraFoodTableCellButtonData_h
#define DoraFoodTableCellButtonData_h
#import <Foundation/Foundation.h>
#import "DoraCommonHeader.h"
@interface DoraFoodTableCellButtonData : NSObject
@property(nonatomic, copy) NSString *foodName;
@property(nonatomic, copy) NSString *foodCalorie;
@property(nonatomic, copy) NSString *foodDetail;
@property(nonatomic, strong) UIImage *foodImage;
+(instancetype) createButtonData;
@end

#endif /* DoraFoodTableCellButtonData_h */
