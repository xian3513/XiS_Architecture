//
//  MBOHeaderfile.m
//
//  Created by kt on 15/3/19.
//  Copyright (c) 2015年. All rights reserved.
//

//#ifdef DEBUG
//# define DLog(format, ...) NSLog((@"[文件名:%s]" "[函数名:%s]" "[行号:%d]" format), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
//#else
//# define DLog(...);
//#endif

//#import "NSString+Extension.h"

#import <UIKit/UIKit.h>

#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\n[function:%s line:%d] %s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height
#define tabBarheight 48
#define MBOBackgroundColor [UIColor colorWithRed:112.0/255.0 green:168.0/255.0 blue:0/255.0 alpha:1]