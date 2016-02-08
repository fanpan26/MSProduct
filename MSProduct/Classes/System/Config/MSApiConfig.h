//
//  MSApiConfig.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//


/*成功代码 10000*/
#define kMSApiCodeSuccess 10000
/*异常代码 13001*/
#define kMSApiCodeException 13001




/*接口主域名*/
#define kMSBaseApiDomain @"http://univ.gurucv.com/"

/*
 人物获取接口
 startcv 从第几个人开始
 cvnumber 当前登录人的咕噜号
 */
#define kMSApiURLGetFigureList @"/figure/list"
/*
 获取单条用户信息
 cvnumber 用户的cvnumber
 */
#define kMSApiURLGetUserInfo @"/user/info"
/*
  获取事情列表
 ?startId=0
 type=1
 cvnumber=131742
 pid=0
 */
#define kMSApiURLGetThingList @"/thing/list"
