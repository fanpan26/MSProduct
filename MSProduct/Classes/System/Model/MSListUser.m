//
//  MSPeople.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSListUser.h"
#import "NSString+MS.h"
#import "MSTool.h"

@implementation MSListUser

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _addtime = [self resetVal: dict[@"AddTime"]];
        _company = [self resetVal: dict[@"Company"]];
        _cvnumber = [dict[@"CvNumber"] longLongValue];
        _isdonereg = [dict[@"IsDoneReg"] intValue];
        _name = [self resetVal: dict[@"Name"]];
        _rowid = [dict[@"RowId"] longLongValue];
        _headphoto =[self resetVal:  dict[@"headphotos"]];
        _position =[self resetVal:  dict[@"position"]];
        _summary = [self resetVal: dict[@"summary"]];
        _titlestring = [self resetVal: dict[@"titlestring"]];
        _title2string = [self resetVal: dict[@"title2string"]];
        _title3string = [self resetVal: dict[@"title3string"]];
    }
    return  self;
}

-(NSString *)resetVal:(id)val
{
    if ([val isKindOfClass:[NSNull class]]) {
        val = @"";
    }
    val  = [[MSTool sharedMSTool] filterHTML:val];
    return val;
}

+(NSArray *)listUsers:(NSArray *)dicts
{
    NSMutableArray *array = [NSMutableArray array];
    [dicts enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        MSListUser *user = [[MSListUser alloc] initWithDictionary:dict];
        [array addObject:user];
    }];
    return array;
}

-(NSString *)companyposition
{
    NSString *result = @"";
    if (![_position isKindOfClass:[NSNull class]]) {
        result = _position;
    }
    if (![_company isKindOfClass:[NSNull class]]) {
        result = [result stringByAppendingString:[NSString stringWithFormat:@" %@",_company]];
    }
    return result;
}

@end
