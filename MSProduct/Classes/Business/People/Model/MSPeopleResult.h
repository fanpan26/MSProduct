//
//  MSPeopleResult.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/7.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSBaseResult.h"

@interface MSPeopleResult : MSBaseResult

@property(nonatomic,strong) NSArray *listUsers;
@property(nonatomic,strong) NSArray *displayUsers;

@end
