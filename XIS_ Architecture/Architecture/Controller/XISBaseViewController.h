//
//  XISBaseViewController.h
//  MBO_Swift
//
//  Created by kt on 15/5/6.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XISHeaderfile.h"
#import "XISArchitectureConfig.h"
@interface XISBaseViewController : UIViewController{
    CGFloat toolBarheight;
    CGFloat defaultViewHeight;
    CGFloat statusBarAndNavBarHeight;
}

//一些比较耗时的操作可以放在该方法里处理，不堵塞主线程
- (void)backgroundDataProcessingWithIdentifer:(NSString *)identifer process:(void(^)())process finish:(void(^)(BOOL isFinish,NSString *identifer))finish;

@end
