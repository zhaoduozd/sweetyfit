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
@property(nonatomic, strong) UIScrollView *wrapper;
@property(nonatomic, strong) NSMutableDictionary *userData;

@property(nonatomic, strong) UITextField *bodyHeight;
@property(nonatomic, strong) UITextField *bodyWeight;
@property(nonatomic, strong) UITextField *chestline;
@property(nonatomic, strong) UITextField *waistline;
@property(nonatomic, strong) UITextField *hipline;

@property(nonatomic, strong) NSMutableArray *gender;
@property(nonatomic, strong) NSMutableArray *trainTimes;
@property(nonatomic, strong) NSMutableArray *trainPlaces;
@property(nonatomic, strong) NSMutableArray *trainAims;
@property(nonatomic, strong) NSMutableArray *howBusy;
@property(nonatomic, strong) NSMutableArray *bodyRegion;
@property(nonatomic, strong) NSMutableArray *trainLevel;

@property(nonatomic, strong) NSMutableArray<UIButton *> *genderbtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *trainTimesbtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *trainPlacesbtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *trainAimsbtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *howBusybtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *bodyRegionbtns;
@property(nonatomic, strong) NSMutableArray<UIButton *> *trainlevelbtns;

@end

@implementation DoraSigninInfoViewController {
    float y;
    float titleHeight;
    int buttounNum;
    float seperatew;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _wrapper = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, DoraScreenHeight)];
    [_wrapper setBackgroundColor:AppDefaultBackgroundColor];
    [_wrapper setContentSize:CGSizeMake(DoraScreenWidth, 1300)];
    
    UILabel *notice = [[UILabel alloc] init];
    notice.text = @"为更准确得为您推荐运动和饮食，请您配合补充以下信息！";
    notice.font = [UIFont systemFontOfSize:14];
    notice.textColor = AppDefaultColor;
    notice.textAlignment = NSTextAlignmentCenter;
    notice.frame = CGRectMake(0, 8, DoraScreenWidth, 30);
    
    [_wrapper addSubview:notice];
    
    y = 45;
    titleHeight = 40;
    buttounNum = (DoraScreenWidth - 20) / 100;
    seperatew = (DoraScreenWidth - 20 - 90 * buttounNum) / buttounNum;
    
    [self initialData];
    
    [self.view addSubview:_wrapper];
    [self addQuestions];
    [self addBodyInfos];
    
    UIButton *submitButton = [UIButton DoraCreateLoginOrangeColorButtonWithWidth: DoraScreenWidth/2 Height:50 borderRadius:3 Text:@"提交"];
    CGRect tempframe = submitButton.frame;
    tempframe.origin = CGPointMake(DoraScreenWidth/4, y+20);
    submitButton.frame = tempframe;
    
    [submitButton addTarget:self action:@selector(Submit:) forControlEvents:UIControlEventTouchUpInside];
    [_wrapper addSubview:submitButton];
}

- (void) initialData {
    _gender = [[NSMutableArray alloc] initWithArray:@[@"0", @"0"]];
    _howBusy = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0"]];
    _bodyRegion = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0"]];
    _trainPlaces = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0"]];
    _trainTimes = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0"]];
    _trainAims = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0", @"0", @"0"]];
    _trainLevel = [[NSMutableArray alloc] initWithArray:@[@"0", @"0", @"0", @"0"]];

    
    _genderbtns = [[NSMutableArray alloc] init];
    _trainTimesbtns = [[NSMutableArray alloc] init];
    _trainPlacesbtns = [[NSMutableArray alloc] init];
    _trainAimsbtns = [[NSMutableArray alloc] init];
    _bodyRegionbtns = [[NSMutableArray alloc] init];
    _howBusybtns = [[NSMutableArray alloc] init];
    _trainlevelbtns = [[NSMutableArray alloc] init];
}

