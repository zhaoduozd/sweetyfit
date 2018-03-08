//
//  DoraExerciseRecomViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 7/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseRecomViewController.h"

@interface DoraExerciseRecomViewController ()
@property(nonatomic, strong) NSDictionary *exercisedata;
@property(nonatomic, strong) NSMutableArray<NSURL *> *giffilepath;
@property(nonatomic, strong) NSMutableArray<NSMutableArray<UIImage *> *> *gifgroups;
@property(nonatomic, copy) NSString *urlroot;
@property(nonatomic, strong) UIView *startplaybtnwrapper;
@property(nonatomic, strong) NSMutableArray<UIButton *> *exerciselistbtns;
@end

@implementation DoraExerciseRecomViewController {
    int playindex;
    int isgifpause;
    int hasgif;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _urlroot = @"http://127.0.0.1:3000/";
    
    [self CreateAndAddElements];
    [self ObtainData];
    
}

- (void) CreateAndAddElements {
    
    /*  Create Elments  */
    UILabel *moduletitle = [UILabel DoraCreateTextBoldTitleName:@"推荐de运动"];
    
    self.gifplayer = [[UIImageView alloc] init];
    [self.gifplayer setBackgroundColor:[UIColor grayColor]];
    self.gifplayer.frame = CGRectMake(0, 46, DoraScreenWidth, DoraScreenWidth*0.618);
    self.exerciselist = [[UIScrollView alloc] init];
    self.exerciselist.frame = CGRectMake(0, 46+DoraScreenWidth*0.618, DoraScreenWidth, 70);
    self.pointtips = [[DoraExercisePointView alloc] init];
    self.pointtips.frame = CGRectMake(0, 116+DoraScreenWidth*0.618, DoraScreenWidth, 186);
    
    self.gifgroups = [[NSMutableArray alloc] init];
    
    
    /*  Add Elments  */
    [self.view addSubview:moduletitle];
    [self.view addSubview:_gifplayer];
    [self.view addSubview:_exerciselist];
    [self.view addSubview:_pointtips];

}

