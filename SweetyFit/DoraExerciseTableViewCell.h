//
//  DoraExerciseTableViewCell.h
//  SweetyFit
//
//  Created by Dora Zhao on 18/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraCommonHeader.h"
#import "DoraExericiseTableViewCellButton.h"
#import "DoraExerciseButtonWrapper.h"

@interface DoraExerciseTableViewCell : UITableViewCell
@property(strong, nonatomic) DoraExerciseButtonWrapper *leftExercise;
@property(strong, nonatomic) DoraExerciseButtonWrapper *rightExercise;
@end