- (void) addQuestions {
    NSArray *genderText = @[@"绅士男神", @"优雅女神"];
    NSArray *howBusyText = @[@"12小时以上", @"10～12小时", @"8～10小时", @"8小时以下"];
    NSArray *trainAimText = @[@"喜爱运动", @"保持健康", @"减脂瘦身", @"增肌强健", @"局部塑形", @"塑形紧致"];
    NSArray *trainTimeText = @[@"10分钟", @"15分钟", @"20分钟"];
    NSArray *bodyRegionText = @[@"颈部", @"肩部", @"手臂", @"背部", @"胸部", @"腹部", @"腿部", @"臀部", @"全身"];
    NSArray *trainPlaceText = @[@"办公室", @"家", @"健身房", @"户外"];
    NSArray *trainLevelText = @[@"每周3次以上", @"每周1～2次", @"每个月2次", @"不经常运动"];
    
    [self addQuestionWithQuestion:@"您是一位：" Options:genderText Tag:@"gender"];
    [self addQuestionWithQuestion:@"您每天的平均工作强度：" Options:howBusyText Tag:@"howbusy"];
    [self addQuestionWithQuestion:@"您的训练目的" Options:trainAimText Tag:@"effects"];
    [self addQuestionWithQuestion:@"您倾向的每次训练时长：" Options:trainTimeText Tag:@"times"];
    [self addQuestionWithQuestion:@"您倾向的训练场地：" Options:trainPlaceText Tag:@"places"];
    [self addQuestionWithQuestion:@"您期望加强或改进的身体部位：" Options:bodyRegionText Tag:@"regions"];
    [self addQuestionWithQuestion:@"您的平均运动频度：" Options:trainLevelText Tag:@"level"];
}

