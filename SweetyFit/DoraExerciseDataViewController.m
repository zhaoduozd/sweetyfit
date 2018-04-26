//
//  DoraExerciseDataViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 9/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseDataViewController.h"

@interface DoraExerciseDataViewController ()
@property (nonatomic, strong) HKHealthStore *healthkitstore;
@end

@implementation DoraExerciseDataViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self SetViewUI];
    [self ObtainHealthKitData];
}

-(void) ObtainHealthKitData {
    
    if (![HKHealthStore isHealthDataAvailable]) {
        NSLog(@"该设备不支持HealthKit");
        
        _totalCalorieData.text = @"";
        _walkingRunningCalorieData.text = @"该设备不支持HealthKit,无法获取运动信息！";
        _sportCalorieData.text = @"";
        
        return;
    }
    
    self.healthkitstore = [[HKHealthStore alloc] init];
    
    /*   Set Authority to Get   */
    HKObjectType *calorietype = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    NSSet *healthSet = [NSSet setWithObjects:calorietype, nil];
    
    /*   Request Authority Set Above   */
    __weak DoraExerciseDataViewController *weakself = self;
    [_healthkitstore requestAuthorizationToShareTypes:nil readTypes:healthSet
                                           completion:^(BOOL success, NSError * _Nullable error) {
                                               if (success) {
                                                   [weakself ReadHealthKitCalorie];
                                               } else {
                                                   NSLog(@"获取步数权限失败");
                                               }
                                           }];
}

- (void) ReadHealthKitCalorie {
    __weak HKHealthStore *weakhealthkitstore = _healthkitstore;
    __weak DoraExerciseDataViewController *weakself = self;
    
    NSSortDescriptor *start = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
    NSSortDescriptor *end   = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    HKSampleType *calorietype = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    
    NSDate *startDate, *endDate;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateCom = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    
    endDate = [calendar dateFromComponents:dateCom];
    [dateCom setHour:0];
    [dateCom setMinute:0];
    [dateCom setSecond:0];
    startDate = [calendar dateFromComponents:dateCom];
    
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionStrictStartDate];
    
    HKSampleQuery *querycalorie = [[HKSampleQuery alloc] initWithSampleType:calorietype predicate:predicate limit:HKObjectQueryNoLimit sortDescriptors:@[start,end] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        
        double num = 0;
        
        for (HKQuantitySample *res in results){
            num += [res.quantity doubleValueForUnit:[HKUnit kilocalorieUnit]];
        }
        
        
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            [weakself SetExerciseData:num];
        }];
        [weakhealthkitstore stopQuery:query];
    }];
    
    [_healthkitstore executeQuery:querycalorie];
}

- (void) SetExerciseData:(double) walkingrunning {
    double exercise = 0;
    double total = walkingrunning;
    
    /*   Get Exercise Record Path   */
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [defaults objectForKey:@"uid"];
    NSString *subfilepath = [NSString stringWithFormat:@"%@exerciserecord.plist", username];
    NSString *filepath= [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)lastObject]stringByAppendingPathComponent:subfilepath];
    
    /*   Get Exercise Data   */
    NSDictionary *exerciserecord = [[NSDictionary alloc] initWithContentsOfFile:filepath];
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|
    NSCalendarUnitDay;
    NSDateComponents *d = [calendar components:unitFlags fromDate:date];
    NSString *currenttimestamp = [NSString stringWithFormat:@"%ld*%ld*%ld",[d year], [d month], [d day]];
    
    NSString *timestamp = [exerciserecord objectForKey:@"timestamp"];
    if ([timestamp isEqualToString:currenttimestamp]) {
        exercise = [[exerciserecord objectForKey:@"exerciseconsume"] doubleValue];
    } else {
        exercise = 0;
    }
    
    total += exercise;
    
    _totalCalorieData.text = [NSString stringWithFormat:@"%.0f", total];
    _walkingRunningCalorieData.text = [NSString stringWithFormat:@"%.1f Kcal", walkingrunning];
    _sportCalorieData.text = [NSString stringWithFormat:@"%.1f Kcal", exercise];
}

- (void) SetViewUI {
    _totalCalorieData = [[UILabel alloc] init];
    _totalCalorieUnit = [[UILabel alloc] init];
    _walkingRunningCalorieData = [[UILabel alloc] init];
    _sportCalorieData = [[UILabel alloc] init];
    
    UILabel *modeltitle = [UILabel DoraCreateTextBoldTitleName:@"今日消耗热量"];
    UILabel *totaltitle = [UILabel DoraCreateTextSmallRightTitleName:@"总消耗"];
    UILabel *walkingtitle = [UILabel DoraCreateTextSmallRightTitleName:@"跑步 & 走路"];
    UILabel *sporttitle = [UILabel DoraCreateTextSmallRightTitleName:@"运动"];
    
    
    UIView *sportDataWrapper = [[UIView alloc] initWithFrame:CGRectMake(-1, 40, DoraScreenWidth+2, 200)];
    sportDataWrapper.backgroundColor = AppDefaultSubViewBackgroundColor;
    sportDataWrapper.layer.borderWidth = 1;
    sportDataWrapper.layer.borderColor = AppDefaultBorderColor.CGColor;
    
    totaltitle.frame = CGRectMake(10, 60, 80, 30);
    walkingtitle.frame = CGRectMake(10, 120, 80, 30);
    sporttitle.frame = CGRectMake(10, 150, 80, 30);
    
    _totalCalorieData.font = [UIFont systemFontOfSize:80];
    _totalCalorieData.frame = CGRectMake(100, 10, 200, 90);
    _totalCalorieData.text = @"";
    _totalCalorieData.textAlignment = NSTextAlignmentCenter;
    _totalCalorieData.textColor =  [UIColor colorWithRed:255.0/255.0 green:113.0/255.0 blue:5.0/255.0 alpha:.7];
    
    _totalCalorieUnit.font = [UIFont systemFontOfSize:30];
    _totalCalorieUnit.frame = CGRectMake(300, 50, 100, 45);
    _totalCalorieUnit.text = @"Kcal";
    _totalCalorieUnit.textColor = [UIColor grayColor];
    
    _walkingRunningCalorieData.font = [UIFont systemFontOfSize:16];
    _walkingRunningCalorieData.frame = CGRectMake(110, 120, 200, 30);
    _walkingRunningCalorieData.text = @"";
    _walkingRunningCalorieData.textColor = [UIColor grayColor];
    
    _sportCalorieData.font = [UIFont systemFontOfSize:16];
    _sportCalorieData.frame = CGRectMake(110, 150, 200, 30);
    _sportCalorieData.text = @"";
    _sportCalorieData.textColor = [UIColor grayColor];
    
    
    [sportDataWrapper addSubview:totaltitle];
    [sportDataWrapper addSubview:walkingtitle];
    [sportDataWrapper addSubview:sporttitle];
    
    [sportDataWrapper addSubview:_totalCalorieData];
    [sportDataWrapper addSubview:_totalCalorieUnit];
    [sportDataWrapper addSubview:_walkingRunningCalorieData];
    [sportDataWrapper addSubview:_sportCalorieData];
    
    [self.view addSubview:modeltitle];
    [self.view addSubview:sportDataWrapper];
}

@end
