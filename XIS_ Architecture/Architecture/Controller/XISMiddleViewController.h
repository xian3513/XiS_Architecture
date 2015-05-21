//
//  XISMiddleViewController.h
//  MBO_Swift
//
//  Created by kt on 15/5/6.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import "XISBaseViewController.h"
#import "XISBaseModel.h"
#import "Reachability.h"
@interface XISMiddleViewController : XISBaseViewController


/**
 *网络监测
 */

- (void)openReachability;
- (void)closeReachability;

/**
 @http
 */

- (void)XISHTTPRequest:(XISBaseModel *)model identifer:(NSString *)identifer;

/**
 @http回调函数
 */
- (void)XISHTTPSuccessWithData:(NSData *)data identifer:(NSString *)identifer;
- (void)XISHTTPFailWithStatusCode:(NSInteger )statusCode identifer:(NSString *)identifer;

@end
