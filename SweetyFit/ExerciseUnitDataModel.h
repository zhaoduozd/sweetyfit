//
//  ExerciseUnitDataModel.h
//  SweetyFit
//
//  Created by Dora Zhao on 17/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExerciseUnitDataModel : NSObject
@property(nonatomic, copy) NSString *exerciseName;
@property(nonatomic, copy) NSString *exerciseCalorie;
@property(nonatomic, copy) NSString *exerciseTime;
@property(nonatomic, copy) NSString *exerciseLevel;

+(instancetype) unitData;
@end
