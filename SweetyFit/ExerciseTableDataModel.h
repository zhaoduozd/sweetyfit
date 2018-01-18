//
//  ExerciseTableDataModel.h
//  SweetyFit
//
//  Created by Dora Zhao on 17/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExerciseTableDataModel : NSObject
@property(nonatomic, copy) NSString *exerciseBodyRegion;
@property(nonatomic, strong) NSMutableArray *exerciseBodyRegionData;

+(instancetype) section;
@end
