//
//  DoraFoodTableCellData.h
//  SweetyFit
//
//  Created by Dora Zhao on 19/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoraFoodTableCellData : NSObject
@property(nonatomic, copy) NSString *foodName;
@property(nonatomic, copy) NSString *foodCalorie;
@property(nonatomic, copy) NSString *foodDetail;
@property(nonatomic, strong) UIImage *foodImage;
+(instancetype) createFoodCellData;
@end
