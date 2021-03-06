//
//  MSPeopleCell.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/4.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSBaseCell.h"
#import "MSPeopleCellFrame.h"

@interface MSPeopleCell : MSBaseCell

@property(nonatomic,strong) NSIndexPath *indexPath;
@property(nonatomic,weak)UITableView *myTableView;


@property(nonatomic,strong) MSPeopleCellFrame *cellFrame;
@end
