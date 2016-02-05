//
//  MSSystem.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MSPlatFormModel.h"


#define kMSSysTitle [MSSystem platInfo].menuTitle
#define kMSSysURL [MSSystem platInfo].platurl;

@class MSPlatFormModel;
@interface MSSystem : NSObject

//获取系统Color
+(UIColor *)systemColorWith:(NSInteger)pid;

//获取系统平台基本信息
+(MSPlatFormModel *)platInfo;

//获取系统是否是第一次登陆 isFirst 是第一次的回调  notFirst  非第一次的回调
+(void) userFirstLogin:(void(^)(BOOL isfirst))isFirst;

@end
