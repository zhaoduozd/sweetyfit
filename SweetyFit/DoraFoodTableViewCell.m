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
    _foodDetail1 = [[UILabel alloc] init];
    _foodDetail2 = [[UILabel alloc] init];
    
    _foodImage.frame = CGRectMake(10, 10, 70, 70);
    _foodName.frame = CGRectMake(90, 10, DoraScreenWidth - 100, 30);
    _foodDetail1.frame = CGRectMake(90, 40, (DoraScreenWidth - 100)/2, 90);
    _foodDetail2.frame = CGRectMake(100 + (DoraScreenWidth - 100)/2, 40, (DoraScreenWidth - 100)/2, 100);
    
    _foodDetail1.textColor = [UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:.7];
    _foodDetail1.numberOfLines = 3;
    _foodDetail1.font = [UIFont systemFontOfSize:13];
    
    _foodDetail2.textColor = [UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:.7];
    _foodDetail2.numberOfLines = 3;
    _foodDetail2.font = [UIFont systemFontOfSize:13];
    

    
    UIView *seperateLine = [UIView DoraCreateSeperateLineWithWidth:DoraScreenWidth-20 Height:1 PositionX:10 PositionY:129];
    
    [self addSubview:_foodImage];
    [self addSubview:_foodName];
    [self addSubview:_foodDetail1];
    [self addSubview:_foodDetail2];
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
