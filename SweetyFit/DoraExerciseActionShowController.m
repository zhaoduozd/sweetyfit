//
//  DoraExerciseActionShowController.m
//  SweetyFit
//
//  Created by Dora Zhao on 26/3/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseActionShowController.h"
#import "DoraColorDefineHeader.h"
#import <SDWebImage/UIImage+GIF.h>
#import "NSString+MD5.h"

@interface DoraExerciseActionShowController ()
@property(nonatomic, strong) NSMutableArray<UIImage *> *loadinggif;
@end

@implementation DoraExerciseActionShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.view setBackgroundColor:AppDefaultBackgroundColor];
    [self SetUIElement];
    
}

- (void)SetUIElement {
    [self SetTitle];
    [self SetImageView];
    [self SetPoints];
}

- (void)SetTitle {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth-20, 30)];
    title.text = _pagetitle;
    title.font = [UIFont systemFontOfSize:16];
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];
}

- (void)SetImageView {
    
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
    self.imageview = [[UIImageView alloc] init];
    self.imageview.frame = CGRectMake(0, 30, DoraScreenWidth, DoraScreenWidth*0.618);
    [self.imageview setBackgroundColor:[UIColor whiteColor]];
    self.imageview.animationImages = _loadinggif;
    self.imageview.animationDuration = 4;
    [self.imageview startAnimating];
    [self.view addSubview:_imageview];
    
    [self ObtainGif];
}

- (void) ObtainGif {
    __weak DoraExerciseActionShowController *weakself = self;
    
    NSURL *url =[NSURL URLWithString:[resourceurl stringByAppendingString:[NSString stringWithFormat:@"/actiongif?name=%@.gif",_aid]]];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSString *urlstring = [NSString stringWithFormat:@"%@", url];
        return [documentsDirectoryURL URLByAppendingPathComponent:[urlstring MD5]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        [weakself DecomposeGif:filePath];
    }];
    [downloadTask resume];

}

- (void) DecomposeGif:(NSURL *) path {
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
    
    [_imageview stopAnimating];
    [_imageview setAnimationImages:gifimgs];
    [_imageview setAnimationDuration:_duration];
    [_imageview startAnimating];

}


- (void)SetPoints {
    DoraExercisePointView *points = [[DoraExercisePointView alloc] init];
    points.frame = CGRectMake(0, 30+DoraScreenWidth*0.618, DoraScreenWidth, 186);
    points.speechSwitch.hidden = YES;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_tips];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 15;
    NSRange range = NSMakeRange(0, [_tips length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    
    points.tips.attributedText = attributedString;
    points.tips.text = _tips;
    
    [self.view addSubview:points];

}

@end
