//
//  MSUserData.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSDataFactory.h"

@class  MSUserCard;
@class  MSPeopleResult;
@class  MSThingResult;
@class  MSAboutResult;
typedef void(^MSUserCardResult)(MSUserCard *card) ;

typedef void(^MSPeopleResultCallBack)(MSPeopleResult *people);

typedef void(^MSThingResultCallBack)(MSThingResult *thing) ;

typedef void(^MSAboutResultCallback)(MSAboutResult *about);

@interface MSUserData:NSObject


-(void)getUserInfo:(NSInteger)cvnumber success:(MSUserCardResult)success;

-(void)getListUser:(NSInteger)startCv cvnumber:(NSInteger)cvnumber success:(MSPeopleResultCallBack)success;
/*
 ?startId=0
 type=1
 cvnumber=131742
 */
-(void)getListThing:(NSInteger)startid type:(NSInteger)type cv:(NSInteger)cvnumber success:(MSThingResultCallBack)success;

-(void)getListAbout:(MSAboutResultCallback)success;
@end
