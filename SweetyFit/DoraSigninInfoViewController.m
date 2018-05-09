//
//  DoraSigninInfoViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 26/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.



#import "DoraSigninInfoViewController.h"
#import "DoraRootNavigationViewController.h"
#import "UIView+DoraLoginGetInfoQueView.h"
#import "UILabel+TextUI.h"
#import "DoraScreenInforHeader.h"
#import "DoraColorDefineHeader.h"
#import "DoraLoginHeader.h"

@interface DoraSigninInfoViewController ()
@property(nonatomic, strong) UIDatePicker *birthday;
@property(nonatomic, strong) UIScrollView *wrapper;
@property(nonatomic, strong) NSMutableDictionary *userData;

@property(nonatomic, strong) UILabel *warningNotice;

@property(nonatomic, strong) UITextField *bodyHeight;
@property(nonatomic, strong) UITextField *bodyWeight;

@property(nonatomic, strong) NSMutableArray *genderStatus;
@property(nonatomic, strong) NSMutableArray *trainTimeStatus;
@property(nonatomic, strong) NSMutableArray *trainPlaceStatus;
@property(nonatomic, strong) NSMutableArray *trainAimStatus;
@property(nonatomic, strong) NSMutableArray *howBusyStatus;
@property(nonatomic, strong) NSMutableArray *bodyRegionStatus;
@property(nonatomic, strong) NSMutableArray *trainLevelStatus;
@property(nonatomic, strong) NSMutableArray *bodyShapeStatus;

@property(nonatomic, strong) NSMutableArray *genderValues;
@property(nonatomic, strong) NSMutableArray *trainTimeValues;
@property(nonatomic, strong) NSMutableArray *trainPlaceValues;
@property(nonatomic, strong) NSMutableArray *trainAimValues;
@property(nonatomic, strong) NSMutableArray *howBusyValues;
@property(nonatomic, strong) NSMutableArray *bodyRegionValues;
@property(nonatomic, strong) NSMutableArray *trainLevelValues;
@property(nonatomic, strong) NSMutableArray *bodyShapeValues;

@property(nonatomic, strong) NSMutableArray<UIButton *> *genderBtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *trainTimeBtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *trainPlaceBtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *trainAimBtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *howBusyBtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *bodyRegionBtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *trainlevelBtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *bodyShapeBtns;

@property(nonatomic, strong) NSMutableArray<UIImage *> *femaleBs;
@property(nonatomic, strong) NSMutableArray<UIImage *> *maleBs;

@end

@implementation DoraSigninInfoViewController {
    float y;
    float titleHeight;
    int buttounNum;
    float seperatew;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialData];
    [self initialUIElements];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

-(void)viewTapped:(UITapGestureRecognizer*)tap {
    [self.view endEditing:YES];
}

