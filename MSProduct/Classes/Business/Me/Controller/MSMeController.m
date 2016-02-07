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
#import "MSUserCardController.h"

@interface MSMeController()

@end

@implementation MSMeController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的";
   
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

- (void)push
{
    MSUserCardController *userCardController = [[MSUserCardController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:userCardController animated:YES];
}

@end
