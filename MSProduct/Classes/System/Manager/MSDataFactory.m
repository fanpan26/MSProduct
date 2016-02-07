//
//  MSDataFactory.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSDataFactory.h"
#import "MSSystem.h"

//{"result":10000,"msg":"成功","data":""}
static NSString *const MSRequestSuccessResultCodeForResult = @"result";
static NSString *const MSRequestSuccessResultCodeForMsg = @"msg";
static NSString *const MSRequestSuccessResultCodeForData = @"data";

@implementation MSDataFactory

-(void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(MSRequestResultSuccessCallBack)success failure:(MSRequestResultFailureCallBack)failure
{
    NSString *platUrl = kMSSysURL;//平台url  gurucv、ruc等
    NSString *fullPath = [NSString stringWithFormat:@"%@%@%@",kMSBaseApiDomain,platUrl,url];
    
    MSHttpManager *manager = [MSHttpManager sharedMSHttpManager];
    NSLog(@"%@",manager);
    [manager getWithURL:fullPath params:params success:^(id JSON) {
        
        [self handleJSON:JSON success:success failure:failure];
        
    } failure:^(NSError *error) {
        
        NSLog(@"请求失败:%@",error);
        
    }];
}

-(void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(MSRequestResultSuccessCallBack)success failure:(MSRequestResultFailureCallBack)failure
{
    NSString *fullPath = [kMSBaseApiDomain stringByAppendingString:url];
    
    MSHttpManager *manager = [MSHttpManager sharedMSHttpManager];
    
    [manager postWithURL:fullPath params:params success:^(id JSON) {
        
        [self handleJSON:JSON success:success failure:failure];
        
    } failure:^(NSError *error) {
        
         NSLog(@"请求失败:%@",error);
        
    }];
}

/*private*/
-(void)handleJSON:(id) JSON success:(MSRequestResultSuccessCallBack)success failure:(MSRequestResultFailureCallBack)failure
{
    NSInteger result = [JSON[MSRequestSuccessResultCodeForResult] longLongValue];
    if (result == kMSApiCodeSuccess) {
        if (success) {
            NSDictionary *data = JSON[MSRequestSuccessResultCodeForData];
            success(data);
        }
    }else{
        if (failure) {
            NSString *msg = JSON[MSRequestSuccessResultCodeForMsg];
            failure(msg);
        }
    }

}
@end
