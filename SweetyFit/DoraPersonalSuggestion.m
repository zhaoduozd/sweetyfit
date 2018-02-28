//
//  DoraPersonalSuggestion.m
//  SweetyFit
//
//  Created by Zhongqi SHI on 2018/2/26.
//  Copyright © 2018年 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoraPersonalSuggestion.h"
#import "DoraColorDefineHeader.h"
#define margin 5

@implementation DoraPersonalSuggestion

-(id)init{
    return [super init];
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = AppDefaultBarTintColor;
    self.placeHolder = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"placeholder2"]];
    self.placeHolder.frame = CGRectMake(margin,margin,self.frame.size.width-2*margin,self.frame.size.width-2*margin);
    [self addSubview:self.placeHolder];
    
    self.suggestView = [[UITextView alloc] init];
    self.suggestView.frame = CGRectMake(margin, self.frame.size.width, self.frame.size.width-2*margin,self.frame.size.height-self.frame.size.width-margin);
    self.suggestView.backgroundColor =AppDefaultBarTintColor;
    self.suggestView.textColor = textColorWhite;
    self.suggestView.text = @"1.\n2\n3\n4\n5\n";
    
    [self addSubview: self.suggestView];
    
    return self;
}

@end

