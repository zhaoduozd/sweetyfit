//
//  DoraSigninInfoViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 26/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

//  关于各项问题的回答答案与编号有如下对应

/** 性别：男---0，女---1
    职业：
         0---在校学生
         1---专业人员（如医生/律师/程序员／文体/记者/老师等）
         2---政府/机关干部/公务员
         3---普通职员（办公室/写字楼工作人员）
         4---商业服务业职工（如销售人员/商店职员/服务员等）
         5---自由职业者
         6---退休
    繁忙程度：（平均）
         0---每天工作12小时以上
         1---每天工作10～12小时
         2---每天工作8～10小时
         3---每天工作8小时以下
    训练目的：(选择为1，默认为0，以下编号为在数组中的位置)
         0---喜爱运动
         1---保持健康
         2---减脂瘦身
         3---增肌强健
         4---局部塑形
         5---塑形紧致
    身体脆弱部位（如曾受过伤的部位）:
         颈部，手臂，手腕，腿部，腰部，肩部，脚踝
        （受伤为1，否则为0）
    您认为的倾向的运动时间：（选择为1， 默认为0，以下编号为在数组中的位置）
         0---6~9点
         1---10~13点
         2---14~16点
         3---17~20点
         4---21点以后
 **/

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
    [_wrapper setContentSize:CGSizeMake(DoraScreenWidth, 1000)];
    
    UILabel *notice = [[UILabel alloc] init];
    notice.text = @"为更准确得推荐运动和饮食，请您配合补充以下信息！";
    notice.font = [UIFont systemFontOfSize:14];
    notice.textColor = AppDefaultColor;
    notice.textAlignment = NSTextAlignmentCenter;
    notice.frame = CGRectMake(0, 8, DoraScreenWidth, 30);
    
    [_wrapper addSubview:notice];
    
    y = 45;
    titleHeight = 40;
    buttounNum = (DoraScreenWidth - 20) / 86;
    seperatew = (DoraScreenWidth - 20 - 86 * buttounNum) / buttounNum;
    
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

- (void) addQuestions {
    NSArray *genderText = @[@"优雅女神", @"绅士男神"];
    NSArray *howBusyText = @[@"12小时以上", @"10～12小时", @"8～10小时", @"8小时以下"];
    NSArray *trainAimText = @[@"喜爱运动", @"保持健康", @"减脂瘦身", @"增肌强健", @"局部塑形", @"塑形紧致"];
    NSArray *trainTimeText = @[@"6～9点", @"10～13点", @"14～17点", @"18～20点", @"21点以后"];
    NSArray *bodyRegionText = @[@"颈部", @"肩部", @"手臂", @"腰部", @"腿部", @"膝盖", @"脚踝"];
    NSArray *trainPlaceText = @[@"办公室", @"公园", @"家", @"健身房", @"其他"];
    
    [self addQuestionWithQuestion:@"您是一位：" Options:genderText Tag:@"gender"];
    [self addQuestionWithQuestion:@"您每天的平均工作强度：" Options:howBusyText Tag:@"howbusy"];
    [self addQuestionWithQuestion:@"您的训练目的" Options:trainAimText Tag:@"trainaim"];
    [self addQuestionWithQuestion:@"您倾向的训练时间：" Options:trainTimeText Tag:@"traintime"];
    [self addQuestionWithQuestion:@"您倾向的训练场地：" Options:trainPlaceText Tag:@"trainplace"];
    [self addQuestionWithQuestion:@"您身体脆弱部位（如曾受过伤的部位）：" Options:bodyRegionText Tag:@"bodyregion"];

}

- (void) addQuestionWithQuestion:(NSString *) question Options:(NSArray *) options Tag:(NSString *) tag{
    
    NSInteger len = options.count;
    NSInteger rown = len / buttounNum;
    if (len % buttounNum > 0) {
        ++rown;
    }
    float viewHeight = rown * 36 + 40;
    
    UIView *view = [UIView DoraCreateQuestionViewWithHeight:viewHeight Y:y Title:question];
    y = y + viewHeight + 10;
    
    for (int i = 0; i < len; ++i) {
        UIButton *btn = [UIButton DoraCreateGetInfoPureColorButtonWithX:10 + (seperatew + 86)*(i%buttounNum) Y:40 + (i/buttounNum)*(36) Text:options[i]];
        btn.tag = tag;
        [view addSubview:btn];
    }
    
    [_wrapper addSubview:view];
}

- (void) addBodyInfos {
    UIView *bodyView = [UIView DoraCreateQuestionViewWithHeight:50 * 3 + 10 Y:y Title:@""];
    
    y = y + 160;
    
    UILabel *bodyHeightLabel = [UILabel DoraCreateTextTitleName:@"身高(cm)"];
    UILabel *bodyWeightLabel = [UILabel DoraCreateTextTitleName:@"体重(kg)"];
    UILabel *chestLabel = [UILabel DoraCreateTextTitleName:@"胸围(cm)"];
    UILabel *waistlineLabel = [UILabel DoraCreateTextTitleName:@"腰围(cm)"];
    UILabel *hiplineLabel = [UILabel DoraCreateTextTitleName:@"臀围(cm)"];
    
    float textfieldw = 70;
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
    tempframe.origin = CGPointMake(78, 10);
    _bodyHeight.frame = tempframe;

    tempframe = _bodyWeight.frame;
    tempframe.origin = CGPointMake(rightx + 68, 10);
    _bodyWeight.frame = tempframe;

    tempframe = _chestline.frame;
    tempframe.origin = CGPointMake(78, 60);
    _chestline.frame = tempframe;

    tempframe = _waistline.frame;
    tempframe.origin = CGPointMake(rightx + 68, 60);
    _waistline.frame = tempframe;

    tempframe = _hipline.frame;
    tempframe.origin = CGPointMake(78, 110);
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

- (void) Submit:(id) sender {
    NSMutableDictionary *dict;
    [dict setObject:_bodyHeight.text forKey:@"bodyHeight"];
    [dict setObject:_bodyWeight.text forKey:@"bodyWeight"];
    [dict setObject:_chestline.text forKey:@"chestline"];
    [dict setObject:_waistline.text forKey:@"waistline"];
    [dict setObject:_hipline.text forKey:@"hipline"];
    [dict setObject:_gender forKey:@"gender"];
    [dict setObject:_trainAims forKey:@"trainaims"];
    [dict setObject:_trainTimes forKey:@"traintimes"];
    [dict setObject:_trainPlaces forKey:@"trainplaces"];
    [dict setObject:_bodyRegion forKey:@"bodyRegion"];
    [dict setObject:_howBusy forKey:@"howbusy"];
    
    
    DoraRootNavigationViewController *rootpage = [[DoraRootNavigationViewController alloc] init];
    [self presentViewController:rootpage animated:YES completion:^(void){}];

}

@end
