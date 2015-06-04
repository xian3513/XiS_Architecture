//
//  XISConfig.m
//  XIS_ Architecture
//
//  Created by kt on 15/5/29.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import "XISArchitectureConfig.h"

@implementation XISArchitectureConfig
+(XISArchitectureConfig *)share {
    static dispatch_once_t predicate;
    static XISArchitectureConfig *singleton;
    dispatch_once(&predicate, ^{
        singleton = [[XISArchitectureConfig alloc] init];
        [singleton config];
    });
    return singleton;
}

- (void)config {
    self.xisArchitectureNavBarType = XISArchitectureNavbarSystem;
}

@end