- (void) initialData {
    y = 60;
    titleHeight = 40;
    buttounNum = (DoraScreenWidth - 20) / 100;
    seperatew = (DoraScreenWidth - 20 - 90 * buttounNum) / buttounNum;
    
    _genderStatus = [[NSMutableArray alloc] initWithArray:@[@"0", @"0"]];
    _howBusyStatus = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0"]];
    _bodyRegionStatus = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0"]];
    _trainPlaceStatus = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0"]];
    _trainTimeStatus = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0"]];
    _trainAimStatus = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0", @"0", @"0"]];
    _trainLevelStatus = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0"]];
    _bodyShapeStatus = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0", @"0"]];
    

    _genderValues = [[NSMutableArray alloc] initWithArray:@[@"1", @"0"]];
    _howBusyValues = [[NSMutableArray alloc] initWithArray:@[@"SSSS", @"SSS", @"SS", @"S"]];
    _trainAimValues = [[NSMutableArray alloc] initWithArray:@[@"loveExercise", @"keepFit", @"loseFat", @"strongMuscle", @"regionShape", @"allShape"]];
    _trainTimeValues = [[NSMutableArray alloc] initWithArray:@[@"10", @"15", @"20"]];
    _trainPlaceValues = [[NSMutableArray alloc] initWithArray:@[@"home", @"office", @"gym", @"outside"]];
    _bodyRegionValues = [[NSMutableArray alloc] initWithArray:@[@"neck", @"shoulder", @"arm", @"back", @"chest", @"ventral", @"leg", @"hip", @"all"]];
    _trainLevelValues = [[NSMutableArray alloc] initWithArray:@[@"SSS", @"SSS", @"SS", @"S"]];
    _bodyShapeValues = [[NSMutableArray alloc] initWithArray:@[@"superthin", @"thin", @"standard", @"fat", @"superfat"]];
    
    _genderBtns = [[NSMutableArray alloc] init];
    _trainTimeBtns = [[NSMutableArray alloc] init];
    _trainPlaceBtns = [[NSMutableArray alloc] init];
    _trainAimBtns = [[NSMutableArray alloc] init];
    _bodyRegionBtns = [[NSMutableArray alloc] init];
    _howBusyBtns = [[NSMutableArray alloc] init];
    _trainlevelBtns = [[NSMutableArray alloc] init];
    _bodyShapeBtns = [[NSMutableArray alloc] init];
    
    NSArray *femaleBsNames = @[@"bs1.png", @"bs2.png", @"bs3.png", @"bs4.png", @"bs5.png"];
    NSArray *maleBsNames = @[@"bs5.png", @"bs4.png", @"bs3.png", @"bs2.png", @"bs1.png"];
    
    _femaleBs = [[NSMutableArray alloc] init];
    _maleBs = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < maleBsNames.count; ++i) {
        UIImage *female = [UIImage imageNamed:[femaleBsNames objectAtIndex:i]];
        UIImage *male = [UIImage imageNamed:[maleBsNames objectAtIndex:i]];
        
        [_femaleBs addObject:female];
        [_maleBs addObject:male];
    }
}

- (void) initialUIElements {
    UILabel *notice = [UILabel DoraCreateMultilinesUILabel: @"感谢您使用Sweety Fit! \n为了您更好的体验，请您配合补充以下信息！" LineNum:3 FontSize:15 LineSpace:10 TextColor:AppDefaultColor];
    notice.frame = CGRectMake(0, 0, DoraScreenWidth, 60);
    
    _wrapper = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight)];
    [_wrapper setBackgroundColor:AppDefaultBackgroundColor];
    [_wrapper setContentSize:CGSizeMake(DoraScreenWidth, 1850)];
    [_wrapper addSubview:notice];
    
    [self.view addSubview:_wrapper];
    [self addQuestions];
    [self addBirthday];
    [self addBodyInfos];
    [self addBodyShapes];
    
    _warningNotice = [UILabel DoraCreateMultilinesUILabel:@"" LineNum:1 FontSize:14 LineSpace:10 TextColor:[UIColor redColor]];
    _warningNotice.hidden = YES;
    _warningNotice.frame = CGRectMake(0, y+20, DoraScreenWidth, 30);
    
    y += 40;
    
    UIButton *submitButton = [UIButton DoraCreateOrangeColorButtonWithWidth:DoraScreenWidth*0.8 Height:40 borderRadius:3 Text:@"提交" X:DoraScreenWidth*0.1 Y:y+20];
    [submitButton addTarget:self action:@selector(Submit:) forControlEvents:UIControlEventTouchUpInside];
    
    [_wrapper addSubview:_warningNotice];
    [_wrapper addSubview:submitButton];
}

