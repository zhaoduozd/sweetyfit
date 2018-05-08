//
//  DoraExerciseRecomViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 7/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseRecomViewController.h"
#import "DoraActionSettingView.h"
#import "DoraActionListSubView.h"
#import "DoraRateView.h"
#import "NSString+MD5.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DoraExerciseRecomViewController ()
@property(nonatomic, copy) NSString *uid;
@property(nonatomic, copy) NSString *feedback;
@property(nonatomic, strong) NSMutableDictionary *userdemands;

@property(nonatomic, strong) NSDictionary *exercisedata;
@property(nonatomic, strong) NSMutableArray<NSURL *> *giffilepath;
@property(nonatomic, strong) NSMutableArray<NSMutableArray<UIImage *> *> *gifgroups;

@property(nonatomic, strong) UIButton *playbtn;
@property(nonatomic, strong) UIView *startplaybtnwrapper;

@property(nonatomic, strong) NSMutableArray<NSTimer *> *giftimers;
@property(nonatomic, strong) NSMutableArray<UIView *> *exerciselistbtns;
@property(nonatomic, strong) NSMutableArray<NSTimer *> *gifgrouptimers;


@property(nonatomic, strong) UIButton *actionsettingbtn;
@property(nonatomic, strong) DoraActionSettingView *actionsettingview;


@property(nonatomic, strong) NSURL *urlholder;
@property(nonatomic, strong) NSMutableArray<UIImage *> *loadinggif;

@property(nonatomic, strong) NSString *exerciserecordfilepath;

@property(nonatomic, strong) NSTimer *grouptimer;

@property(nonatomic, strong) HKHealthStore *healthkitstore;

@property(nonatomic, strong) UIButton *actionratingbtn;
@property(nonatomic, strong) DoraRateView *actionratingview;
@end

@implementation DoraExerciseRecomViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateDataElement];
    [self CreateUIElements];
    [self ObtainData];
}

- (void) CreateDataElement {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _uid = [defaults objectForKey:@"uid"];
    _userdemands = [[NSMutableDictionary alloc] init];
    [_userdemands setObject:@"YES" forKey:@"default"];
    [_userdemands setObject:_uid forKey:@"uid"];

    
    NSString *subfilepath = [NSString stringWithFormat:@"%@exerciserecord.plist", _uid];
    _exerciserecordfilepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)lastObject]stringByAppendingPathComponent:subfilepath];
    
    
    _urlholder = [[NSURL alloc] initWithString:@"null"];
    
    _giftimers = [[NSMutableArray alloc] init];
    _gifgrouptimers = [[NSMutableArray alloc] init];
    
    NSFileManager *fielM = [NSFileManager defaultManager];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"loading" ofType:@"bundle"];
    NSArray *arrays = [fielM contentsOfDirectoryAtPath:path error:nil];
    _loadinggif = [NSMutableArray array];
    for (NSString *name in arrays) {
        UIImage *image = [UIImage imageNamed:[(@"loading.bundle") stringByAppendingPathComponent:name]];
        if (image) {
            [_loadinggif addObject:image];
        }
    }
}