- (void) addQuestionWithQuestion:(NSString *) question Options:(NSArray *) options Tag:(NSString *) tagtext{
    
    NSInteger len = options.count;
    NSInteger rown = len / buttounNum;
    if (len % buttounNum > 0) {
        ++rown;
    }
    float viewHeight = rown * 40 + 40;
    
    UIView *view = [UIView DoraCreateQuestionViewWithHeight:viewHeight Y:y Title:question];
    y = y + viewHeight + 20;
    
    for (int i = 0; i < len; ++i) {
        UIButton *btn = [UIButton DoraCreateGetInfoPureColorButtonWithX:10 + (seperatew + 100)*(i%buttounNum) Y:40 + (i/buttounNum)*(40) Text:options[i]];
        
        btn.tag = i;
        
        if ([tagtext isEqualToString:@"gender"]) {
            [_genderbtns addObject:btn];
            [btn addTarget:self action:@selector(genderSetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"howbusy"]) {
            [_howBusybtns addObject:btn];
            [btn addTarget:self action:@selector(howbusySetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"effects"]) {
            [_trainAimsbtns addObject:btn];
            [btn addTarget:self action:@selector(trainaimSetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"times"]) {
            [_trainTimesbtns addObject:btn];
            [btn addTarget:self action:@selector(traintimeSetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"places"]) {
            [_trainPlacesbtns addObject:btn];
            [btn addTarget:self action:@selector(trainplaceSetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"regions"]) {
            [_bodyRegionbtns addObject:btn];
            [btn addTarget:self action:@selector(bodyregionSetting:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([tagtext isEqualToString:@"level"]) {
            [_trainlevelbtns addObject:btn];
            [btn addTarget:self action:@selector(trainLevelSetting:) forControlEvents:UIControlEventTouchUpInside];
        }

        [view addSubview:btn];
    }
    
    [_wrapper addSubview:view];
}

- (void) addBodyInfos {
    UIView *bodyView = [UIView DoraCreateQuestionViewWithHeight:50 * 3 + 10 Y:y Title:@""];
    
    y = y + 160;
    
    UILabel *bodyHeightLabel = [UILabel DoraCreateTextTitleName:@"身高(cm):"];
    UILabel *bodyWeightLabel = [UILabel DoraCreateTextTitleName:@"体重(kg):"];
    UILabel *chestLabel = [UILabel DoraCreateTextTitleName:@"胸围(cm):"];
    UILabel *waistlineLabel = [UILabel DoraCreateTextTitleName:@"腰围(cm):"];
    UILabel *hiplineLabel = [UILabel DoraCreateTextTitleName:@"臀围(cm):"];
    
    float textfieldw = 80;
    float rightx = (DoraScreenWidth-20)/2;
    
    bodyHeightLabel.frame = CGRectMake(10, 10, textfieldw, 40);
    bodyWeightLabel.frame = CGRectMake(rightx, 10, textfieldw, 40);
    chestLabel.frame = CGRectMake(10, 60, textfieldw, 40);
    waistlineLabel.frame = CGRectMake(rightx, 60, textfieldw, 40);
    hiplineLabel.frame = CGRectMake(10, 110, textfieldw, 40);;
    
    
    _bodyHeight = [UITextField DoraCreateSigninGetInfoTextFieldWithUnit:@"cm"];
    _bodyWeight = [UITextField DoraCreateSigninGetInfoTextFieldWithUnit:@"kg"];
    _chestline = [UITextField DoraCreateSigninGetInfoTextFieldWithUnit:@"cm"];
    _waistline = [UITextField DoraCreateSigninGetInfoTextFieldWithUnit:@"cm"];
    _hipline = [UITextField DoraCreateSigninGetInfoTextFieldWithUnit:@"cm"];
    
    CGRect tempframe;
    
    tempframe = _bodyHeight.frame;
    tempframe.origin = CGPointMake(90, 10);
    _bodyHeight.frame = tempframe;

    tempframe = _bodyWeight.frame;
    tempframe.origin = CGPointMake(rightx + 80, 10);
    _bodyWeight.frame = tempframe;

    tempframe = _chestline.frame;
    tempframe.origin = CGPointMake(90, 60);
    _chestline.frame = tempframe;

    tempframe = _waistline.frame;
    tempframe.origin = CGPointMake(rightx + 80, 60);
    _waistline.frame = tempframe;

    tempframe = _hipline.frame;
    tempframe.origin = CGPointMake(90, 110);
    _hipline.frame = tempframe;

    
    [bodyView addSubview:bodyHeightLabel];
    [bodyView addSubview:bodyWeightLabel];
    [bodyView addSubview:chestLabel];
    [bodyView addSubview:waistlineLabel];
    [bodyView addSubview:hiplineLabel];
    
    [bodyView addSubview:_bodyHeight];
    [bodyView addSubview:_bodyWeight];
    [bodyView addSubview:_waistline];
    [bodyView addSubview:_chestline];
    [bodyView addSubview:_hipline];

    
    [_wrapper addSubview:bodyView];
}

#pragma mark -- Event Functions

- (void)genderSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self RadioSettingDataArray:_gender BtnArray:_genderbtns Tag:currentid];
}

- (void)howbusySetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self RadioSettingDataArray:_howBusy BtnArray:_howBusybtns Tag:currentid];
}

- (void)trainaimSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self CheckSettingDataArray:_trainAims BtnArray:_trainAimsbtns Tag:currentid];
}

- (void)trainplaceSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self CheckSettingDataArray:_trainPlaces BtnArray:_trainPlacesbtns Tag:currentid];
}

- (void)traintimeSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self CheckSettingDataArray:_trainTimes BtnArray:_trainTimesbtns Tag:currentid];
}

- (void)bodyregionSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self CheckSettingDataArray:_bodyRegion BtnArray:_bodyRegionbtns Tag:currentid];
}

