//
//  DoraFoodTableViewCell.m
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/1/19.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraFoodTableViewCell.h"

@implementation DoraFoodTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    float btnW = (DoraScreenWidth - 45) / 2;
    float btnH = btnW * 0.6;
    
    _leftFood = [[DoraFoodTableViewCellButton alloc] initWithFrame:CGRectMake(15, 5, btnW, btnH)];
    _rightFood = [[DoraFoodTableViewCellButton alloc] initWithFrame:CGRectMake(25 + btnW, 5, btnW, btnH)];
    
    [self.contentView addSubview:_leftFood];
    [self.contentView addSubview:_rightFood];
    
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
