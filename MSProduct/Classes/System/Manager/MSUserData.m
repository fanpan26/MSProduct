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
    [[[MSDataFactory alloc]init] getWithURL:kMSApiURLGetUserInfo params:@{@"cvnumber":@(cvnumber)} success:^(id JSON) {
        if (success) {
            
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


@end
