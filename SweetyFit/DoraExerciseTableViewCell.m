//
//  DoraExerciseTableViewCell.m
//  SweetyFit
//
//  Created by Dora Zhao on 18/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseTableViewCell.h"

@implementation DoraExerciseTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    float btnW = (DoraScreenWidth - 45) / 2 *0.6;
    float btnH = btnW * 0.6;
    
    CGRect tempframe = self.frame;
    tempframe.size = CGSizeMake(DoraScreenWidth, btnH + 10);
    self.frame = tempframe;
    
//    _leftExercise = [UIButton DoraCreateBlackMaskBigButtonWithWidth:btnW Height:btnH borderRaduis:4 titleText:@"" detailTextTime:@"" detailTextCalorie:@"" imageBackground:[UIImage imageNamed:@"placeholde.jpg"]];
//    _leftExercise.frame = CGRectMake(15, 5, btnW, btnH);
//
//    _rightExercise = [UIButton DoraCreateBlackMaskBigButtonWithWidth:btnW Height:btnH borderRaduis:4 titleText:@"" detailTextTime:@"" detailTextCalorie:@"" imageBackground:[UIImage imageNamed:@"placeholde.jpg"]];
//    _rightExercise.frame = CGRectMake(25 + btnW, 5, btnW, btnH);
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
