//
//  MSUserData.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSUserData.h"
#import "MSUserCard.h"
#import "MSListUser.h"
#import "MSDisplayUser.h"
#import "MSPeopleResult.h"

@implementation MSUserData

-(void)getUserInfo:(NSInteger)cvnumber success:(MSUserCardResult)success
{
    [[MSDataFactory sharedMSDataFactory] getWithURL:kMSApiURLGetUserInfo params:@{@"cvnumber":@(cvnumber)} success:^(id JSON) {
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

-(void)getListUser:(NSInteger)startCv cvnumber:(NSInteger)cvnumber success:(MSPeopleResultCallBack)success{
    [[MSDataFactory sharedMSDataFactory] getWithURL:kMSApiURLGetFigureList params:@{@"startcv":@(startCv),@"cvnumber":@(cvnumber)} success:^(id JSON) {
        
        MSPeopleResult *result = [[MSPeopleResult alloc] init];
        NSArray *listUser = [MSListUser listUsers:JSON[@"list"]];
        NSArray *displayUser = [MSDisplayUser displayUsers:JSON[@"view"]];
        result.listUsers = listUser;
        result.displayUsers = displayUser;
        if (success) {
            success(result);
        }
        
    } failure:^(id ERRMSG) {
        MSPeopleResult *result = [[MSPeopleResult alloc] init];
        result.hasdata = NO;
        if(success){
            success(result);
        }
    }];
}

-(void)getListThing:(NSInteger)startid type:(NSInteger)type cv:(NSInteger)cvnumber success:( MSPeopleResultCallBack)success
{
    [[MSDataFactory sharedMSDataFactory] getWithURL:kMSApiURLGetThingList params:@{@"startid":@(startid),@"type":@(type),@"cvnumber":@(cvnumber)} success:^(id JSON) {
        NSLog(@"%@",JSON);
    } failure:^(id ERRMSG) {
        
    }];
}

@end
