//
//  MSAbout.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/10.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSAbout : NSObject


@property(nonatomic,assign) NSInteger aboutid;
@property(nonatomic,copy) NSString *title;


-(instancetype)initWithDictionary:(NSDictionary *)dict;

+(NSArray *)abouts:(NSArray *)array;
@end
