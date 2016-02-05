//
//  MSDisplayUser.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSDisplayUser.h"

@implementation MSDisplayUser

/*
 cvnumber: 131276
 name: "余晶莹"
 titlestring: "研发总裁前端 MacroSage 北京人物志科技有限公司"
 url: "http://img1.gurucv.com/image/2016/1/30/70d0f35b194b44a08f1074
 */
-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
       _title = [dict valueForKey:@"titlestring"];
       _url = [dict valueForKey:@"url"];
       _name = [dict valueForKey:@"name"];
       _cvnumber = [[dict valueForKey:@"cvnumber"] longLongValue];
    }
    return  self;
}


+(NSArray *)displayUsers:(NSArray *)data
{
    if (data&&data.count) {
        NSMutableArray *array = [NSMutableArray array];
        [data enumerateObjectsUsingBlock:
         ^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
             MSDisplayUser *user = [[self alloc] initWithDictionary:dict];
             [array addObject:user];
        }];
        return array;
    }
    return [NSArray array];
}

-(NSString *)description
{
    return  [NSString stringWithFormat:@"MSDisplayUser:%ld,%@",self.cvnumber,self.name];
}

@end
