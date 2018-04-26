//
//  DoraActionListSubView.m
//  SweetyFit
//
//  Created by Dora Zhao on 25/4/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraActionListSubView.h"

@implementation DoraActionListSubView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    CGRect viewframe = CGRectMake(0, 0, 80, 60);
    _imageview = [[UIImageView alloc] initWithFrame:viewframe];
    _btn = [[UIButton alloc] initWithFrame:viewframe];
    _btntitle = [[UILabel alloc] initWithFrame:viewframe];

    
    [_imageview.layer setCornerRadius:3];
    
    
    _btntitle.textColor = [UIColor whiteColor];
    _btntitle.textAlignment = NSTextAlignmentCenter;
    _btntitle.font = [UIFont boldSystemFontOfSize:13];
    
    [_btn.layer setCornerRadius:3];
    [_btn addSubview:_btntitle];
    [_btn setBackgroundColor:[UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:0.5]];
    
    [self addSubview:_imageview];
    [self addSubview:_btn];
    [self addSubview:_btntitle];
    return self;
}

@end
