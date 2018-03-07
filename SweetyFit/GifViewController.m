//
//  GifViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 28/2/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "GifViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface GifViewController ()
@property(nonatomic, strong) NSMutableArray<UIImage *> *tmpArr;
@end

@implementation GifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageview = [[UIImageView alloc] init];
    self.imageview.frame = CGRectMake(10, 30, 300, 400);
    
    [self.view addSubview:_imageview];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //[self.imageview setBackgroundColor:[UIColor redColor]];
    
    __weak GifViewController *weakself = self;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://s1.dwstatic.com/group1/M00/27/F2/816ff90306cecd113f0fd6e54acd2330.gif"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
        
        NSData *data = [NSData dataWithContentsOfURL:filePath];
        CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
        
        size_t count = CGImageSourceGetCount(source);
        
        self.tmpArr = [[NSMutableArray alloc]init];
        
        for (size_t i = 0; i < count; i++)
        {
            CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, i, NULL);
            
            //3.将单帧图片转化为UIimage
            UIImage * image = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
            
            [self.tmpArr addObject:image];
            
            //释放imageRef
            CGImageRelease(imageRef);
        }
        //释放sourec
        CFRelease(source);
        
        NSLog(@"%@", self.tmpArr);
        NSLog(@"%lu", count);
        
        
        weakself.imageview.animationImages = self.tmpArr;
        weakself.imageview.animationDuration = 5;     //执行一次完整动画所需的时长
        weakself.imageview.animationRepeatCount = 0;
        
        [weakself.imageview startAnimating];

    }];
    [downloadTask resume];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
