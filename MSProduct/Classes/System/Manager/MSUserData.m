//
//  MSUserData.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSUserData.h"
#import "MSUserCard.h"

@implementation MSUserData

-(void)getUserInfo:(NSInteger)cvnumber success:(MSUserCardResult)success
{
    [MSUserData getWithURL:kMSApiURLGetUserInfo params:@{@"cvnumber":@(cvnumber)} success:^(id JSON) {
        if (success) {
           // dispatch_queue_t handleDataQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
           // dispatch_async(handleDataQueue, ^{
                
           //  dispatch_async(dispatch_get_main_queue(), ^{
            
                //});
                
            //});
            
            NSDictionary *dict = JSON[@"info"][0];
            MSUserCard *result = [[MSUserCard alloc] initWithDictionary:dict];
            success(result);
           
        }
    } failure:^(id ERRMSG) {
        if (success) {
            success(nil);
        }
    }];
}

+(instancetype)sharedData
{
    static MSUserData *instance;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MSUserData alloc] init];
    });
    return instance;
}

@end
