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

@end

@implementation GifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://127.0.0.1:3000/staticResource/test.gif"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
        NSData *data = [NSData dataWithContentsOfURL:filePath];
        CGImageSourceRef sourec = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
        
        size_t count = CGImageSourceGetCount(sourec);
        
        NSLog(@"%lu", count);

    }];
    [downloadTask resume];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
