//
//  XISBaseViewController.m
//  MBO_Swift
//
//  Created by kt on 15/5/6.
//  Copyright (c) 2015年 kt. All rights reserved.
//

#import "XISBaseViewController.h"

@interface XISBaseViewController ()

@end

@implementation XISBaseViewController

- (void)XISDefaultSetting {
    toolBarheight = 44;
    defaultViewHeight = 44+44;
    statusBarAndNavBarHeight=20+44;
}

- (void)backgroundDataProcessingWithIdentifer:(NSString *)identifer process:(void (^)())process finish:(void (^)(BOOL, NSString *))finish{
    __block BOOL isFinish = NO;
    dispatch_queue_t network_queue;
    network_queue = dispatch_queue_create([identifer UTF8String], nil);
    dispatch_async(network_queue, ^{
        process();
        isFinish = YES;
        dispatch_async(dispatch_get_main_queue(), ^{
            finish(isFinish,[[NSString alloc] initWithCString:[identifer UTF8String] encoding:NSUTF8StringEncoding]);
        });
    });
}

- (id)init {
    if(self = [super init]) {
        [self XISDefaultSetting];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        [self XISDefaultSetting];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //nav -> barColor
    UIColor * color = [UIColor colorWithRed:112.0/255.0 green:168.0/255.0 blue:0/255.0 alpha:1];
    [self.navigationController.navigationBar setBarTintColor:color];
    //nav -> back
    color = [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:color];
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
