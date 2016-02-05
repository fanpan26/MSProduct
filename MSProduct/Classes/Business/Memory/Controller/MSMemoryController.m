//
//  MSMemoryController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/4.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSMemoryController.h"
#import "UIView+Img.h"
#import "MSPlatFormModel.h"
#import "MSSystem.h"

@implementation MSMemoryController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGroundImage];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    self.title = kMSSysTitle;
    
}
//设置背景图片
-(void)setBackGroundImage
{
    UIView *backView = [[UIView alloc] initWithImage:@"memory_background" frame:self.view.bounds];
    [self.tableView setBackgroundView: backView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = @"测试";
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

@end
