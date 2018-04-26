//
//  DoraFoodRecomViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 8/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraFoodRecomViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface DoraFoodRecomViewController ()
//@property(nonatomic, strong) NSString *urlroot;
@end

@implementation DoraFoodRecomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //_urlroot = @"http://127.0.0.1:3000/";
    
    [self CreateAndAddUIElements];
    [self ObtainData];
}

- (void) CreateAndAddUIElements {
    UILabel *modeltitle = [UILabel DoraCreateTextBoldTitleName:@"饮食搭配"];
    [modeltitle setBackgroundColor:AppDefaultSubViewBackgroundColor];
    modeltitle.frame = CGRectMake(10, 10, DoraScreenWidth, 40);
    
    UIView *titlewapper = [[UIView alloc] initWithFrame:CGRectMake(0, 10, DoraScreenWidth, 40)];
    [titlewapper setBackgroundColor:AppDefaultSubViewBackgroundColor];
    
    _foodContentWrapper = [[UIView alloc] initWithFrame:CGRectMake(-1, 50, DoraScreenWidth + 2, 710)];
    _foodContentWrapper.backgroundColor = AppDefaultSubViewBackgroundColor;
    _foodContentWrapper.layer.borderColor = AppDefaultBorderColor.CGColor;
    _foodContentWrapper.layer.borderWidth = 1;
    
    
    [self.view addSubview:titlewapper];
    [self.view addSubview:_foodContentWrapper];
    [self.view addSubview:modeltitle];
}

- (void) ObtainData {
    __weak DoraFoodRecomViewController *weakself = self;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uid = [defaults objectForKey:@"uid"];
    NSString *urlstring = [[serverurl stringByAppendingString:@"/recom/food?uid="] stringByAppendingString:uid];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlstring parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
    
        [weakself SolveData:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
}];}

