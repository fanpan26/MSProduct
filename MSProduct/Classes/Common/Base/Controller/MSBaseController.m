//
//  MSBaseController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

/*
    基础类型的Controller
 */
#import "MSBaseController.h"

@implementation MSBaseController


-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"记忆";
}

@end
