//
//  DoraExerciseTableCellButtonData.h
//  SweetyFit
//
//  Created by Dora Zhao on 18/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoraExerciseTableCellButtonData : NSObject
@property(nonatomic, strong) UIImage *exerciseImage;
@property(nonatomic, copy) NSString *exerciseName;
@property(nonatomic, copy) NSString *exerciseCalorie;
@property(nonatomic, copy) NSString *exerciseTime;
@property(nonatomic, copy) NSString *exerciseLevel;

+(instancetype) createButtonData;
@end
