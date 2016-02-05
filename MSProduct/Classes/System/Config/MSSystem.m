//
//  MSSystem.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSSystem.h"
#import "UIColor+MS.h"

@implementation MSSystem

//获取系统颜色
+ (UIColor *)systemColorWith:(NSInteger)pid
{
    MSPlatFormModel *model = [MSSystem platInfo];
    return [UIColor colorWithHexString:model.color];
}

//是否第一次登陆，
+(void)userFirstLogin:(void (^)(BOOL))isFirst
{
    //去除版本号的key
    NSString *key = (NSString *)kCFBundleVersionKey;
    //从info.plist中取出版本号
    NSString *version = [NSBundle mainBundle].infoDictionary[key];
    NSString *saveVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    BOOL first = YES;
    if ([version isEqualToString:saveVersion]) {
        //已经更新过版本，说明不是第一次使用
        NSLog(@"不是第一次使用");
        first = NO;
    }else{
        //是第一次使用，需要把新版本号更新到沙盒里面去
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:key];
        //立即同步
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"是第一次使用");
        first = YES;
    }
    if (isFirst) {
        isFirst(first);
    }

}

//获取平台model
+(MSPlatFormModel *)platInfo
{
    MSPlatFormModel *plat = [[MSPlatFormModel alloc] init];
    plat.color = @"ff3030";
    plat.menuTitle = @"劳人记忆";
    plat.platid = 1;
    plat.platurl = @"gurucv";
    return plat;
}
@end
