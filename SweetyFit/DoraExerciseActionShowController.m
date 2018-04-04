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
    self.imageview = [[UIImageView alloc] init];
    self.imageview.frame = CGRectMake(0, 30, DoraScreenWidth, DoraScreenWidth*0.618);
    [self.imageview setBackgroundColor:[UIColor whiteColor]];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"loading" ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@", path]];
    UIImage *image = [UIImage sd_animatedGIFWithData:data];
    
    NSLog(@"%@\n%@", path, data);
    self.imageview.image = image;
    
    [self.view addSubview:_imageview];
    
    [self ObtainGif];
    
}

- (void) ObtainGif {
    __weak DoraExerciseActionShowController *weakself = self;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://120.77.42.160:3000/resource/gifimg?gid=%@.gif", _aid]];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSString *urlstring = [NSString stringWithFormat:@"%@", url];
        return [documentsDirectoryURL URLByAppendingPathComponent:[urlstring MD5]];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        //[weakself loadGifWithImageView:filePath];
    }];
    [downloadTask resume];

}

- (void)loadGifWithImageView:(NSURL *) path {
    //NSLog(@"loading %@", path);
    NSData *data = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@", path]];
    UIImage *image = [UIImage sd_animatedGIFWithData:data];
    _imageview.image = image;
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