- (void) addQuestions {
    NSArray *genderText = @[@"绅士男神", @"优雅女神"];
    NSArray *howBusyText = @[@"12小时以上", @"10～12小时", @"8～10小时", @"8小时以下"];
    NSArray *trainAimText = @[@"运动使我快乐", @"保持健康", @"减脂瘦身", @"增肌强健", @"局部塑形", @"塑形紧致"];
    NSArray *trainTimeText = @[@"10分钟", @"15分钟", @"20分钟"];
    NSArray *bodyRegionText = @[@"颈部", @"肩部", @"手臂", @"背部", @"胸部", @"腹部", @"腿部", @"臀部", @"全身"];
    NSArray *trainPlaceText = @[@"办公室", @"家", @"健身房", @"户外"];
    NSArray *trainLevelText = @[@"每周3次以上", @"每周1～2次", @"每个月2次", @"不经常运动"];
    
    [self addQuestionWithQuestion:@"您是一位 ？" Options:genderText Tag:@"gender"];
    [self addQuestionWithQuestion:@"您每天的平均工作强度 ？" Options:howBusyText Tag:@"howbusy"];
    [self addQuestionWithQuestion:@"您期望的运动效果 ？" Options:trainAimText Tag:@"effects"];
    [self addQuestionWithQuestion:@"您倾向的每次训练时长 ？" Options:trainTimeText Tag:@"times"];
    [self addQuestionWithQuestion:@"您倾向的训练场地是 ？" Options:trainPlaceText Tag:@"places"];
    [self addQuestionWithQuestion:@"您期望加强或改进身体的哪些部位 ？" Options:bodyRegionText Tag:@"regions"];
    [self addQuestionWithQuestion:@"您的平均运动频度是 ？" Options:trainLevelText Tag:@"level"];
}

