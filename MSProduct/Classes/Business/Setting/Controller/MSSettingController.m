//
//  MSSettingController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/4.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSSettingController.h"
#import "MSUserData.h"
#import "MSAboutResult.h"
#import "MSFrameConfig.h"
#import "MSSettingLogOutCell.h"
#import "MSSettingNormalCell.h"

@interface MSSettingController()
{
    NSMutableArray *arrayAboutsData;
}

@end

static NSString *const kMSAboutCellID = @"MS_NORMAL_CELL";
static NSString *const kMSLogoutCellID = @"MS_LOGOUT_CELL";

@implementation MSSettingController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self buildUI];
    [self loadData];
    
}

-(void)buildUI
{
    [super buildUI];
    self.title = @"设置";
    [self.tableView registerClass:[MSSettingNormalCell class] forCellReuseIdentifier:kMSAboutCellID];
    [self.tableView registerClass:[MSSettingLogOutCell class] forCellReuseIdentifier:kMSLogoutCellID];
    self.tableView.rowHeight = 64;
}

-(void)loadData
{
    arrayAboutsData  = [NSMutableArray array];
    WS(aboutSelf)
    [[MSUserData alloc] getListAbout:^(MSAboutResult *about) {
        [arrayAboutsData addObjectsFromArray:about.abouts];
        [aboutSelf reloadData];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayAboutsData.count + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isLast = indexPath.row == arrayAboutsData.count;
    if (isLast) {
        MSSettingLogOutCell *cell = [tableView dequeueReusableCellWithIdentifier:kMSLogoutCellID];
        return cell;
    }
    MSSettingNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:kMSAboutCellID];
    cell.about = arrayAboutsData[indexPath.row];
    return  cell;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
@end
