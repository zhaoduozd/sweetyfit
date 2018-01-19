//
//  DoraFoodTableSectionData.h
//  SweetyFit
//
//  Created by Dora Zhao on 19/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraFoodTableCellData.h"

@interface DoraFoodTableSectionData : NSObject

@property(nonatomic, copy) NSString *sectionName;
@property(nonatomic, strong) NSMutableArray <DoraFoodTableCellData *> *sectionData;
+(instancetype) createSectionData;
@end
