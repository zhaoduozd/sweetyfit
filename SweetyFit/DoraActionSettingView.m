//
//  DoraActionSettingView.m
//  SweetyFit
//
//  Created by Dora Zhao on 16/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraActionSettingView.h"
#import "DoraScreenInforHeader.h"
#import "UIButton+DoraButtonUI.h"
#import "DoraColorDefineHeader.h"

@implementation DoraActionSettingView{
    NSString *place;
    NSString *time;
    NSString *region;
    UIButton *neck;
    UIButton *shoulder;
    UIButton *arm;
    UIButton *chest;
    UIButton *ventral;
    UIButton *hip;
    UIButton *leg;
    UIButton *back;
    UIButton *all;
    UIButton *homeplace;
    UIButton *officeplace;
    UIButton *gymplace;
    UIButton *outsideplace;
    UIButton *tenminites;
    UIButton *fiftyminites;
    UIButton *twentyminites;
}

- (instancetype) init {
    self = [super init];
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.9]];
    self.frame = CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight);
    
    self.demanddata = [[NSMutableDictionary alloc] init];
    [self.demanddata setObject:@"" forKey:@"place"];
    [self.demanddata setObject:@"" forKey:@"time"];
    [self.demanddata setObject:@"" forKey:@"region"];
    
    [self GenerateBtns];
    self.hidden = YES;
    return self;
}

