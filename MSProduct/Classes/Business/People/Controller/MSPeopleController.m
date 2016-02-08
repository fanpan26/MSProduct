//
//  MSPeopleController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/4.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSPeopleController.h"
#import "MSUserData.h"
#import "MSPeopleResult.h"
#import "MSPeopleCellFrame.h"
#import "MSPeopleCell.h"
#import "MSListUser.h"
#import "MSDisplayUser.h"
#import "MSScrollImageCell.h"
#import "MSSearchBar.h"

@interface MSPeopleController()
{
    //列表数据源
    NSMutableArray *arrayListUsers;
    //滚动图数据源
    NSMutableArray *arrayDisplayUsers;
}

@end


static NSString *const kMSPeopleListCellID = @"MS_CELL_PEOPLE_LIST";
static NSString *const kMSPeopleDisplayCellID = @"MS_CELL_PEOPLE_DISPLAY";
@implementation MSPeopleController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self buildUI];
    [self loadData:nil];
}

- (void)buildUI
{
    [super buildUI];
    self.title = @"人物";
    [self.tableView registerClass:[MSPeopleCell class] forCellReuseIdentifier:kMSPeopleListCellID];
}

-(void)startHeaderRefreshing
{
    [self loadData:^{
        [super startHeaderRefreshing];
    }];
}

-(void)startFooterRefreshing
{
    [self loadMoreData:^{
        [super startFooterRefreshing];
    }];
}

-(void)loadData:(void(^)())finish
{
    arrayListUsers = [NSMutableArray array];
    arrayDisplayUsers = [NSMutableArray array];
    //加载数据
    [[MSUserData alloc] getListUser:0 cvnumber:131276 success:^(MSPeopleResult *people) {
        [people.listUsers enumerateObjectsUsingBlock:^(MSListUser *listUser, NSUInteger idx, BOOL * _Nonnull stop) {
            MSPeopleCellFrame *f = [[MSPeopleCellFrame alloc] init];
            f.user = listUser;
            [arrayListUsers addObject:f];
        }];
        
        arrayDisplayUsers = [NSMutableArray arrayWithArray:people.displayUsers];
        //刷新表格
        [self.tableView reloadData];
        if (finish) {
            finish();
        }
    }];
}
//加载更多
-(void)loadMoreData:(void(^)())finish
{
    MSListUser *lastUser = [(MSPeopleCellFrame *)[arrayListUsers lastObject] user];
    if (!lastUser) {
        return;
    }
    //取出最后一条cvnumber
    [[MSUserData alloc] getListUser:lastUser.cvnumber cvnumber:131276 success:^(MSPeopleResult *people) {
        [people.listUsers enumerateObjectsUsingBlock:^(MSListUser *listUser, NSUInteger idx, BOOL * _Nonnull stop) {
            MSPeopleCellFrame *f = [[MSPeopleCellFrame alloc] init];
            f.user = listUser;
            [arrayListUsers addObject:f];
        }];
        
       // arrayDisplayUsers = [NSMutableArray arrayWithArray:people.displayUsers];
        //刷新表格
        [self.tableView reloadData];
        if (finish) {
            finish();
        }
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
        MSSearchBar *searchBar = [[MSSearchBar alloc] init];
        return searchBar;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [MSScrollImageCell scrollHeight];
    }
    MSPeopleCellFrame *f = arrayListUsers[indexPath.row - 1];
    return f.cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {
        MSScrollImageCell *scrollCell = [[MSScrollImageCell alloc] init];
        scrollCell.scrollImages = arrayDisplayUsers;
        return scrollCell;
    }
    MSPeopleCell *listCell = [tableView dequeueReusableCellWithIdentifier:kMSPeopleListCellID];
    listCell.indexPath = indexPath;
    listCell.myTableView = tableView;
    
    MSPeopleCellFrame *f = arrayListUsers[indexPath.row - 1];
    
    listCell.cellFrame = f;
    
    return listCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return arrayListUsers.count + 1;
}

@end
