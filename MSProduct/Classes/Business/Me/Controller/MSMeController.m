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

#define kScreenW        [UIScreen mainScreen].bounds.size.width
#define kScreenH        [UIScreen mainScreen].bounds.size.height
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
    
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, kScreenW * 0.5, 30)];
    l1.backgroundColor = [UIColor redColor];
    UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW * 0.5, 200, kScreenW * 0.5, 30)];

    l1.text = @"11121232323213232";
    l2.text = @"123123231232132321321321321";
    
    [self.view addSubview:l1];
    [self.view addSubview:l2];
}

- (void)push
{
    MSUserCardController *userCardController = [[MSUserCardController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:userCardController animated:YES];
}

@end
