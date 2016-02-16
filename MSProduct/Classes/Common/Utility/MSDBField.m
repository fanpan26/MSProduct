//
//  MSDBField.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/12.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSDBField.h"

@implementation MSDBField


-(instancetype)initWithName:(NSString *)name type:(MSDBFieldType)type
{
    if (self = [super init]) {
        _fieldName = name;
        _type = type;
    }
    return self;
}

-(instancetype)initDefaultTypeWithName:(NSString *)name
{
    return [self initWithName:name type:MSDBFieldTypeText];
}
@end