- (void) GenerateBtns {
    UILabel *q1 = [[UILabel alloc] init];
    UILabel *q2 = [[UILabel alloc] init];
    UILabel *q3 = [[UILabel alloc] init];
    q1.text = @"运动时长:";
    q2.text = @"运动场地:";
    q3.text = @"训练部位:";
    
    q1.textColor = [UIColor whiteColor];
    q2.textColor = [UIColor whiteColor];
    q3.textColor = [UIColor whiteColor];
    
    q1.font = [UIFont boldSystemFontOfSize:16];
    q2.font = [UIFont boldSystemFontOfSize:16];
    q3.font = [UIFont boldSystemFontOfSize:16];

    q1.frame = CGRectMake(20, 20, DoraScreenWidth-40, 40);
    q2.frame = CGRectMake(20, 120, DoraScreenWidth-40, 40);
    q3.frame = CGRectMake(20, 270, DoraScreenWidth-40, 40);
    
    [self addSubview:q1];
    [self addSubview:q2];
    [self addSubview:q3];
    
    tenminites = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"10分钟" X:20 Y:70];
    fiftyminites = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"15分钟" X:130 Y:70];
    twentyminites = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"20分钟" X:240 Y:70];
    
    [tenminites addTarget:self action:@selector(tenbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [fiftyminites addTarget:self action:@selector(fiftybtnevent) forControlEvents:UIControlEventTouchUpInside];
    [twentyminites addTarget:self action:@selector(twentybtnevent) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:tenminites];
    [self addSubview:fiftyminites];
    [self addSubview:twentyminites];
    
    homeplace = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"家" X:20 Y:170];
    officeplace = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"办公室" X:130 Y:170];
    gymplace = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"健身房" X:20 Y:220];
    outsideplace = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"户外" X:130 Y:220];
    
    [homeplace addTarget:self action:@selector(homebtnevent) forControlEvents:UIControlEventTouchUpInside];
    [officeplace addTarget:self action:@selector(officebtnevent) forControlEvents:UIControlEventTouchUpInside];
    [gymplace addTarget:self action:@selector(gymbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [outsideplace addTarget:self action:@selector(outsidebtnevent) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:homeplace];
    [self addSubview:officeplace];
    [self addSubview:gymplace];
    [self addSubview:outsideplace];
    
    neck = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"颈部" X:240 Y:370];
    shoulder = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"肩部" X:20 Y:420];
    arm = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"手臂" X:130 Y:420];
    chest = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"胸部" X:20 Y:320];
    back = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"背部" X:130 Y:320];
    hip = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"臀部" X:240 Y:320];
    ventral = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"腹部" X:20 Y:370];
    leg = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"腿部" X:130 Y:370];
    all = [UIButton DoraCreateOrangeLineButtonWithWidth:100 Height:40 borderRadius:4 Text:@"综合热身" X:240 Y:420];
    


    ventral.frame = CGRectMake(20, 370, 100, 40);
    leg.frame = CGRectMake(130, 370, 100, 40);
    all.frame = CGRectMake(240, 420, 100, 40);
    
    [neck addTarget:self action:@selector(neckbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [shoulder addTarget:self action:@selector(shoulderbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [arm addTarget:self action:@selector(armbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [chest addTarget:self action:@selector(chestbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [ventral addTarget:self action:@selector(ventralbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [hip addTarget:self action:@selector(hipbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [leg addTarget:self action:@selector(legbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [back addTarget:self action:@selector(backbtnevent) forControlEvents:UIControlEventTouchUpInside];
    [all addTarget:self action:@selector(allbtnevent) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:neck];
    [self addSubview:shoulder];
    [self addSubview:arm];
    [self addSubview:chest];
    [self addSubview:back];
    [self addSubview:hip];
    [self addSubview:ventral];
    [self addSubview:leg];
    [self addSubview:all];
    
    self.submitbtn = [UIButton DoraCreateOrangeColorButtonWithWidth:260 Height:40 borderRadius:4 Text:@"确认" X:(DoraScreenWidth-260)/2 Y:500];
    [self addSubview:self.submitbtn];
}

-(void) homebtnevent {
    [self clearplace];
    [homeplace setBackgroundColor:AppDefaultColor];
    [homeplace setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"home" forKey:@"place"];
}

-(void) officebtnevent {
    [self clearplace];
    [officeplace setBackgroundColor:AppDefaultColor];
    [officeplace setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"office" forKey:@"place"];
}

-(void) gymbtnevent {
    [self clearplace];
    [gymplace setBackgroundColor:AppDefaultColor];
    [gymplace setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"gym" forKey:@"place"];
}

-(void) outsidebtnevent {
    [self clearplace];
    [outsideplace setBackgroundColor:AppDefaultColor];
    [outsideplace setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"outside" forKey:@"place"];
}

-(void) neckbtnevent {
    [self clearregion];
    [neck setBackgroundColor:AppDefaultColor];
    [neck setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"neck" forKey:@"region"];
}

-(void) shoulderbtnevent {
    [self clearregion];
    [shoulder setBackgroundColor:AppDefaultColor];
    [shoulder setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"shoulder" forKey:@"region"];
}

-(void) armbtnevent {
    [self clearregion];
    [arm setBackgroundColor:AppDefaultColor];
    [arm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"arm" forKey:@"region"];
}

-(void) chestbtnevent {
    [self clearregion];
    [chest setBackgroundColor:AppDefaultColor];
    [chest setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"chest" forKey:@"region"];
}

-(void) backbtnevent {
    [self clearregion];
    [back setBackgroundColor:AppDefaultColor];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"back" forKey:@"region"];
}

-(void) ventralbtnevent {
    [self clearregion];
    [ventral setBackgroundColor:AppDefaultColor];
    [ventral setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"ventral" forKey:@"region"];
}

-(void) hipbtnevent {
    [self clearregion];
    [hip setBackgroundColor:AppDefaultColor];
    [hip setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"hip" forKey:@"region"];
}

-(void) legbtnevent {
    [self clearregion];
    [leg setBackgroundColor:AppDefaultColor];
    [leg setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"leg" forKey:@"region"];
}

-(void) allbtnevent {
    [self clearregion];
    [all setBackgroundColor:AppDefaultColor];
    [all setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"all" forKey:@"region"];
}

-(void) tenbtnevent {
    [self cleartime];
    [tenminites setBackgroundColor:AppDefaultColor];
    [tenminites setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"10" forKey:@"time"];
}

-(void) fiftybtnevent {
    [self cleartime];
    [fiftyminites setBackgroundColor:AppDefaultColor];
    [fiftyminites setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"15" forKey:@"time"];
}

-(void) twentybtnevent {
    [self cleartime];
    [twentyminites setBackgroundColor:AppDefaultColor];
    [twentyminites setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demanddata setObject:@"20" forKey:@"time"];
}

-(void) clearplace {
    [homeplace setBackgroundColor:[UIColor clearColor]];
    [homeplace setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [officeplace setBackgroundColor:[UIColor clearColor]];
    [officeplace setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [gymplace setBackgroundColor:[UIColor clearColor]];
    [gymplace setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [outsideplace setBackgroundColor:[UIColor clearColor]];
    [outsideplace setTitleColor:AppDefaultColor forState:UIControlStateNormal];
}

- (void) clearregion {
    [neck setBackgroundColor:[UIColor clearColor]];
    [neck setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [shoulder setBackgroundColor:[UIColor clearColor]];
    [shoulder setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [arm setBackgroundColor:[UIColor clearColor]];
    [arm setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [chest setBackgroundColor:[UIColor clearColor]];
    [chest setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [leg setBackgroundColor:[UIColor clearColor]];
    [leg setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [hip setBackgroundColor:[UIColor clearColor]];
    [hip setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [ventral setBackgroundColor:[UIColor clearColor]];
    [ventral setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [back setBackgroundColor:[UIColor clearColor]];
    [back setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [all setBackgroundColor:[UIColor clearColor]];
    [all setTitleColor:AppDefaultColor forState:UIControlStateNormal];
}

- (void) cleartime {
    [tenminites setBackgroundColor:[UIColor clearColor]];
    [tenminites setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [fiftyminites setBackgroundColor:[UIColor clearColor]];
    [fiftyminites setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    [twentyminites setBackgroundColor:[UIColor clearColor]];
    [twentyminites setTitleColor:AppDefaultColor forState:UIControlStateNormal];
}

- (void) clearall {
    [self cleartime];
    [self clearregion];
    [self clearplace];
    [self.demanddata setObject:@"" forKey:@"place"];
    [self.demanddata setObject:@"" forKey:@"region"];
    [self.demanddata setObject:@"" forKey:@"time"];
}

@end