- (void) CreateUIElements {
    UILabel *moduletitle = [UILabel DoraCreateTextBoldTitleName:@"推荐de运动"];
    UITapGestureRecognizer *singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(StopPlayGif)];
    
    self.gifplayer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, DoraScreenWidth, DoraScreenWidth*0.618)];
    self.gifplayer.animationImages = _loadinggif;
    self.gifplayer.animationDuration = 4;
    [self.gifplayer startAnimating];
    [self.gifplayer addGestureRecognizer:singletap];

    self.exerciselist = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 46+DoraScreenWidth*0.618, DoraScreenWidth, 70)];
    self.pointtips = [[DoraExercisePointView alloc] init];
    self.pointtips.frame = CGRectMake(0, 116+DoraScreenWidth*0.618, DoraScreenWidth, 186);
    
    self.actionsettingbtn = [[UIButton alloc] initWithFrame:CGRectMake(DoraScreenWidth - 35, 5, 30, 30)];
    self.actionsettingbtn.titleLabel.text = @"运动设置";
    [self.actionsettingbtn setBackgroundImage:[UIImage imageNamed:@"actionsetting.png"] forState:UIControlStateNormal];
    [self.actionsettingbtn addTarget:self action:@selector(ShowSettingView) forControlEvents:UIControlEventTouchUpInside];

    self.actionsettingview = [[DoraActionSettingView alloc] init];
    [self.actionsettingview.submitbtn addTarget:self action:@selector(ExerciseSetting) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.actionratingbtn = [[UIButton alloc] initWithFrame:CGRectMake(DoraScreenWidth - 80, 5, 30, 30)];
    self.actionratingbtn.titleLabel.text = @"运动评价";
    [self.actionratingbtn setBackgroundImage:[UIImage imageNamed:@"rating.png"] forState:UIControlStateNormal];
    [self.actionratingbtn addTarget:self action:@selector(ShowRateView) forControlEvents:UIControlEventTouchUpInside];
    self.actionratingview = [[DoraRateView alloc] init];
    [self.actionratingview.submitbtn addTarget:self action:@selector(ExerciseRating) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    _playbtn = [[UIButton alloc] initWithFrame:CGRectMake(DoraScreenWidth/2-24, DoraScreenWidth*0.618/2-24, 48, 48)];
    _playbtn.tag = 0;
    [_playbtn setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [_playbtn addTarget:self action:@selector(StartPlayGif:) forControlEvents:UIControlEventTouchUpInside];
    
    _startplaybtnwrapper = [[UIView alloc] initWithFrame:_gifplayer.frame];
    [_startplaybtnwrapper setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    [_startplaybtnwrapper addSubview:_playbtn];
    
    _startplaybtnwrapper.hidden = YES;
    _pointtips.speechSwitch.hidden = YES;
    
    /*  Add Elments  */
    [self.view addSubview:moduletitle];
    [self.view addSubview:_gifplayer];
    [self.view addSubview:_exerciselist];
    [self.view addSubview:_pointtips];
    [self.view addSubview:_startplaybtnwrapper];
    [self.view addSubview:_actionratingbtn];
    [self.view addSubview:_actionsettingbtn];
    [self.view addSubview:_actionsettingview];
    [self.view addSubview:_actionratingview];
    
    float titleHeight = 40;
    float exerciseY = 0;
    float exerciseH = titleHeight + DoraScreenWidth * 0.618 + 70 + 186;
    
    float exerciseDataY = exerciseY + exerciseH;
    float exerciseDataH = titleHeight + 200;
    _recomExerciseData = [[DoraExerciseDataViewController alloc] init];
    [self.view addSubview:_recomExerciseData.view];
    _recomExerciseData.view.frame = CGRectMake(0, exerciseDataY, DoraScreenWidth, exerciseDataH);

}



- (void) ObtainData {
    
    __weak DoraExerciseRecomViewController *weakself = self;
    
    NSString *urlstring = [serverurl stringByAppendingString:@"/recom/exercise"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:urlstring parameters:_userdemands progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        [weakself SolveData:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void) SolveData:(id) responsedata {
    _exercisedata = [[NSDictionary alloc] initWithDictionary:(NSDictionary *)responsedata];
    
    int exerciselen = [[_exercisedata objectForKey:@"len"] intValue];
    NSArray *actions = [[NSArray alloc] initWithArray:[_exercisedata objectForKey:@"actions"]];
    
    [self ShowActionListUI];
    [self RequestImgs:exerciselen Actions:actions];
}

- (void) ShowActionListUI {
    NSArray *actions = [_exercisedata objectForKey:@"actions"];
    NSUInteger actionnum = [actions count];
    
    /*   Set Exercise List   */
    float actionlistimgwidth = 80;
    float exerciseListHeight = _exerciselist.frame.size.height;
    float exerciseListContentWidth = 5.0 + (actionlistimgwidth + 5) * actionnum;
    _exerciselist.contentSize = CGSizeMake(exerciseListContentWidth, exerciseListHeight);
    
    for(UIView *subview in [_exerciselist subviews]) {
        [subview removeFromSuperview];
    }
    
    for (NSUInteger i = 0; i < actionnum; ++i) {
         //NSLog(@"for  %lu", actionnum);
        float x;
        if (i == 0) {
            x = 5;
        } else {
            x = (5 + actionlistimgwidth) * i + 5;
        }
        
        NSDictionary *action = [actions objectAtIndex:i];
        CGRect frame = CGRectMake(x, 0, actionlistimgwidth, 60);
        NSString *imgname = [action objectForKey:@"actionimg"];
        NSString *urlstring = [@"/action?name=" stringByAppendingString:imgname];
        urlstring = [resourceurl stringByAppendingString:urlstring];
        NSURL *url = [[NSURL alloc] initWithString:urlstring];
        
        DoraActionListSubView *view = [[DoraActionListSubView alloc] initWithFrame:frame];
        [view.layer setCornerRadius:3];
        [view.imageview sd_setImageWithURL:url];
        view.btn.tag = i;
        [view.btn addTarget:self action:@selector(StartPlayGif:) forControlEvents:UIControlEventTouchUpInside];
        
        view.btntitle.text = [action objectForKey:@"name"];
        
        [_exerciselist addSubview:view];
        [_exerciselistbtns addObject:view];
    }
}

- (void) RequestImgs:(int) actionnum Actions:(NSArray *) actions {
    _gifgroups = [[NSMutableArray alloc] init];
    _giffilepath = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < actionnum; ++i) {
        [_giffilepath addObject:_urlholder];
        [_gifgroups addObject:_loadinggif];
    }
    
    for (int i = 0; i < actionnum; ++i) {
        NSDictionary *tempdic = [actions objectAtIndex:i];
        NSString *gifurlstring =[@"/actiongif?name=" stringByAppendingString:[tempdic objectForKey:@"gifimg"]];
        gifurlstring = [resourceurl stringByAppendingString:gifurlstring];
        NSURL *gifurl = [[NSURL alloc] initWithString:gifurlstring];
        NSLog(@"***%@", gifurl);
        [self DownLoadGifWithURL:gifurl Position:i Actionnum:actionnum];
    }
}

- (void) DownLoadGifWithURL:(NSURL *) url Position:(int) pos Actionnum:(int) actionnum {
    
    __weak DoraExerciseRecomViewController *weakself = self;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSString *urlstring = [NSString stringWithFormat:@"%@", url];
        return [documentsDirectoryURL URLByAppendingPathComponent:[urlstring MD5]];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        [weakself SetUrlPath:filePath Pos:pos Actionnum:actionnum];
    }];
    [downloadTask resume];
}

- (void) SetUrlPath:(NSURL *) filePath Pos:(int) pos Actionnum:(int) actionnum{
    
    
    [_giffilepath setObject:filePath atIndexedSubscript:pos];
    
    NSURL *urlholder = [[NSURL alloc] initWithString:@"null"];
    for (int i = 0; i < actionnum; ++i) {
        if ([[_giffilepath objectAtIndex:i] isEqual:urlholder]) {
            return;
        }
    }
    
    for (NSUInteger i = 0; i < [_giffilepath count]; ++i) {
        NSMutableArray<UIImage *> *gifimgs = [self DecomposeGif:[_giffilepath objectAtIndex:i]];
        [_gifgroups setObject:gifimgs atIndexedSubscript:i];
    }
    
    NSString *tips = [[[_exercisedata objectForKey:@"actions"] objectAtIndex:0] objectForKey:@"tip"];
    [self SetTips:tips];
    [self InitialGifPlayer];
}

- (NSMutableArray<UIImage *> *) DecomposeGif:(NSURL *) path {
    NSMutableArray<UIImage *> *gifimgs = [[NSMutableArray alloc] init];
    NSData *data = [NSData dataWithContentsOfURL:path];
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    size_t count = CGImageSourceGetCount(source);
    
    for (size_t j = 0; j < count; j++)
    {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, j, NULL);
        UIImage * image = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        
        [gifimgs addObject:image];
        
        CGImageRelease(imageRef);
    }
    
    CFRelease(source);
    
    return gifimgs;
}

- (void) SetTips:(NSString *) tips {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:tips];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 15;
    NSRange range = NSMakeRange(0, [tips length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    _pointtips.tips.attributedText = attributedString;
    _pointtips.tips.text = tips;
}

- (void) InitialGifPlayer {
    _startplaybtnwrapper.hidden = NO;
    [_gifplayer stopAnimating];
    [_gifplayer setImage:[[_gifgroups objectAtIndex:0] objectAtIndex:0]];
    _gifplayer.userInteractionEnabled = YES;
}

- (void) StartPlayGif:(id) sender {
    UIButton *btn = (UIButton *)sender;
    int gifid = (int)btn.tag;
    
    
    int exerciselen = [[_exercisedata objectForKey:@"len"] intValue];
    NSArray *actions = [[NSArray alloc] initWithArray:[_exercisedata objectForKey:@"actions"]];
    
    __weak DoraExerciseRecomViewController *weakself = self;
    
    _startplaybtnwrapper.hidden = YES;
    
    float timeinterval = 0;
    
    for (int i = gifid; i < exerciselen; ++i) {
        float repeatcount = [[[actions objectAtIndex:i] objectForKey:@"group"] intValue];
        float duration = [[[actions objectAtIndex:i] objectForKey:@"time"] intValue];

        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:timeinterval
                                                         repeats:NO
                                                           block: ^void (NSTimer *timer){
                                                               _playbtn.tag = i;
                                                               [weakself PlayGifWithStartIndex:i RepeatCount:repeatcount Duration:duration];
                                                               [weakself RecordExerciseWith:i];
                                                           }];
        [_gifgrouptimers addObject:timer];
        
        timeinterval += (repeatcount * duration);
    }
}

- (void) PlayGifWithStartIndex:(int) gifid RepeatCount:(int) repeatcount Duration:(float) duration {
    // NSLog(@"%d", gifid);
//
    //__weak DoraExerciseRecomViewController *weakself = self;
    int exerciselen = [[_exercisedata objectForKey:@"len"] intValue];

    NSString *tips = [[[_exercisedata objectForKey:@"actions"] objectAtIndex:gifid] objectForKey:@"tip"];
    [self SetTips:tips];
    
    
    if ([[_gifgroups objectAtIndex:gifid] count] == 0) {
        return;
    }
    
    [_gifplayer setImage:[[_gifgroups objectAtIndex:gifid] objectAtIndex:0]];
    _gifplayer.animationImages = [_gifgroups objectAtIndex:gifid];
    _gifplayer.animationDuration = duration;
    _gifplayer.animationRepeatCount = 1;
    
    for (int i = 0; i < repeatcount; ++i){
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:i*duration repeats:NO block:^void (NSTimer *timer){
            [_gifplayer startAnimating];
        }];
        
        [_giftimers addObject:timer];
    }
    
    
    if (gifid == exerciselen - 1) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:repeatcount*duration repeats:NO block:^(NSTimer *timer){
            _playbtn.tag = 0;
            [_gifplayer stopAnimating];
            [_gifplayer setImage:[[_gifgroups objectAtIndex:0] objectAtIndex:0]];
            _startplaybtnwrapper.hidden = NO;
            _pointtips.tips.text = [[[_exercisedata objectForKey:@"actions"] objectAtIndex:0] objectForKey:@"tip"];
        }];
        
        [_giftimers addObject:timer];
    }
}

