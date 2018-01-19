//
//  DoraExerciseTableViewCell.h
//  SweetyFit
//
//  Created by Dora Zhao on 18/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraExericiseTableViewCellButton.h"

@interface DoraExerciseTableViewCell : UITableViewCell
@property(strong, nonatomic) DoraExericiseTableViewCellButton *leftExercise;
@property(strong, nonatomic) DoraExericiseTableViewCellButton *rightExercise;
@end
