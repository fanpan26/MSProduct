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
    UILabel *name = [[UILabel alloc] init];
    name.font = kMSFont(17);
    name.textColor = [UIColor whiteColor];
    
    NSString *nameStr = @"范月盘";
    name.text = nameStr;
    CGFloat nameY = CGRectGetMaxY(photoView.frame) + kMSTableViewCellMargin;
    CGSize nameSize = [nameStr sizeSingleLineWithFont:kMSFont(17)];
    name.frame = CGRectMake(0, nameY, nameSize.width , nameSize.height);
    name.center = CGPointMake(kMSScreenWidth * 0.5, nameY + nameSize.height * 0.5);
    [self addSubview:name];
    //添加身份
    UILabel *identity = [[UILabel alloc] init];
    identity.font = kMSFont(17);
    identity.textColor = [UIColor whiteColor];
    
    NSString *identityStr = @"天才在线科技有限公司 研发工程师";
    identity.text = identityStr;
    identity.font = kMSFont(16);
    CGSize identitySize = [identityStr sizeSingleLineWithFont:kMSFont(16)];
    CGFloat identityY = CGRectGetMaxY(name.frame) + kMSTableViewCellMargin;
    identity.frame = CGRectMake(0, identityY, identitySize.width, identitySize.height);
    identity.center = CGPointMake(kMSScreenWidth * 0.5, identityY + identitySize.height * 0.5);
    [self addSubview:identity];
    //添加tableview
    CGFloat tableY = CGRectGetMaxY(identity.frame) + kMSTableViewCellMargin;
    CGRect tableFrame = CGRectMake(kMSTableViewCellPaddingLeft, tableY, kMSScreenWidth - 2 *kMSTableViewPaddingLeftRight , 44 * 4 + 3);
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [tableView registerClass:[MSMyCellTopViewDetailCell class] forCellReuseIdentifier:@"MS_MY_TOP_TABLE_VIEW_CELL"];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage resizeImage:@"common_card_background.png"]];
    [self addSubview:tableView];
    
    CGFloat viewHeight = CGRectGetMaxY(tableView.frame) + 5;
    _viewHeight = viewHeight;
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0, viewHeight - 5, self.frame.size.width, 5);
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

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSMyCellTopViewDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MS_MY_TOP_TABLE_VIEW_CELL"];
    [cell setCardTitle: myCardArray[indexPath.row]];
    cell.hasLine = indexPath.row < 3;
    return  cell;
}

-(void)setFrame:(CGRect)frame
{
    frame.size.height = _viewHeight;
    [super setFrame:frame];
}

@end
