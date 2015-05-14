//
//  XISMiddleViewController.m
//  MBO_Swift
//
//  Created by kt on 15/5/6.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import "XISMiddleViewController.h"
#import "HTTPRequest.h"
@interface XISMiddleViewController ()

@end

@implementation XISMiddleViewController {
    HTTPRequest *httpRequest;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self httpRequestResult];
}

- (void)httpRequestResult {
    __block XISMiddleViewController *myself = self;
    httpRequest.httpSuccess = ^(NSData *data,NSString *identifer){
        [myself XISHTTPSuccessWithData:data identifer:identifer];
    };
    
    httpRequest.httpFail = ^(NSInteger statusCode,NSString *identifer){
        [myself XISHTTPFailWithStatusCode:statusCode identifer:identifer];
    };
}

- (void)XISHTTPRequest:(XISBaseModel *)model identifer:(NSString *)identifer {
    httpRequest = [[HTTPRequest alloc]init];
    [httpRequest HTTPWithModel:model Identifer:identifer];
}

- (void)XISHTTPSuccessWithData:(NSData *)data identifer:(NSString *)identifer {

}

- (void)XISHTTPFailWithStatusCode:(NSInteger)statusCode identifer:(NSString *)identifer {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
