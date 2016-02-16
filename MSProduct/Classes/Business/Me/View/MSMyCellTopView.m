//
//  MSMyCellTopView.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/11.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSMyCellTopView.h"
#import "UIColor+MS.h"
#import "MSSystem.h"
#import "MSFrameConfig.h"
#import "MSPhotoView.h"
#import "NSString+MS.h"
#import "MSMyCellTopViewDetailCell.h"
#import "UIImage+MS.h"
#import "MSMyCellLabelView.h"
#import "MSUserCardController.h"

static NSString *const kMSTopViewDetailCellID = @"MS_MY_TOP_TABLE_VIEW_CELL";

@interface MSMyCellTopView()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *myCardArray;
    CGFloat _viewHeight;
}
@end

@implementation MSMyCellTopView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    
    return self;
}

-(void)buildUI
{
    myCardArray = [NSArray arrayWithObjects:@"消息",@"名片",@"传记",@"组织",nil];
    //添加头像
    MSPhotoView *photoView = [[MSPhotoView alloc] initWithPhoto:@"http://img1.gurucv.com/image/2016/1/31/c8da1f2cce2c4ce08a0af30093b6ce09.jpg" size:MSPhotoViewSizeBig];
    CGSize photoSize = [MSPhotoView photoSizeWithSize:MSPhotoViewSizeBig];
    photoView.frame = CGRectMake(kMSScreenWidth * 0.5 - photoSize.width * 0.5 , kMSTableViewCellMargin, 0, 0);
    photoView.photoType = MSPhotoViewTypeRound;
    [self addSubview:photoView];
    //添加姓名
    CGFloat labelViewY = CGRectGetMaxY(photoView.frame);
    NSArray *texts = [NSArray arrayWithObjects:@"范月盘",@"天才在线工程师",@"人力资源管理一班", nil];
    MSMyCellLabelView *labelView = [[MSMyCellLabelView alloc] initWithFrame:CGRectMake(0, labelViewY, kMSScreenWidth, 0) texts:texts];
    [self addSubview:labelView];
      //添加tableview
    CGFloat tableY = CGRectGetMaxY(labelView.frame);
    CGRect tableFrame = CGRectMake(kMSTableViewCellPaddingLeft, tableY, kMSScreenWidth - 2 *kMSTableViewPaddingLeftRight , 44 * 4 + 3);
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [tableView registerClass:[MSMyCellTopViewDetailCell class] forCellReuseIdentifier:kMSTopViewDetailCellID];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage resizeImage:@"common_card_background.png"]];
    [self addSubview:tableView];
    
    CGFloat viewHeight = CGRectGetMaxY(tableView.frame) + 5;
    _viewHeight = viewHeight;
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0, viewHeight - 4, self.frame.size.width, 5);
    bottomView.backgroundColor = kMSThingTableViewBackGroundColor;
    [self addSubview:bottomView];
    //先添加背景颜色
    NSString *color = [MSSystem platInfo].color;
    [self setBackgroundColor:[UIColor graduallyColor:_viewHeight hexString:color]];
    [self setFrame:CGRectMake(0, 0, 0, 0)];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSMyCellTopViewDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kMSTopViewDetailCellID];
    [cell setCardTitle: myCardArray[indexPath.row]];
    cell.hasLine = indexPath.row < 3;
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self didClickedCell:indexPath];
}

-(void) didClickedCell:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(topView:didClickedCellofType:)]) {
        [_delegate topView:self didClickedCellofType:indexPath.row];
    }
}

-(void)setFrame:(CGRect)frame
{
    frame.size.height = _viewHeight;
    [super setFrame:frame];
}

@end
