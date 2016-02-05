//
//  MSBaseTableController.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSBaseController.h"
#import <UIKit/UIKit.h>

@interface MSBaseTableController : MSBaseController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;

@end