- (void) ObtainData {
    
    __weak DoraExerciseRecomViewController *weakself = self;
    
    
    /*   Assign URL   */
    NSString *urlstring = [_urlroot stringByAppendingString:@"recom/exercise"];
    
    /*   Create Session Manager   */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    /*   Create Connection   */
    [manager POST:urlstring parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        
        [weakself SolveData:responseObject];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void) SolveData:(id) responsedata {
    _exercisedata = [[NSDictionary alloc] initWithDictionary:(NSDictionary *)responsedata];
    
    int exerciselen = [[_exercisedata objectForKey:@"len"] intValue];
    NSArray *actions = [[NSArray alloc] initWithArray:[_exercisedata objectForKey:@"actions"]];
    
    [self RequestImgs:exerciselen Actions:actions];
}

- (void) RequestImgs:(int) actionnum Actions:(NSArray *) actions {
    _giffilepath = [[NSMutableArray alloc] init];
    
    NSURL *urlholder = [[NSURL alloc] initWithString:@"null"];
    
    for (int i = 0; i < actionnum; ++i) {
        [_giffilepath addObject:urlholder];
    }
    
    for (int i = 0; i < actionnum; ++i) {
        NSDictionary *tempdic = [actions objectAtIndex:i];
        NSString *gifurlstring = [tempdic objectForKey:@"gifurl"];
        NSURL *gifurl = [[NSURL alloc] initWithString:gifurlstring];
        
        [self DownLoadGifWithURL:gifurl Position:i Actionnum:actionnum];
    }
}

- (void) DownLoadGifWithURL:(NSURL *) url Position:(int) pos Actionnum:(int) actionnum {
    
    __weak DoraExerciseRecomViewController *weakself = self;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
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
    
    [self DecomposeGif:actionnum];
}

- (void) DecomposeGif:(int) actionnum {
    for (int i = 0; i < actionnum; ++i) {
        NSMutableArray<UIImage *> *gifimgs = [[NSMutableArray alloc] init];
        
        NSData *data = [NSData dataWithContentsOfURL:[_giffilepath objectAtIndex:i]];
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
        
        [_gifgroups addObject:gifimgs];
    }
    
    [self ShowGifUI:actionnum];
}

- (void) ShowGifUI:(int) actionnum {
    NSArray *actions = [_exercisedata objectForKey:@"actions"];
    
    /*   Set Gif Player   */
    [self InitialGifPlayer];
    
    /*   Set Exercise List   */
    float actionlistimgwidth = 80;
    float actionlistimgnum = actionnum;
    float exerciseListHeight = _exerciselist.frame.size.height;
    float exerciseListContentWidth = 5 + (actionlistimgwidth + 5) * actionlistimgnum;
   
    _exerciselist.contentSize = CGSizeMake(exerciseListContentWidth, exerciseListHeight);

    for (int i = 0; i < actionnum; ++i) {
        UIButton *btn = [UIButton DoraCreateBlackMaskButtonWithWidth:actionlistimgwidth Height:60 borderRaduis:4 titleText:[[actions objectAtIndex:i] objectForKey:@"actionname"] imageBackground:[[_gifgroups objectAtIndex:i] objectAtIndex:0]];
        float x;
        
        if (i == 0) {
            x = 5;
        } else {
            x = (5 + actionlistimgwidth) * i + 5;
        }
    
        CGRect tempframe = btn.frame;
        tempframe.origin = CGPointMake(x, 5);
        btn.frame = tempframe;
        btn.tag = i;
        
        [btn addTarget:self action:@selector(StartPlayGif:) forControlEvents:UIControlEventTouchUpInside];
    
        [_exerciselist addSubview:btn];
        [_exerciselistbtns addObject:btn];
    }
    
    /*   Set Tips   */
    NSString *tips = [[[_exercisedata objectForKey:@"actions"] objectAtIndex:0] objectForKey:@"actiontips"];
    _pointtips.tips.text = tips;
}

- (void) InitialGifPlayer {
    
    playindex = 0;
    isgifpause = 0;
    hasgif = 0;
    
    /*   Bind Event For gifplayer   */
    UITapGestureRecognizer *singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PausePlayGif)];
    
    _gifplayer.userInteractionEnabled = YES;
    [_gifplayer addGestureRecognizer:singletap];
    
    /*   Intial The First Image   */
    [_gifplayer setImage:[[_gifgroups objectAtIndex:0] objectAtIndex:0]];
    
    
    /*   Set Start Btn   */
    _startplaybtnwrapper = [[UIView alloc] initWithFrame:_gifplayer.frame];
    
    UIButton *startplaybtn = [[UIButton alloc] initWithFrame:CGRectMake(DoraScreenWidth/2-24, DoraScreenWidth*0.618/2-24, 48, 48)];
    
    startplaybtn.tag = playindex;
    [startplaybtn setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [startplaybtn addTarget:self action:@selector(PlayGif:) forControlEvents:UIControlEventTouchUpInside];
    [_startplaybtnwrapper setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    
    [_startplaybtnwrapper addSubview:startplaybtn];
    [self.view addSubview:_startplaybtnwrapper];
}

- (void) PlayGif:(id) sender {
    
    if (hasgif == 0) {
        [self StartPlayGif:sender];
        hasgif = 1;
    } else {
        [self ResumePlayGif];
    }
}

- (void) StartPlayGif:(id) sender {
    UIButton *btn = (UIButton *)sender;
    int gifid = (int)btn.tag;
    
    playindex = gifid;
    [_gifplayer setImage:[[_gifgroups objectAtIndex:gifid] objectAtIndex:0]];
    
    NSNumber *durationnum = [[[_exercisedata objectForKey:@"actions"] objectAtIndex:gifid] objectForKey:@"actionduration"];
    NSTimeInterval duration = [durationnum intValue];
    
    NSNumber *repeatnum = [[[_exercisedata objectForKey:@"actions"] objectAtIndex:gifid] objectForKey:@"actionrepeat"];
    
    NSString *tips = [[[_exercisedata objectForKey:@"actions"] objectAtIndex:gifid] objectForKey:@"actiontips"];
    
    _gifplayer.animationImages = [_gifgroups objectAtIndex:gifid];
    _gifplayer.animationDuration = duration;
    _gifplayer.animationRepeatCount = [repeatnum intValue];
    
    _pointtips.tips.text = tips;
    [_gifplayer startAnimating];
    
    NSLog(@"%d", gifid);
    
    _startplaybtnwrapper.hidden = YES;
}

- (void) PausePlayGif {
    CALayer *layer = _gifplayer.layer;
    
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
    
    isgifpause = 1;
    
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
    
    isgifpause = 0;
    
    _startplaybtnwrapper.hidden = YES;
}

@end









