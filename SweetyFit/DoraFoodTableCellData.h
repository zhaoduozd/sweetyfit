//
//  DoraFoodTableCellData.h
//  SweetyFit
//
//  Created by Dora Zhao on 19/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraCommonHeader.h"

@interface DoraFoodTableCellData : NSObject
@property(nonatomic, strong) NSURL *foodImage;
@property(nonatomic, copy) NSString *foodName;
@property(nonatomic, copy) NSString *foodDetail1;
@property(nonatomic, copy) NSString *foodDetail2;
+(instancetype) createCellData;
@end

