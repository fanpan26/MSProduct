//
//  MSTool.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/8.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSSingleton.h"

@interface MSTool : NSObject

single_interface(MSTool)

-(NSString *)filterHTML:(NSString *)string;

@end
