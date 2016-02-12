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
#import "MSListThing.h"
#import "MSThingResult.h"
#import "MSAbout.h"
#import "MSAboutResult.h"

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
        result.errmsg = ERRMSG;
        if(success){
            success(result);
        }
    }];
}

-(void)getListThing:(NSInteger)startid type:(NSInteger)type cv:(NSInteger)cvnumber success:( MSThingResultCallBack)success
{
    [[MSDataFactory sharedMSDataFactory] getWithURL:kMSApiURLGetThingList params:@{@"startid":@(startid),@"type":@(type),@"cvnumber":@(cvnumber)} success:^(id JSON) {
        NSArray *thingArray = JSON[@"list"];
        MSThingResult *result = [[MSThingResult alloc] init];
        result.listThings =[NSArray arrayWithArray: [MSListThing listThings:thingArray]];
        if (success) {
            success(result);
        }
    } failure:^(id ERRMSG) {
        MSThingResult *result = [[MSThingResult alloc] init];
        result.hasdata = NO;
        result.errmsg = ERRMSG;
        if(success) {
            success(result);
        }
    }];
}

-(void)getListAbout:(MSAboutResultCallback)success
{
     MSAboutResult *result = [[MSAboutResult alloc] init];
    [[MSDataFactory sharedMSDataFactory] getStringWithURL:kMSApiURLGetAboutList params:nil success:^(id JSON) {
        NSMutableArray *arrayM = [NSMutableArray array];
        MSAbout *pwd = [[MSAbout alloc] init];
        pwd.title = @"修改密码";
        MSAbout *advice = [[MSAbout alloc] init];
        advice.title = @"反馈意见";
        [arrayM addObject:pwd];
        [arrayM addObject:advice];
        [arrayM addObjectsFromArray:[MSAbout abouts:JSON]];
        result.abouts = arrayM;
        
        if (success) {
            success(result);
        }
    } failure:^(id ERRMSG) {
        result.hasdata = NO;
        if (success) {
            success(result);
        }
    }];
}

@end
