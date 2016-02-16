//
//  MSDBField.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/12.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,MSDBFieldType) {
    MSDBFieldTypeText,
    MSDBFieldTypeInteger,
    MSDBFieldTypeBlob
    
};

@interface MSDBField : NSObject

@property(nonatomic,readonly) NSString *fieldName;
@property(nonatomic,assign,readonly)MSDBFieldType type;

-(instancetype)initWithName:(NSString *)name type:(MSDBFieldType)type;

-(instancetype)initDefaultTypeWithName:(NSString *)name;
@end