- (void) SolveData:(id) responseOject {
    float y = 0;
    UIImageView *dishimg = [[UIImageView alloc] init];
    NSDictionary *data = (NSDictionary *)responseOject;
    NSString *imgpath = [@"http://120.79.24.237:3001/dish?name=" stringByAppendingString:[data objectForKey:@"id"]];
    [dishimg sd_setImageWithURL:[[NSURL alloc] initWithString:imgpath]];
    dishimg.frame = CGRectMake(0, 0, DoraScreenWidth, DoraScreenWidth*0.75);
    
    y += DoraScreenWidth*0.75;
    
    UIView *dishintro = [[UIView alloc] initWithFrame:CGRectMake(0, y, DoraScreenWidth, 80)];
    UILabel *dishname = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, 40)];
    UILabel *cal = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, DoraScreenWidth/4, 40)];
    UILabel *protein = [[UILabel alloc] initWithFrame:CGRectMake(DoraScreenWidth/4, 40, DoraScreenWidth/4, 40)];
    UILabel *carbo = [[UILabel alloc] initWithFrame:CGRectMake(DoraScreenWidth/2, 40, DoraScreenWidth/4, 40)];
    UILabel *fat = [[UILabel alloc] initWithFrame:CGRectMake(DoraScreenWidth*0.75, 40, DoraScreenWidth/4, 40)];
    UIView *seper1 = [UIView DoraCreateSeperateLineWithWidth:DoraScreenWidth-30 Height:1 PositionX:15 PositionY:79];
    
    dishname.text = [data objectForKey:@"name"];
    cal.text = [@"能量:" stringByAppendingString:[data objectForKey:@"cal"]];
    protein.text =  [@"蛋白质:" stringByAppendingString:[data objectForKey:@"protein"]];
    carbo.text =  [@"碳水:" stringByAppendingString:[data objectForKey:@"car"]];
    fat.text =  [@"脂肪:" stringByAppendingString:[data objectForKey:@"fat"]];
    
    cal.font = [UIFont systemFontOfSize:14];
    protein.font = [UIFont systemFontOfSize:14];
    carbo.font = [UIFont systemFontOfSize:14];
    fat.font = [UIFont systemFontOfSize:14];
    
    cal.textColor = AppDefaultFontColor;
    protein.textColor = AppDefaultFontColor;
    carbo.textColor = AppDefaultFontColor;
    fat.textColor = AppDefaultFontColor;
    
    dishname.textAlignment = NSTextAlignmentCenter;
    cal.textAlignment = NSTextAlignmentCenter;
    protein.textAlignment = NSTextAlignmentCenter;
    carbo.textAlignment = NSTextAlignmentCenter;
    fat.textAlignment = NSTextAlignmentCenter;

    dishname.font = [UIFont boldSystemFontOfSize:18];
    
    [dishintro addSubview:dishname];
    [dishintro addSubview:cal];
    [dishintro addSubview:protein];
    [dishintro addSubview:carbo];
    [dishintro addSubview:fat];
    [dishintro addSubview:seper1];
    
    y += 85;
    
    NSUInteger rawnum = [[data objectForKey:@"raw"] count];
    NSArray *rawfoods = [[NSArray alloc] initWithArray:[data objectForKey:@"raw"]];
    UIView *dishrawfood = [[UIView alloc] initWithFrame: CGRectMake(0, y, DoraScreenWidth, rawnum*30 + 55)];
    UILabel *rawtitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, 50)];
    rawtitle.textAlignment = NSTextAlignmentCenter;
    rawtitle.text = @"食材及用量";
    rawtitle.font = [UIFont boldSystemFontOfSize:18];
    
    for (NSUInteger i = 0; i < rawnum; ++i) {
        UILabel *foodname = [[UILabel alloc] initWithFrame:CGRectMake(0, i*30 + 50, DoraScreenWidth/2, 30)];
        UILabel *foodamount = [[UILabel alloc] initWithFrame:CGRectMake(DoraScreenWidth/2, 50+i*30, DoraScreenWidth/2, 30)];
        foodname.font = [UIFont systemFontOfSize:15];
        foodname.textAlignment = NSTextAlignmentRight;
        foodamount.font = [UIFont systemFontOfSize:15];
        NSDictionary *rawfood = [rawfoods objectAtIndex:i];
        foodname.text = [[rawfood objectForKey:@"foodname"] stringByAppendingString:@"  : "];
        foodamount.text = [@"  " stringByAppendingString:[rawfood objectForKey:@"foodamount"]];
        [dishrawfood addSubview:foodname];
        [dishrawfood addSubview:foodamount];
    }
    
    UIView *seper2 = [UIView DoraCreateSeperateLineWithWidth:DoraScreenWidth-30 Height:1 PositionX:15 PositionY:rawnum*30+54];
    
    [dishrawfood addSubview:rawtitle];
    [dishrawfood addSubview:seper2];
    
    y += rawnum * 30 + 60;
    
    UIView *steps = [[UIView alloc] initWithFrame:CGRectMake(0, y, DoraScreenWidth, 100)];
    UILabel *steptitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, 50)];
    steptitle.textAlignment = NSTextAlignmentCenter;
    steptitle.text = @"制作步骤";
    steptitle.font = [UIFont boldSystemFontOfSize:18];
    y += 50;
    
    NSArray *stepsdata = [[data objectForKey:@"steps"] objectForKey:@"steps"];
    NSUInteger stepnum = [stepsdata count];
    UIView *stepstext = [[UIView alloc] initWithFrame:CGRectMake(15, 50, DoraScreenWidth-30, stepnum*30)];
    
    for (NSUInteger i = 0; i < stepnum; ++i) {
        UILabel *step = [[UILabel alloc] initWithFrame:CGRectMake(0, i*30, DoraScreenWidth-30, 30)];
        step.text = [stepsdata objectAtIndex:i];
        step.font = [UIFont systemFontOfSize:15];
        [stepstext addSubview:step];
    }
    
    
    y += 30 * stepnum + 5;

    [steps addSubview:steptitle];
    [steps addSubview:stepstext];

    //NSLog(@"set foodview");
    _foodContentWrapper.frame = CGRectMake(-1, 50, DoraScreenWidth + 2, y);
    [self.foodContentWrapper addSubview:dishimg];
    [self.foodContentWrapper addSubview:dishintro];
    [self.foodContentWrapper addSubview:dishrawfood];
    [self.foodContentWrapper addSubview:steps];
}

- (NSString *) SetTips:(NSString *) tips {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:tips];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 15;
    NSRange range = NSMakeRange(0, [tips length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    
    return tips;
}

@end
