//
//  MSMeController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSMeController.h"
#import "MSUserData.h"
#import "MSUserCard.h"

@implementation MSMeController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的";
    [[[MSUserData alloc] init] getUserInfo:131742 success:^(MSUserCard *card) {
        if (card) {
            NSLog(@"%@",card.name);
        }else{
            NSLog(@"获取信息失败");
        }
    }];
}

@end
