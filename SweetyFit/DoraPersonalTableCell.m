//
//  DoraPersonalTableCell.m
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/1/20.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraPersonalTableCell.h"
@interface DoraPersonalTableCell ()

@end

@implementation DoraPersonalTableCell

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    float height = frame.size.height;
    float width = frame.size.width;
    
    self.itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, height/2, width, height)];
    self.arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width-10, height/2, height/2, height/2)];

    self.itemLabel.font = [UIFont boldSystemFontOfSize:16.0];
    self.itemLabel.textColor = [UIColor whiteColor];

    [self addSubview:self.itemLabel];
    [self addSubview:self.arrowImageView];
    
    return self;
}

    
@end
