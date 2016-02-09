//
//  MSThingController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/4.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSThingController.h"
#import "MSUserData.h"
#import "MSThingResult.h"
#import "MSListThing.h"
#import "MSThingCellFrame.h"
#import "MSFrameConfig.h"
#import "MSThingCell.h"

@interface MSThingController()
{
    NSMutableArray *arrayListThing;
}

@end

static NSString *const kMSThingCellID = @"MS_THING_CELL";

@implementation MSThingController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self buildUI];
    [self showLoading];
    [self loadData];
    
}

-(void)buildUI
{
    [super buildUI];
    self.title = @"有事";
    [self.tableView registerClass:[MSThingCell class] forCellReuseIdentifier:kMSThingCellID];
}


-(void)startHeaderRefreshing
{
    [self loadData];
}
//加载数据，包括下拉刷新
-(void)loadData
{
    arrayListThing = [NSMutableArray array];
    
    WS(thingSelf)
    
    [[MSUserData alloc] getListThing:0 type:1 cv:131742 success:^(MSThingResult *thing) {
        NSArray *thingArr = thing.listThings;
        [thingArr enumerateObjectsUsingBlock:^(MSListThing *t, NSUInteger idx, BOOL * _Nonnull stop) {
            MSThingCellFrame *f = [[MSThingCellFrame alloc] init];
            f.thing = t;
            [arrayListThing addObject:f];
        }];
        
        [thingSelf reloadData];
        //这句代码只有shouldUseRefresh 为YES才有用
        [super startHeaderRefreshing];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayListThing.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSThingCellFrame *f = arrayListThing[indexPath.row];
    MSThingCell *thingCell = [tableView dequeueReusableCellWithIdentifier:kMSThingCellID];
    thingCell.cellFrame = f;
    return thingCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSThingCellFrame *f = arrayListThing[indexPath.row];
    return  f.cellHeight;
}

@end
