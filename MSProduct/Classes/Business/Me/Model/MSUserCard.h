//
//  MSUserCard.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSBaseUser.h"

/*
 address: null
 company: "天才在线"
 cvnumber: 131742
 email: null
 headphoto: "http://img1.gurucv.com/image/2016/1/31/dea89edec0ba465d9fb10ecf6503c472.jpg"
 identity_title: "前端 11111111111111"
 ishidemobile: false
 job: "研发工程师"
 landline: null
 mobile: "18801102076"
 name: "范月盘"
 school_friend: false
 weixin: null
 */
@interface MSUserCard : MSBaseUser

@property(nonatomic,copy) NSString *company;
@property(nonatomic,copy) NSString *email;
@property(nonatomic,assign) BOOL hidemobile;
@property(nonatomic,copy) NSString *position;
@property(nonatomic,copy) NSString *landline;
@property(nonatomic,copy) NSString *weixin;
@property(nonatomic,copy) NSString *address;
@property(nonatomic,copy) NSString *ability;//能力
@property(nonatomic,copy) NSString *achieve;//成就
@property(nonatomic,copy) NSString *identitytitle;//身份标识

@end
