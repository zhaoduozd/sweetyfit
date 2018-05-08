//
//  DoraAccountViews.h
//  SweetyFit
//
//  Created by Dora Zhao on 7/5/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoraAccountViews : UIView
@property(nonatomic, strong) UILabel *pagetitle;
@property(nonatomic, strong) UILabel *notice;

-(void) setPageTitle:(NSString *) pagetitleText;
-(void) setSigninNotice:(NSString *) noticeText;
@end
