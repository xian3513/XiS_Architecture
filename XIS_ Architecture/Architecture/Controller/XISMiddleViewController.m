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
    Reachability *XISReachability;
    NetworkStatus XISNetworkStatus;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self httpRequestResult];
}

#pragma http

- (void)XISHTTPRequest:(XISBaseModel *)model identifer:(NSString *)identifer {
    
    //如果开启XISreachability，在做网络请求之前就要判断当前是否有网络
    BOOL haveNetwork = (XISReachability==nil?YES:(XISNetworkStatus != NotReachable?YES:NO));
    if(haveNetwork) {
        httpRequest = [[HTTPRequest alloc]init];
        [httpRequest HTTPWithModel:model Identifer:identifer];
    }
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

- (void)XISHTTPSuccessWithData:(NSData *)data identifer:(NSString *)identifer {
    
}

- (void)XISHTTPFailWithStatusCode:(NSInteger)statusCode identifer:(NSString *)identifer {
    
}

#pragma reachability

- (void)openReachability {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    if(!XISReachability) {
        XISReachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    }
    [XISReachability startNotifier];
}

- (void)closeReachability {
    [XISReachability stopNotifier];
    XISReachability = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
  
}

- (void)reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

- (void)updateInterfaceWithReachability:(Reachability *)reachability {
    if(reachability == XISReachability) {
        NetworkStatus netStatus = [reachability currentReachabilityStatus];
        switch (netStatus) {
            case NotReachable: {
                [self XISViewControllerNotReachable];
                break;
            }
            case ReachableViaWiFi: {
                [self XISViewControllerReachableViaWiFi];
                break;
            }
            case ReachableViaWWAN: {
                [self XISViewControllerReachableViaWWAN];
                break;
            }
        }
    }
}

- (void)XISViewControllerNotReachable {
    XISNetworkStatus = NotReachable;
    [ShowAlertView showToastViewWithText:@"网络连接中断,请检查网络"];
    NSLog(@"网络连接中断,请检查网络");
}

- (void)XISViewControllerReachableViaWiFi {
    XISNetworkStatus = ReachableViaWiFi;
    //  [ShowAlertView showToastViewWithText:@"当前网络状态为:WIFI"];
    NSLog(@"当前网络状态为:WIFI");
}

- (void)XISViewControllerReachableViaWWAN {
    XISNetworkStatus = ReachableViaWWAN;
    //[ShowAlertView showToastViewWithText:@"当前网络状态为:蜂窝数据"];
    NSLog(@"当前网络状态为:蜂窝数据");
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