- (void) StopPlayGif {
    for (NSUInteger i = 0; i < _gifgrouptimers.count; ++i) {
        [[_gifgrouptimers objectAtIndex:i] invalidate];
    }
    
    for (NSUInteger i = 0; i < _giftimers.count; ++i) {
        [[_giftimers objectAtIndex:i] invalidate];
    }
    
    [_giftimers removeAllObjects];
    [_gifgrouptimers removeAllObjects];
    
    [_gifplayer stopAnimating];
    _startplaybtnwrapper.hidden = NO;

}






/* event responders */

- (void) ShowSettingView {
    [self.actionsettingview clearall];
    self.actionsettingview.hidden = NO;
}

- (void) ShowRateView {
    [self.actionratingview cleartime];
    self.actionratingview.hidden = NO;
}

- (void) ExerciseSetting {
    self.actionsettingview.hidden = YES;
    if ([[self.actionsettingview.demanddata objectForKey:@"place"] isEqualToString:@""]
        && [[self.actionsettingview.demanddata objectForKey:@"time"] isEqualToString:@""]
        &&[[self.actionsettingview.demanddata objectForKey:@"region"] isEqualToString:@""]
        ) {
        return;
    } else {
        NSString *place = [self.actionsettingview.demanddata objectForKey:@"place"];
        NSString *time = [self.actionsettingview.demanddata objectForKey:@"time"];
        NSString *region = [self.actionsettingview.demanddata objectForKey:@"region"];
        [_userdemands setObject:@"NO" forKey:@"default"];
        [_userdemands setObject:place forKey:@"place"];
        [_userdemands setObject:time forKey:@"time"];
        [_userdemands setObject:region forKey:@"region"];
        
        [self ObtainData];
        [self StopPlayGif];
        _startplaybtnwrapper.hidden = YES;
        _gifplayer.userInteractionEnabled = NO;
        [_gifplayer setAnimationImages:_loadinggif];
        [_gifplayer startAnimating];
        _gifgroups = [[NSMutableArray alloc] init];
        
        
    }
}

