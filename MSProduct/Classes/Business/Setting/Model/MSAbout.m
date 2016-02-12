//
//  MSAbout.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/10.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSAbout.h"

@implementation MSAbout

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _aboutid = [dict[@"id"] longLongValue];
        _title = dict[@"title"];
    }
    return self;
}

+(NSArray *)abouts:(NSArray *)array
{
    NSMutableArray *arrayM = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MSAbout *about = [[MSAbout alloc] initWithDictionary:obj];
        [arrayM addObject:about];
    }];
    return  arrayM;
    
}

@end
