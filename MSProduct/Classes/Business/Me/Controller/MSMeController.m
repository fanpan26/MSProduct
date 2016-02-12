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
#import "MSFrameConfig.h"
#import "UIColor+MS.h"
#import "MSSystem.h"
#import "MSMyCellTopView.h"

@interface MSMeController()

@end

@implementation MSMeController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self buildUI];
}

-(void)buildUI
{
    self.title = @"我的";
    MSMyCellTopView *topView = [[MSMyCellTopView alloc] initWithFrame:CGRectMake(0, 0, kMSScreenWidth, 0)];
    self.tableView.tableHeaderView = topView;
    self.tableView.backgroundColor = kMSThingTableViewBackGroundColor;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    cell.textLabel.text = @"11111111";
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}


- (void)push
{
    MSUserCardController *userCardController = [[MSUserCardController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:userCardController animated:YES];
}

@end
