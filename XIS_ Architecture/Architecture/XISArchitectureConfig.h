//
//  XISConfig.h
//  XIS_ Architecture
//
//  Created by kt on 15/5/29.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    XISArchitectureNavbarSystem = 0,
    XISArchitectureNavbarCustom
}XISArchitectureNavbarType;
@interface XISArchitectureConfig : NSObject
@property (nonatomic)XISArchitectureNavbarType xisArchitectureNavBarType;
+ (XISArchitectureConfig *)share;
@end
