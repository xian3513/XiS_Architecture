//
//  GlobeModel.h
//  duobao
//
//  Created by kt on 15/3/18.
//  Copyright (c) 2015年 Duobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBOHeaderfile.m"
@interface GlobalModel : NSObject  {
    @private
     NSDictionary *lotteryDateData;
    NSDictionary *menuListDictionary;
    NSMutableDictionary *originalDictionary;
}
@property (nonatomic,assign) BOOL lotteryDateDataIsHave;
@property (nonatomic,assign) BOOL menuListDictionaryIsHave;
+ (GlobalModel *)share;
- (NSData *)getOriginalDataWithIdentifer:(NSString *)identifer;
- (NSDictionary *)getLotteryDateData;
- (NSDictionary *)getMenuDictionary;
- (NSString *)getMenuTitleWithLotteryId:(NSString *)lotteryId;


- (UIImage *)lotteryIconWithLotteryId:(NSUInteger)lotteryId;
@end

@interface GlobalModel () {
   
}
@end
