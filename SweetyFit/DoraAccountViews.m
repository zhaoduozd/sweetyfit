//
//  DoraAccountViews.m
//  SweetyFit
//
//  Created by Dora Zhao on 7/5/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraAccountViews.h"
#import "DoraCommonHeader.h"

@implementation DoraAccountViews

-(instancetype) init {
    self = [super init];
    self.frame = CGRectMake(DoraScreenWidth*0.05, 0, DoraScreenWidth*0.9, DoraScreenHeight);
    
    self.pagetitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, DoraScreenWidth-30, 70)];
    self.pagetitle.font = [UIFont boldSystemFontOfSize:28];
    
    self.notice = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, self.frame.size.width, 30)];
    self.notice.textAlignment = NSTextAlignmentCenter;
    self.notice.textColor = [UIColor redColor];
    self.notice.text = @"";
    self.notice.hidden = NO;
    
    [self addSubview:_pagetitle];
    [self addSubview:_notice];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap.cancelsTouchesInView = NO;
    [self addGestureRecognizer:tap];
    
    return self;
}

-(void)viewTapped:(UITapGestureRecognizer*)tap {
    [self endEditing:YES];
}

-(void) setPageTitle:(NSString *)pagetitleText {
    self.pagetitle.text = pagetitleText;
}

-(void) setSigninNotice:(NSString *)noticeText {
    self.notice.text = noticeText;
    self.notice.hidden = NO;
}

@end
