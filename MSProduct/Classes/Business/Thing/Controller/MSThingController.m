//
//  MSThingController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/4.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSThingController.h"
#import "MSUserData.h"

@implementation MSThingController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"有事";
    [[MSUserData alloc] getListThing:0 type:1 cv:131742 success:^(MSPeopleResult *people) {
        
    }];
}


@end
