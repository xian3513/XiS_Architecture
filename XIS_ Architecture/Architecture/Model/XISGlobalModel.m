//
//  GlobeModel.m
//  duobao
//
//  Created by kt on 15/3/18.
//  Copyright (c) 2015年 Duobao. All rights reserved.
//

#import "XISGlobalModel.h"



@implementation XISGlobalModel {
    
}

+ (XISGlobalModel *)share {
    static dispatch_once_t predicate;
    static XISGlobalModel *singleton;
    dispatch_once(&predicate, ^{
        singleton = [[XISGlobalModel alloc] init];
    });
    return singleton;
}

@end