- (void) addQuestionWithQuestion:(NSString *) question Options:(NSArray *) options Tag:(NSString *) tagtext{
    
    NSInteger len = options.count;
    NSInteger rown = len / buttounNum;
    if (len % buttounNum > 0) {
        ++rown;
    }
    float viewHeight = rown * 40 + 40;
    
    UIView *view = [UIView DoraCreateQuestionViewWithHeight:viewHeight Y:y Title:question];
    y = y + viewHeight + 5;
    
    for (int i = 0; i < len; ++i) {
        UIButton *btn = [UIButton DoraCreateGetInfoPureColorButtonWithX:10 + (seperatew + 100)*(i%buttounNum) Y:40 + (i/buttounNum)*(40) Text:options[i]];
        
        btn.tag = i;
        
        if ([tagtext isEqualToString:@"gender"]) {
            [_genderBtns addObject:btn];
            [btn addTarget:self action:@selector(genderSetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"howbusy"]) {
            [_howBusyBtns addObject:btn];
            [btn addTarget:self action:@selector(howbusySetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"effects"]) {
            [_trainAimBtns addObject:btn];
            [btn addTarget:self action:@selector(trainaimSetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"times"]) {
            [_trainTimeBtns addObject:btn];
            [btn addTarget:self action:@selector(traintimeSetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"places"]) {
            [_trainPlaceBtns addObject:btn];
            [btn addTarget:self action:@selector(trainplaceSetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"regions"]) {
            [_bodyRegionBtns addObject:btn];
            [btn addTarget:self action:@selector(bodyregionSetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"level"]) {
            [_trainlevelBtns addObject:btn];
            [btn addTarget:self action:@selector(trainLevelSetting:) forControlEvents:UIControlEventTouchUpInside];
        }

        [view addSubview:btn];
    }
    
    [_wrapper addSubview:view];
}

- (void) addBirthday {
    UIView *view = [UIView DoraCreateQuestionViewWithHeight:220 Y:y Title:@"请选择您的生日 😊"];
    _birthday = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,40, DoraScreenWidth,180)];
    _birthday.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    _birthday.datePickerMode = UIDatePickerModeDate;
    [_birthday setBackgroundColor:[UIColor whiteColor]];
    
    y += 225;
    
    [view addSubview:_birthday];
    [_wrapper addSubview:view];
}

- (void) addBodyInfos {
    UIView *bodyView = [UIView DoraCreateQuestionViewWithHeight:50 * 1 Y:y Title:@""];
    
    y = y + 55;
    
    UILabel *bodyHeightLabel = [UILabel DoraCreateTextTitleName:@"身高(cm):"];
    UILabel *bodyWeightLabel = [UILabel DoraCreateTextTitleName:@"体重(kg):"];
    
    float textfieldw = 80;
    float rightx = (DoraScreenWidth-20)/2 + 10;
    
    bodyHeightLabel.frame = CGRectMake(10, 10, textfieldw, 30);
    bodyWeightLabel.frame = CGRectMake(rightx, 10, textfieldw, 30);
    bodyHeightLabel.font = [UIFont systemFontOfSize:14];
    bodyWeightLabel.font = [UIFont systemFontOfSize:14];
    
    _bodyHeight = [UITextField DoraCreateSigninGetInfoTextFieldWithUnit:@"cm" Frame:CGRectMake(90, 10, 80, 30)];
    _bodyWeight = [UITextField DoraCreateSigninGetInfoTextFieldWithUnit:@"kg" Frame:CGRectMake(rightx+80, 10, 80, 30)];
    
    _bodyHeight.keyboardType = UIKeyboardTypeNumberPad;
    _bodyWeight.keyboardType = UIKeyboardTypeNumberPad;
    
    [bodyView addSubview:bodyHeightLabel];
    [bodyView addSubview:bodyWeightLabel];
    
    [bodyView addSubview:_bodyHeight];
    [bodyView addSubview:_bodyWeight];
    
    [_wrapper addSubview:bodyView];
}

- (void) addBodyShapes {
    float viewh = 350;
    float btnw = (DoraScreenWidth - 40) / 5;
    float x = 10;
    UIView *shapeView = [UIView DoraCreateQuestionViewWithHeight:viewh Y:y Title:@"下列哪张图更符合您的体形呢？"];
    y += viewh;
    
    for (NSUInteger i = 0; i < _femaleBs.count; ++i) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 40, btnw, 300)];
        btn.tag = i;
        [btn setBackgroundImage:[_femaleBs objectAtIndex:i] forState:UIControlStateNormal];
        [btn.layer setBorderColor:[UIColor clearColor].CGColor];
        [btn.layer setBorderWidth:1];
        
        [btn addTarget:self action:@selector(shapeSetting:) forControlEvents:UIControlEventTouchUpInside];
        
        [_bodyShapeBtns addObject:btn];
        [shapeView addSubview:btn];
        x += (btnw + 5);
    }
    
    [_wrapper addSubview:shapeView];
}

#pragma mark -- Option Button Event Functions

- (void)genderSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    if (currentid == 0) {
        for (NSUInteger i = 0; i < _bodyShapeBtns.count; ++i) {
            [[_bodyShapeBtns objectAtIndex:i] setBackgroundImage:[_maleBs objectAtIndex:i] forState:UIControlStateNormal];
        }
    } else {
        for (NSUInteger i = 0; i < _bodyShapeBtns.count; ++i) {
            [[_bodyShapeBtns objectAtIndex:i] setBackgroundImage:[_femaleBs objectAtIndex:i] forState:UIControlStateNormal];
        }
    }
    [self RadioSettingDataArray:_genderStatus BtnArray:_genderBtns Tag:currentid];
}

- (void)howbusySetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self RadioSettingDataArray:_howBusyStatus BtnArray:_howBusyBtns Tag:currentid];
}

- (void)trainaimSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self CheckSettingDataArray:_trainAimStatus BtnArray:_trainAimBtns Tag:currentid];
}

- (void)trainplaceSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self CheckSettingDataArray:_trainPlaceStatus BtnArray:_trainPlaceBtns Tag:currentid];
}

- (void)traintimeSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self CheckSettingDataArray:_trainTimeStatus BtnArray:_trainTimeBtns Tag:currentid];
}

- (void)bodyregionSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self CheckSettingDataArray:_bodyRegionStatus BtnArray:_bodyRegionBtns Tag:currentid];
}

- (void)trainLevelSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self RadioSettingDataArray:_trainLevelStatus BtnArray:_trainlevelBtns Tag:currentid];
}

- (void)shapeSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self RadioBodyShape:_bodyShapeStatus BtnArray:_bodyShapeBtns Tag:currentid];
}

