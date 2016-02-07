//
//  MSUserData.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSDataFactory.h"

@class  MSUserCard;
typedef void(^MSUserCardResult)(MSUserCard *card) ;

@interface MSUserData:NSObject


-(void)getUserInfo:(NSInteger)cvnumber success:(MSUserCardResult)success;

@end
