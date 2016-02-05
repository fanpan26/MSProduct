//
//  MSHttpManager.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求成功回调
typedef void(^MSRequestSuccessCallBack)(id JSON);
//请求失败回调
typedef void(^MSRequestFailureCallBack)(NSError *error);
//请求结果 result = 10000 回调
typedef void(^MSRequestResultSuccessCallBack)(id JSON);
//请求结果 result > 10000 回调（非正常结果，服务器错误或者其他）
typedef void(^MSRequestResultFailureCallBack)(id ERRMSG);

@interface MSHttpManager : NSObject

//单例
+(instancetype)manager;
/*
    get方法请求数据
    url：接口路径
    params:参数，字典类型
    success:成功回调
    failure:失败回调
 */
-(void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(MSRequestSuccessCallBack)success failure:(MSRequestFailureCallBack)failure;
/*
 post方法请求数据
 url：接口路径
 params:参数，字典类型
 success:成功回调
 failure:失败回调
 */
-(void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(MSRequestSuccessCallBack)success failure:(MSRequestFailureCallBack)failure;
@end
