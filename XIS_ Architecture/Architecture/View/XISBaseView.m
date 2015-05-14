//
//  MBOBaseView.m
//  duobao
//
//  Created by kt on 15/3/21.
//  Copyright (c) 2015年 Duobao. All rights reserved.
//

#import "XISBaseView.h"
#import <objc/runtime.h>
static char xisTapGesture;
static char xisTapGestureBlock;
@implementation XISBaseView

- (id)init {
    if(self = [super init]) {
     self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

//runtime添加点击手势
- (void)addTapGestureWithAction:(void (^)())action {
   UITapGestureRecognizer *tap = objc_getAssociatedObject(self, &xisTapGesture);
    if(!tap) {
        tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesturePress:)];
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap];
        objc_setAssociatedObject(self, &xisTapGesture, tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, &xisTapGestureBlock, action, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)tapGesturePress:(UITapGestureRecognizer *)tap {
    if(objc_getAssociatedObject(self, &xisTapGestureBlock)) {
        void (^action)() = objc_getAssociatedObject(self, &xisTapGestureBlock);
        action();
    }
}

@end
