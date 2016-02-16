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
#import "MSTableConfig.h"

@implementation MSUserData

-(void)getUserInfo:(NSInteger)cvnumber success:(MSUserCardResult)success
{
    //从本地数据集库读取信息
    MSBaseUser *base = [MSBaseUser findByPK:[NSString stringWithFormat:@"%ld",cvnumber]];
    MSUserCard *user = [MSUserCard findByPK: [NSString stringWithFormat:@"%ld",cvnumber]];
    if (user != nil && base != nil) {
        user.headphoto = base.headphoto;
        user.cvnumber = base.cvnumber;
        user.name = base.name;
        if (success) {
            success(user);
        }
        return;
    }
    //否则从网络读取
    [[MSDataFactory sharedMSDataFactory] getWithURL:kMSApiURLGetUserInfo params:@{@"cvnumber":@(cvnumber)} success:^(id JSON) {
        if (success) {
            
            NSDictionary *dict = JSON[@"info"][0];
            MSUserCard *result = [[MSUserCard alloc] initWithDictionary:dict];
            //
            MSBaseUser *baseUser = [[MSBaseUser alloc] init];
            baseUser.cvnumber = result.cvnumber;
            baseUser.headphoto = result.headphoto;
            baseUser.name = result.name;
            [baseUser save];
            [result save];
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

#pragma mark 从本地数据库读取的部分操作

//-(BOOL)addUserCardToDB:(MSUserCard *)userCard
//{
//    NSString *sql = [NSString stringWithFormat:@"insert into MS_UserInfo (cvnumber,name,headphotos,company,email,mobile,position,landline,weixin,address,ability,achieve,identitytitle,hidemobile) values (%ld,'%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@',%d)",userCard.cvnumber,userCard.name,userCard.headphoto,userCard.company,userCard.email,userCard.mobile,userCard.position,userCard.landline,userCard.weixin,userCard.address,userCard.ability,userCard.achieve,userCard.identitytitle,(userCard.hidemobile == YES ? 1 : 0)];
//    return  [[MSDataBase sharedMSDataBase] excuteSQL:sql];
//}
//
//-(MSUserCard *)readUserFromDB:(NSInteger)cvnumber
//{
//    NSString *querySQL =[NSString stringWithFormat:@"SELECT * FROM %@ WHERE cvnumber=%ld",kMSTableNameUserInfo,cvnumber];
//    FMResultSet *result = [[MSDataBase sharedMSDataBase] queryData:querySQL];
//    MSUserCard *user = [[MSUserCard alloc] init];
//    while ([result next]) {
//        user.cvnumber = [result intForColumn:@"cvnumber"];
//        user.name = [result stringForColumn:@"name"];
//        user.headphoto = [result stringForColumn:@"headphotos"];
//        user.company = [result stringForColumn:@"company"];
//        user.email = [result stringForColumn:@"email"];
//        user.mobile = [result stringForColumn:@"mobile"];
//        user.position = [result stringForColumn:@"position"];
//        user.landline = [result stringForColumn:@"landline"];
//        user.weixin = [result stringForColumn:@"weixin"];
//        user.address = [result stringForColumn:@"address"];
//        user.ability = [result stringForColumn:@"ability"];
//        user.achieve = [result stringForColumn:@"achieve"];
//        user.identitytitle = [result stringForColumn:@"identitytitle"];
//        user.hidemobile = [result intForColumn:@"hidemobile"];
//    }
//    [[MSDataBase sharedMSDataBase] closeDB];
//    return user;
//}
@end
