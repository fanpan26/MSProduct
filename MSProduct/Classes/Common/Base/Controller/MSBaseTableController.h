//
//  MSBaseTableController.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSBaseController.h"
#import <UIKit/UIKit.h>

///*下拉刷新，开始的block*/
//typedef void(^MSPullDownStartRefreshBlock)();
///*下拉刷新，刷新请求数据后的运行block*/
//typedef void(^MSPullDownEndRefreshBlock)();
///*上拉刷新，开始block*/
//typedef void(^MSPushUpStartRefreshBlock)();
///*上啦刷新，请求数据后运行block*/
//typedef void(^MSPushUpEndRefreshBlock)() ;

@interface MSBaseTableController : MSBaseController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak,readonly) UITableView *tableView;
@property(nonatomic,assign) BOOL shoudUseRefresh;

-(void)startHeaderRefreshing;
-(void)startFooterRefreshing;
-(void)reloadData;
//@property(nonatomic,copy) MSPullDownStartRefreshBlock pullDownStartRefreshBlock;
//@property(nonatomic,copy) MSPullDownEndRefreshBlock pullDownEndRefreshBlock;
//
//@property(nonatomic,copy) MSPushUpStartRefreshBlock pushUpStartRefreshBlock;
//@property(nonatomic,copy) MSPushUpEndRefreshBlock pushUpEndRefreshBlock;

//-(void)endHeaderRefreshing;
//-(void)endFooterRefreshing;
@end
