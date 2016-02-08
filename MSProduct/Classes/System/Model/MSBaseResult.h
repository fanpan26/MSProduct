//
//  MSBaseResult.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/7.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSBaseResult : NSObject

@property(nonatomic,copy) NSString *errmsg;
@property(nonatomic,assign) BOOL hasdata;
@end
