//
//  DoraFoodRecomViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 8/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraFoodRecomViewController.h"

@interface DoraFoodRecomViewController ()
@property(nonatomic, strong) NSString *urlroot;
@end

@implementation DoraFoodRecomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _urlroot = @"http://120.77.42.160:3000/";
    
    [self CreateAndAddUIElements];
    [self ObtainData];
}

- (void) CreateAndAddUIElements {
    UILabel *modeltitle = [UILabel DoraCreateTextBoldTitleName:@"推荐de美食"];
    
    _foodContentWrapper = [[UIView alloc] initWithFrame:CGRectMake(-1, 40, DoraScreenWidth + 2, 1310)];
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
    NSArray *foodWrapperTitles = @[@"主食类", @"肉类", @"蔬菜类", @"水果类", @"坚果类", @"饮品类"];
    NSArray *foodtypename = @[@"mainfood", @"meatfish", @"vegetable", @"fruit", @"fat", @"drink"];
    
    NSArray *rawdata = [[NSArray alloc] initWithArray:(NSArray *)responseOject];
    NSMutableDictionary *fooddata = [[NSMutableDictionary alloc] init];
    
    for (NSUInteger i = 0; i < rawdata.count; ++i) {
        NSDictionary *temp = [[NSDictionary alloc] initWithDictionary:[rawdata objectAtIndex:i]];
        [fooddata setObject:[temp objectForKey:@"foods"] forKey:[temp objectForKey:@"typename"]];
    }
    
    NSUInteger i = 0;
    
    for (; i < foodtypename.count; ++i) {
        NSArray *foodlist = [[NSArray alloc] initWithArray:[fooddata objectForKey:[foodtypename objectAtIndex:i]]];
        
        DoraRecomFoodContentWrapperView *contentView = [[DoraRecomFoodContentWrapperView alloc] init];
        contentView.frame = CGRectMake(0, 5 + i*220, DoraScreenWidth, 220);
        contentView.wrapperTitle.text = foodWrapperTitles[i];
        contentView.foodList.contentSize = CGSizeMake(420, 186);

        for (NSUInteger j = 0; j < foodlist.count; ++j) {
            NSString *foodname = [[foodlist objectAtIndex:j] objectForKey:@"name"];
            // NSString *foodamount = [[foodlist objectAtIndex:j] objectForKey:@"recomuse"];
            NSString *foodcalorie = [[[foodlist objectAtIndex:j] objectForKey:@"calorie"] stringByAppendingString:@"/100g"];
            NSString *urlstring = [[foodlist objectAtIndex:j] objectForKey:@"img"];
            NSURL *urlimg = [[NSURL alloc] initWithString:urlstring];
            DoraRecomFoodUnitView *foodunitview = [[DoraRecomFoodUnitView alloc] init];
            
            CGRect tempframe = foodunitview.frame;
            tempframe.origin = CGPointMake(5 + j * (117 + 8), 0);
            foodunitview.frame = tempframe;
            [foodunitview.foodImage sd_setImageWithURL:urlimg];
            foodunitview.foodName.text = foodname;
            // foodunitview.foodAmount.text = foodamount;
            foodunitview.foodCalorie.text = foodcalorie;
            
            [contentView.foodList addSubview:foodunitview];
        }
        
        [_foodContentWrapper addSubview:contentView];

    }
}

@end
