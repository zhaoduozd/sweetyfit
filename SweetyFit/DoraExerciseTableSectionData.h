//
//  DoraExerciseTableSectionData.h
//  SweetyFit
//
//  Created by Dora Zhao on 18/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraExerciseTableCellData.h"

@interface DoraExerciseTableSectionData : NSObject
@property(nonatomic, copy) NSString *sectionName;
@property(nonatomic, strong) NSMutableArray <DoraExerciseTableCellData *> *sectionData;

+(instancetype) createSectionData;
@end
