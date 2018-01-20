//
//  DoraPersonalTableCell.h
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/1/20.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#ifndef DoraPersonalTableCell_h
#define DoraPersonalTableCell_h
#import <UIKit/UIKit.h>
#import "DoraCommonHeader.h"

@interface DoraPersonalTableCell : UIButton
@property(nonatomic, strong) UIImageView *arrowImageView;
@property(nonatomic, strong) UILabel *itemLabel;
-(instancetype)initWithFrame:(CGRect)frame;
@end

#endif /* DoraPersonalTableCell_h */
