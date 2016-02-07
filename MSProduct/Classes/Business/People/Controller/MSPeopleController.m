//
//  MSPeopleController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/4.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSPeopleController.h"
#import "MSDataFactory.h"
#import "MSDisplayUser.h"

@implementation MSPeopleController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"人物";
    [[[MSDataFactory alloc] init] getWithURL:@"/figure/list?startcv=0&cvnumber=131742" params:nil success:^(id JSON) {
        NSArray *displayUsers = [MSDisplayUser displayUsers:JSON[@"view"]];
        NSLog(@"%@",displayUsers);
    } failure:^(id ERRMSG) {
        //NSLog(@"%@",ERRMSG);
    }];
}

@end
