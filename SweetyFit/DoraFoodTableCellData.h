//
//  DoraFoodTableCellData.h
//  SweetyFit
//
//  Created by Dora Zhao on 19/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraFoodTableCellButtonData.h"
#import "DoraCommonHeader.h"

@interface DoraFoodTableCellData : NSObject
@property(nonatomic, strong) DoraFoodTableCellButtonData *leftButton;
@property(nonatomic, strong) DoraFoodTableCellButtonData *rightButton;

+(instancetype) createCellData;
@end