- (void)trainLevelSetting:(id) sender {
    UIButton *button = (UIButton *)sender;
    NSInteger currentid = button.tag;
    [self RadioSettingDataArray:_trainLevel BtnArray:_trainlevelbtns Tag:currentid];
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

- (void) Submit:(id) sender {
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [dict setObject:_bodyHeight.text forKey:@"height"];
    [dict setObject:_bodyWeight.text forKey:@"weight"];
    [dict setObject:_chestline.text forKey:@"chestline"];
    [dict setObject:_waistline.text forKey:@"waistline"];
    [dict setObject:_hipline.text forKey:@"hipline"];
    [dict setObject:([_gender[0] isEqualToString:@"0"] ? @"male" : @"female") forKey:@"gender"];
    
    for (NSInteger i = 0; i < _howBusy.count; ++i) {
        if ([_howBusy[i] isEqualToString:@"1"]) {
            NSString *busy = @"S";
            switch (i) {
                case 0:
                    busy = @"SSSS";
                    break;
                case 1:
                    busy = @"SSS";
                    break;
                case 2:
                    busy = @"SS";
                    break;
                case 3:
                    busy = @"S";
                    break;
                default:
                    break;
            }
            [dict setObject:busy forKey:@"howbusy"];
            break;
        }
    }

    for (NSInteger i = 0; i < _trainLevel.count; ++i) {
        if ([_trainLevel[i] isEqualToString:@"1"]) {
            NSString *busy = @"S";
            switch (i) {
                case 0:
                    busy = @"SSS";
                    break;
                case 1:
                    busy = @"SSS";
                    break;
                case 2:
                    busy = @"SS";
                    break;
                case 3:
                    busy = @"S";
                    break;
                default:
                    break;
            }
            [dict setObject:busy forKey:@"level"];
            break;
        }
    }

    NSMutableArray *effects = [[NSMutableArray alloc] init];
    NSMutableArray *times = [[NSMutableArray alloc] init];
    NSMutableArray *places = [[NSMutableArray alloc] init];
    NSMutableArray *regions = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < _trainAims.count; ++i) {
        if ([_trainAims[i] isEqualToString:@"1"]) {
            NSString *effectname;
            switch (i) {
                case 0:
                    effectname = @"loveExercise";
                    break;
                case 1:
                    effectname = @"keepFit";
                    break;
                case 2:
                    effectname = @"loseFat";
                    break;
                case 3:
                    effectname = @"strongMuscle";
                    break;
                case 4:
                    effectname = @"regionShape";
                    break;
                case 5:
                    effectname = @"allShape";
                    break;
                default:
                    break;
            }
            [effects addObject:effectname];
        }
    }

    for (int i = 0; i < _trainTimes.count; ++i) {
        if ([_trainAims[i] isEqualToString:@"1"]) {
            NSString *effectname;
            switch (i) {
                case 0:
                    effectname = @"10";
                    break;
                case 1:
                    effectname = @"15";
                    break;
                case 2:
                    effectname = @"20";
                    break;
                default:
                    break;
            }
            [times addObject:effectname];
        }
    }
    
    for (int i = 0; i < _trainPlaces.count; ++i) {
        if ([_trainPlaces[i] isEqualToString:@"1"]) {
            NSString *effectname;
            switch (i) {
                case 0:
                    effectname = @"home";
                    break;
                case 1:
                    effectname = @"office";
                    break;
                case 2:
                    effectname = @"gym";
                    break;
                case 3:
                    effectname = @"outside";
                    break;
                default:
                    break;
            }
            [places addObject:effectname];
        }
    }
    
    for (int i = 0; i < _bodyRegion.count; ++i) {
        if ([_bodyRegion[i] isEqualToString:@"1"]) {
            NSString *effectname;
            switch (i) {
                case 0:
                    effectname = @"neck";
                    break;
                case 1:
                    effectname = @"shouler";
                    break;
                case 2:
                    effectname = @"arm";
                    break;
                case 3:
                    effectname = @"back";
                    break;
                case 4:
                    effectname = @"chest";
                    break;
                case 5:
                    effectname = @"ventral";
                    break;
                case 6:
                    effectname = @"leg";
                    break;
                case 7:
                    effectname = @"hip";
                    break;
                case 8:
                    effectname = @"all";
                    break;
                default:
                    break;
            }
            [regions addObject:effectname];
        }
    }


    
    [dict setObject:effects forKey:@"effects"];
    [dict setObject:times forKey:@"times"];
    [dict setObject:places forKey:@"places"];
    [dict setObject:regions forKey:@"regions"];
    
    if([defaults objectForKey:@"uid"] != nil) {
        [dict setObject:[defaults objectForKey:@"uid"] forKey:@"uid"];
    }
    
    NSLog(@"%@", dict);
    
    NSString *urlString = [serverurl stringByAppendingString: @"/account/addinfo"];
    NSURL *url = [NSURL URLWithString:urlString];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer= [AFHTTPRequestSerializer new];

    [manager POST:url.absoluteString parameters:dict progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        DoraRootNavigationViewController *rootpage = [[DoraRootNavigationViewController alloc] init];
        [self presentViewController:rootpage animated:YES completion:^(void){}];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail results: %@", error);
    }];
}


@end
