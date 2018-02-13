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
    
    _foodImage = [[UIImageView alloc] init];
    _foodName = [[UILabel alloc] init];
    _foodDetail = [[UILabel alloc] init];
    
    _foodImage.frame = CGRectMake(10, 10, 70, 70);
    _foodName.frame = CGRectMake(90, 10, DoraScreenWidth - 100, 30);
    _foodDetail.frame = CGRectMake(90, 40, DoraScreenWidth - 100, 30);
    
    _foodDetail.textColor = [UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:.7];
    _foodDetail.font = [UIFont systemFontOfSize:13];
    
    UIView *seperateLine = [UIView DoraCreateSeperateLineWithWidth:DoraScreenWidth Height:1 PositionX:0 PositionY:79];
    
    [self addSubview:_foodImage];
    [self addSubview:_foodName];
    [self addSubview:_foodDetail];
    [self addSubview:seperateLine];
    
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