- (void)RadioSettingDataArray:(NSMutableArray *) dataArray BtnArray:(NSMutableArray<UIButton *>*) btnArray Tag:(NSInteger) tag {
    
    NSInteger len = dataArray.count;
  
    for (NSInteger i = 0; i < len; ++i) {
        dataArray[i] = @"0";
    }
    dataArray[tag] = @"1";
    
    len = btnArray.count;

    for (NSInteger i = 0; i < len; ++i) {
        [btnArray[i] setTitleColor:AppDefaultColor forState:UIControlStateNormal];
        [btnArray[i] setBackgroundColor:[UIColor clearColor]];
    }
    [btnArray[tag] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnArray[tag] setBackgroundColor:AppDefaultColor];
}

- (void)CheckSettingDataArray:(NSMutableArray *) dataArray BtnArray:(NSMutableArray<UIButton *> *) btnArray Tag:(NSInteger) tag {
    if ([dataArray[tag] isEqualToString:@"1"]) {
        dataArray[tag] = @"0";
        [btnArray[tag] setTitleColor:AppDefaultColor forState:UIControlStateNormal];
        [btnArray[tag] setBackgroundColor:[UIColor clearColor]];
    } else {
        dataArray[tag] = @"1";
        [btnArray[tag] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //[btnArray[tag].layer setBorderColor:AppDefaultColor.CGColor];
        [btnArray[tag] setBackgroundColor:AppDefaultColor];
    }
}

- (void)RadioBodyShape:(NSMutableArray *) dataArray BtnArray:(NSMutableArray<UIButton *> *) btnArray Tag:(NSInteger) tag {
    NSInteger len = dataArray.count;
    
    for (NSInteger i = 0; i < len; ++i) {
        dataArray[i] = @"0";
    }
    dataArray[tag] = @"1";
    
    len = btnArray.count;
    
    for (NSInteger i = 0; i < len; ++i) {
        [btnArray[i].layer setBorderColor:[UIColor clearColor].CGColor];
    }
    [btnArray[tag].layer setBorderColor:AppDefaultColor.CGColor];
}


/* Data Solve */

- (BOOL) isDigit:(NSString *) text {
    BOOL result = YES;
    
    if (text.length <= 1 || text.length > 4) {
        result = NO;
    } else if ([[text substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"]) {
        result = NO;
    } else {
        NSScanner* scan = [NSScanner scannerWithString:text];
        int val;
        return[scan scanInt:&val] && [scan isAtEnd];
    }
    
    return result;
}

- (NSMutableArray *) getData:(NSMutableArray *) items ItemValues:(NSArray *) itemvalue {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < items.count; ++i) {
        if ([items[i] isEqualToString:@"1"]) {
            [data addObject:itemvalue[i]];
        }
    }
    return data;
}

- (NSString *) getBirthday {
    NSDate *birth = [_birthday date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|
    NSCalendarUnitDay;
    NSDateComponents *d = [cal components:unitFlags fromDate:birth];
    NSInteger year = [d year];
    NSInteger month = [d month];
    NSInteger day  =  [d day];
    
    NSString *smonth;
    NSString *sday;
    
    if (month < 10) {
        smonth = [NSString stringWithFormat:@"0%lu", month];
    } else {
        smonth = [NSString stringWithFormat:@"%lu", month];
    }
    
    if (day < 10) {
        sday = [NSString stringWithFormat:@"0%lu", day];
    } else {
        sday = [NSString stringWithFormat:@"%lu", day];
    }
    
    NSString *result = [[[NSString stringWithFormat:@"%lu", year] stringByAppendingString:smonth] stringByAppendingString:sday];
    
    
    return result;
}

- (void) setNoticeText:(NSString *) text{
    _warningNotice.text = text;
    _warningNotice.hidden = NO;
}

/* NetWork */



- (void) Submit:(id) sender {
    // organize inputs
    NSString *weight = _bodyWeight.text;
    NSString *height = _bodyHeight.text;
    NSMutableArray *gender = [[NSMutableArray alloc] init];
    NSMutableArray *howbusy = [[NSMutableArray alloc] init];
    NSMutableArray *effects = [[NSMutableArray alloc] init];
    NSMutableArray *times = [[NSMutableArray alloc] init];
    NSMutableArray *places = [[NSMutableArray alloc] init];
    NSMutableArray *regions = [[NSMutableArray alloc] init];
    NSMutableArray *trainlevel = [[NSMutableArray alloc] init];
    NSMutableArray *shape = [[NSMutableArray alloc] init];
    
    
    gender = [self getData:_genderStatus ItemValues:_genderValues];
    effects = [self getData:_trainAimStatus ItemValues:_trainAimValues];
    times = [self getData:_trainTimeStatus ItemValues:_trainTimeValues];
    places = [self getData:_trainPlaceStatus ItemValues:_trainPlaceValues];
    regions = [self getData:_bodyRegionStatus ItemValues:_bodyRegionValues];
    howbusy = [self getData:_howBusyStatus ItemValues:_howBusyValues];
    trainlevel = [self getData:_trainLevelStatus ItemValues:_trainLevelValues];
    shape = [self getData:_bodyShapeStatus ItemValues:_bodyShapeValues];
    
    if (gender.count == 0) {
        [self setNoticeText:@"请选择性别！"];
        return;
    }
    
    if (howbusy.count ==0) {
        [self setNoticeText:@"请选择您的工作强度！"];
        return;
    }
    
    if (effects.count ==0) {
        [self setNoticeText:@"请选择您期望的训练效果！"];
        return;
    }
    
    if (times.count ==0) {
        [self setNoticeText:@"请选择您期望的训练时长！"];
        return;
    }
    
    if(places.count == 0) {
        [self setNoticeText:@"请选择您倾向的运动场地！"];
        return;
    }
    
    if(regions.count == 0) {
        [self setNoticeText:@"请选择您想重点训练的部位！"];
        return;
    }
    
    if(trainlevel.count == 0) {
        [self setNoticeText:@"请选择您平常的运动频率！"];
        return;
    }
    
    if ([self isDigit:weight] == NO) {
        [self setNoticeText:@"体重不能为空，且应为合理整数"];
        return;
    }
    
    if ([self isDigit:height] == NO) {
        [self setNoticeText:@"身高不能为空，且应为合理整数"];
        return;
    }
    
    if (shape.count == 0) {
        [self setNoticeText:@"请选择你认为最符合您身体形态的图片"];
        return;
    }
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:weight forKey:@"weight"];
    [dict setObject:height forKey:@"height"];
    [dict setObject:[gender objectAtIndex:0] forKey:@"gender"];
    [dict setObject:effects forKey:@"effects"];
    [dict setObject:times forKey:@"times"];
    [dict setObject:places forKey:@"places"];
    [dict setObject:regions forKey:@"regions"];
    [dict setObject:[howbusy objectAtIndex:0] forKey:@"howbusy"];
    [dict setObject:[shape objectAtIndex:0] forKey:@"shape"];
    [dict setObject:[trainlevel objectAtIndex:0] forKey:@"level"];
    [dict setObject:[self getBirthday] forKey:@"birthday"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"uid"] != nil) {
        [dict setObject:[defaults objectForKey:@"uid"] forKey:@"uid"];
    } else {
        [self setNoticeText:@"未注册或未登录！"];
        return;
    }
    
    
    NSLog(@"%@", dict);
    _warningNotice.hidden = YES;
    
    NSString *urlString = [serverurl stringByAppendingString: @"/account/signininfo"];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer= [AFHTTPRequestSerializer new];

    [manager POST:urlString parameters:dict progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        DoraRootNavigationViewController *rootpage = [[DoraRootNavigationViewController alloc] init];
        [self presentViewController:rootpage animated:YES completion:^(void){}];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
        [self setNoticeText:@"网络错误，请稍后再试！"];
    }];
}


@end