- (void) ExerciseRating {
    self.actionratingview.hidden = YES;
    if ([self.actionratingview.feedback isEqualToString:@""]) {
        return;
    } else {
        NSString *urlstring = [serverurl stringByAppendingString:[@"/feedback/exercise?" stringByAppendingString:_uid]];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        [manager GET:urlstring parameters:_userdemands progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
        }];
    }
}


/* exercise record */

- (void) RecordExerciseWith:(int) gifid {
    __weak DoraExerciseRecomViewController *weakself = self;
    
    /*   Modify Exercise Record   */
    NSDictionary *exerciserecord = [[NSDictionary alloc] initWithContentsOfFile:_exerciserecordfilepath];
    NSMutableDictionary *newexerciserecord = [[NSMutableDictionary alloc] init];
    NSString *timestamp = [exerciserecord objectForKey:@"timestamp"];
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|
    NSCalendarUnitDay;
    NSDateComponents *d = [calendar components:unitFlags fromDate:date];
    NSString *currenttimestamp = [NSString stringWithFormat:@"%ld*%ld*%ld",[d year], [d month], [d day]];
    double actionconsume = [[[[_exercisedata objectForKey:@"actions"] objectAtIndex:gifid] objectForKey:@"calorie"] doubleValue];
    
    if ([timestamp isEqualToString:currenttimestamp]) {
        double todayconsume = [[exerciserecord objectForKey:@"exerciseconsume"] doubleValue];
        todayconsume += actionconsume;
        
        NSLog(@"%f, %f", todayconsume, actionconsume);
        
        [newexerciserecord setValue:[NSNumber numberWithDouble:todayconsume] forKey:@"exerciseconsume"];
        [newexerciserecord setValue:currenttimestamp forKey:@"timestamp"];
        [newexerciserecord writeToFile:_exerciserecordfilepath atomically:YES];
        [self UpdateExercsieRecordUISport:todayconsume];
    } else {
        double yesconsume = [[exerciserecord objectForKey:@"exerciseconsume"] doubleValue];
        [self UpdateExercsieRecordUISport:actionconsume];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        NSString *suburl = [NSString stringWithFormat:@"/feedback/exerciserecord?u=%@&c=%f", _uid, yesconsume];
        
        [manager GET:[serverurl stringByAppendingString:suburl] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
            //NSLog(@"%@", responseObject);
            [weakself WriteExerciseRecordWithStamp:currenttimestamp Calorie:actionconsume];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
        }];
    }
}

- (void) WriteExerciseRecordWithStamp:(NSString *) timestamp Calorie:(double) actionconsume {
    NSMutableDictionary *newexerciserecord = [[NSMutableDictionary alloc] init];
    [newexerciserecord setValue:timestamp forKey:@"timestamp"];
    [newexerciserecord setValue:[NSNumber numberWithDouble:actionconsume] forKey:@"exerciseconsume"];
    [newexerciserecord writeToFile:_exerciserecordfilepath atomically:YES];
}




- (void) UpdateExercsieRecordUISport:(double) action{
    double total = [_recomExerciseData.walkingRunningCalorieData.text doubleValue];
    total += action;
    NSString *totals = [NSString stringWithFormat:@"%.1f", total];
    
    NSLog(@"%@", totals);
    _recomExerciseData.totalCalorieData.text = totals;
    _recomExerciseData.sportCalorieData.text = [NSString stringWithFormat:@"%.1f Kcal", action];
}




- (void) PausePlayGif {
    CALayer *layer = _gifplayer.layer;
    
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
    _startplaybtnwrapper.hidden = NO;
}

- (void) ResumePlayGif {
    CALayer *layer = _gifplayer.layer;
    
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
    
    _startplaybtnwrapper.hidden = YES;
}


@end
