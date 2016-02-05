//
//  MSUserCard.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSUserCard.h"

@implementation MSUserCard

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _address = [self resetValue:dict[@"address"]];//
        _company = [self resetValue:dict[@"company"]];//
        _cvnumber = [dict[@"cvnumber"] longLongValue];
        _email = [self resetValue:dict[@"email"]];
        _headphoto = [self resetValue:dict[@"headphoto"]];
        _identitytitle =[self resetValue:dict[@"identity_title"]];
        _hidemobile = [dict[@"ishidemobile"] boolValue];
        _position = [self resetValue:dict[@"job"]];
        _landline = [self resetValue:dict[@"landline"]];
        _name = [self resetValue:dict[@"name"]];
        _weixin = [self resetValue:dict[@"weixin"]];
    }
    return  self;
}


-(NSString *)resetValue:(id)val
{
    return [val isKindOfClass:[NSNull class]]||val==nil ? @"待填写" : val;
}

@end
