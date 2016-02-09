//
//  MSListThing.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/9.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSUserCard.h"

@interface MSListThing : NSObject

@property(nonatomic,assign) NSInteger addtime;
@property(nonatomic,strong) MSUserCard *user;
@property(nonatomic,copy) NSString *activetime;
@property(nonatomic,copy) NSString *activeaddress;
@property(nonatomic,copy) NSString *label;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy,readonly) NSString *pubtime;
@property(nonatomic,assign) NSInteger scannum;
@property(nonatomic,assign) NSInteger commentnum;
@property(nonatomic,assign) NSInteger signnum;
@property(nonatomic,assign) NSInteger articletype;
@property(nonatomic,assign) BOOL privacy;


- (instancetype)initWithDictionary:(NSDictionary *)dict;

+ (NSArray *)listThings:(NSArray *)array;
@end
