//
//  MSDisplayUser.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSBaseUser.h"

@interface MSDisplayUser : MSBaseUser

@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *url;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

+(NSArray *)displayUsers:(NSArray *)data;
@end
