//
//  DoraFoodRecomViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 8/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraFoodRecomViewController.h"

@interface DoraFoodRecomViewController ()
@property(nonatomic, strong) NSMutableDictionary *fooddata;
@property(nonatomic, strong) NSString *urlroot;
@end

@implementation DoraFoodRecomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _urlroot = @"http://127.0.0.1:3000/";
    
    [self CreateAndAddUIElements];
    [self ObtainData];
}

- (void) CreateAndAddUIElements {
    UILabel *modeltitle = [UILabel DoraCreateTextBoldTitleName:@"推荐de美食"];
    
    _foodContentWrapper = [[UIView alloc] initWithFrame:CGRectMake(-1, 40, DoraScreenWidth + 2, 1080)];
    _foodContentWrapper.backgroundColor = AppDefaultSubViewBackgroundColor;
    _foodContentWrapper.layer.borderColor = AppDefaultBorderColor.CGColor;
    _foodContentWrapper.layer.borderWidth = 1;
    
    [self.view addSubview:_foodContentWrapper];
    [self.view addSubview:modeltitle];
}

- (void) ObtainData {
    __weak DoraFoodRecomViewController *weakself = self;
    
    NSString *urlstring = [_urlroot stringByAppendingString:@"recom/food"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:urlstring parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        
        [weakself SolveData:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];}

- (void) SolveData:(id) responseOject {
    _fooddata = [[NSMutableDictionary alloc] initWithDictionary:(NSDictionary *)responseOject];
    
    NSUInteger foodnum = _fooddata.count;
    NSArray *foodWrapperTitles = @[@"主食", @"肉蛋", @"蔬菜", @"水果", @"油脂类"];
    NSArray *foodtypename = @[@"maindish", @"meat", @"vegetable", @"fruit", @"nuts"];
    
    for (NSUInteger i = 0; i < foodnum; ++i) {
        DoraRecomFoodContentWrapperView *contentView = [[DoraRecomFoodContentWrapperView alloc] init];
        contentView.frame = CGRectMake(0, 5 + i*220, DoraScreenWidth, 220);
        contentView.wrapperTitle.text = foodWrapperTitles[i];
        contentView.foodList.contentSize = CGSizeMake(420, 186);

        NSArray *thetypefoods = [[NSArray alloc] initWithArray:[_fooddata objectForKey:[foodtypename objectAtIndex:i]]];
        
        for (NSUInteger j = 0; j < thetypefoods.count; ++j) {
            NSString *foodname = [[thetypefoods objectAtIndex:j] objectForKey:@"fname"];
            NSString *foodamount = [[thetypefoods objectAtIndex:j] objectForKey:@"recomuse"];
            NSString *foodcalorie = [[thetypefoods objectAtIndex:j] objectForKey:@"calorie"];
            NSString *urlstring = [[thetypefoods objectAtIndex:j] objectForKey:@"img"];
            NSURL *urlimg = [[NSURL alloc] initWithString:urlstring];
            DoraRecomFoodUnitView *foodunitview = [[DoraRecomFoodUnitView alloc] init];
            
            CGRect tempframe = foodunitview.frame;
            tempframe.origin = CGPointMake(5 + j * (130 + 8), 0);
            foodunitview.frame = tempframe;
            [foodunitview.foodImage sd_setImageWithURL:urlimg];
            foodunitview.foodName.text = foodname;
            foodunitview.foodAmount.text = foodamount;
            foodunitview.foodCalorie.text = foodcalorie;
            
            [contentView.foodList addSubview:foodunitview];
       }

        [_foodContentWrapper addSubview:contentView];
    }

}

@end
