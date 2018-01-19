//
//  DoraExerciseTableCellData.h
//  SweetyFit
//
//  Created by Dora Zhao on 18/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraExerciseTableCellButtonData.h"

@interface DoraExerciseTableCellData : NSObject
@property(nonatomic, strong) DoraExerciseTableCellButtonData *leftButton;
@property(nonatomic, strong) DoraExerciseTableCellButtonData *rightButton;

+(instancetype) createCellData;
@end
