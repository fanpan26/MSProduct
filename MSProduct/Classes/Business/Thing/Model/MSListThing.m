//
//  MSListThing.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/9.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSListThing.h"
#import "MSTool.h"

@implementation MSListThing


-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _articletype = [dict[@"ArticleType"] integerValue];
        _addtime = [dict[@"AddTime"] longLongValue];
        _activeaddress = [self handleNULL: dict[@"Address"]];
        _activetime = [self handleNULL: dict[@"StartTime"]];
        _privacy = [dict[@"Privacy"] boolValue];
        _title = [self handleNULL: dict[@"Title"]];
        _scannum = [dict[@"looknum"] longValue];
        _commentnum = [dict[@"commnum"] longValue];
        _signnum = [dict[@"signnum"] longValue];
        _user = [[MSUserCard alloc] init];
        _user.name = [self handleNULL: dict[@"Name"]];
        _user.headphoto = [self handleNULL: dict[@"headphotos"]];
        _user.identitytitle = [self handleNULL: dict[@"sataus"]];
        _user.cvnumber = [dict[@"CvNumber"] longLongValue];
        _label = [self handleNULL: dict[@"Label"]];
    }
    return self;
}

-(NSString *)handleNULL:(NSString *)string
{
    return  [[MSTool sharedMSTool] handleNULL:string];
}

+(NSArray *)listThings:(NSArray *)array
{
    NSMutableArray *arr = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MSListThing *thing = [[MSListThing alloc] initWithDictionary:obj];
        [arr addObject:thing];
    }];
    return arr;
}

-(NSString *)pubtime
{
    return  [NSString stringWithFormat:@"%ld",_addtime];
}

-(NSString *)activetime
{
    if(_activetime.length){
        return [NSString stringWithFormat:@"活动时间:%@",_activetime];
    }
    return  _activetime;
}

- (NSString *)activeaddress
{
    if (_activeaddress.length) {
        return  [NSString stringWithFormat:@"活动地点:%@",_activeaddress];
    }
    return  _activeaddress;
}


-(NSString *)label
{
    if (_label.length) {
        return [NSString stringWithFormat:@"【%@】",_label];
    }
    return _label;
}

@end
