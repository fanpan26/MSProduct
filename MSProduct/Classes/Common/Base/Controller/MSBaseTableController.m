//
//  MSBaseTableController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSBaseTableController.h"
#import  "MJRefresh.h"
#import "MSFrameConfig.h"


@implementation MSBaseTableController

-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

/*
    下拉刷新要运行的方法，子类重写一定要调用super startHeadRefreshing
 */
-(void)startHeaderRefreshing
{
    //开始下拉刷新
    NSLog(@"开始下拉刷新，刷新后执行endRefreshing方法");
    [self endHeaderRefreshing];
    [self hideLoading];
}
/*
 上拉刷新要运行的方法，子类重写一定要调用super startHeadRefreshing
 */
-(void)startFooterRefreshing
{
    //开始上拉刷新
    NSLog(@"开始上拉刷新，刷新后执行endRefreshing方法");
    [self endFooterRefreshing];
    [self hideLoading];
}

-(void)endHeaderRefreshing
{
    if(_shoudUseRefresh){
        __unsafe_unretained UITableView *_unretain_tableView = self.tableView;
        [_unretain_tableView.mj_header endRefreshing];
    }
}
-(void)endFooterRefreshing
{
    if (_shoudUseRefresh) {
        __unsafe_unretained UITableView *_unretain_tableView = self.tableView;
        [_unretain_tableView.mj_footer endRefreshing];
    }
}

-(void)reloadData
{
     __unsafe_unretained UITableView *_unretain_tableView = self.tableView;
    [_unretain_tableView reloadData];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableView.delegate  = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = kMSThingTableViewBackGroundColor;
    
    if (self.shoudUseRefresh) {
        __unsafe_unretained UITableView *_unretain_tableView = tableView;
        __weak __typeof(self)_weakSelf = self;
        // 下拉刷新
        _unretain_tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            // 结束刷新
            [_weakSelf startHeaderRefreshing];
        }];

        // 设置自动切换透明度(在导航栏下面自动隐藏)
        _unretain_tableView.mj_header.automaticallyChangeAlpha = YES;

        // 上拉刷新
        _unretain_tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            // 结束刷新
            [_weakSelf startFooterRefreshing];
        }];
    }
    
    [self.view addSubview:tableView];
    _tableView = tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
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
