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

@interface MSMeController()<MSMyCellTopViewDelagate>

@end

@implementation MSMeController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self buildUI];
    [self loadUserCard];
}

-(void)loadUserCard
{
//    dispatch_queue_t readDataQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(readDataQueue, ^{
//        [[MSUserData alloc] getUserInfo:131742 success:nil];
//    });
}

-(void)buildUI
{
    self.title = @"我的";
    MSMyCellTopView *topView = [[MSMyCellTopView alloc] initWithFrame:CGRectMake(0, 0, kMSScreenWidth, 0)];
    topView.delegate = self;
    self.tableView.tableHeaderView = topView;
    self.tableView.backgroundColor = kMSThingTableViewBackGroundColor;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
}

-(void)topView:(MSMyCellTopView *)topView didClickedCellofType:(MSTopViewCellType)type
{
    MSBaseController *controller;
    switch (type) {
        case MSTopViewCellTypeMessage:
            break;
        case MSTopViewCellTypeCard:
            controller = [[MSUserCardController alloc] init];
            break;
        case MSTopViewCellTypeGroup:
            break;
        case MSTopViewCellTypeLenged:
            break;
        default:
            break;
    }
    if (controller) {
        [self.navigationController pushViewController:controller animated:YES];
    }
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
    MSUserCardController *userCardController = [[MSUserCardController alloc] init];
    [self.navigationController pushViewController:userCardController animated:YES];
}

@end
