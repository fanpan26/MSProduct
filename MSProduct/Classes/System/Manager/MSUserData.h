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
typedef void(^MSUserCardResult)(MSUserCard *card) ;

typedef void(^MSPeopleResultCallBack)(MSPeopleResult *people);

@interface MSUserData:NSObject


-(void)getUserInfo:(NSInteger)cvnumber success:(MSUserCardResult)success;

-(void)getListUser:(NSInteger)startCv cvnumber:(NSInteger)cvnumber success:(MSPeopleResultCallBack)success;
@end
