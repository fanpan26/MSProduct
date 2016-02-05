//
//  MSApiConfig.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#ifndef MSApiConfig_h
#define MSApiConfig_h


#endif /* MSApiConfig_h */
#import "MSSystem.h"

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
#define kMSApiGetFigureList kMSSysURL + @"/figure/list"