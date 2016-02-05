//
//  MSBaseTableController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSBaseTableController.h"


@implementation MSBaseTableController

-(instancetype)init
{
    if (self = [super init]) {
       
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableView.delegate  = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:tableView];
    _tableView = tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
