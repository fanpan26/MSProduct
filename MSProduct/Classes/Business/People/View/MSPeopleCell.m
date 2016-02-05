//
//  MSPeopleCell.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/4.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSPeopleCell.h"
#import "UIImage+MS.h"

#define kMSPeopleCellID  @"MS_PEOPLE_CELL"

@interface MSPeopleCell()
{
    //人物头像
    UIImageView *_userPhoto;
    //人物姓名
    UILabel *_userName;
    //人物公司职位
    UILabel *_userCompanyPosition;
    //人物身份标识
    UILabel *_userIdentityTitle;
    //人物概述
    UILabel *_userSummary;
}
@end

@implementation MSPeopleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addAllSubViews];
    }
    return  self;
}



- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    // 1.获得文件名
    NSInteger count = [_myTableView numberOfRowsInSection:indexPath.section];
    NSString *bgName = @"statusdetail_comment_background_middle.png";
    NSString *seletcedBgName = @"statusdetail_comment_background_middle_highlighted.png";
    if (count - 1 == indexPath.row) { // 末行
        bgName = @"statusdetail_comment_background_bottom.png";
        seletcedBgName = @"statusdetail_comment_background_bottom_highlighted.png";
    }
    
    // 2.设置背景图片
    _bg.image = [UIImage resizeImage:bgName];
    _selectedBg.image = [UIImage resizeImage:seletcedBgName];
}
//添加子控件
-(void)addAllSubViews
{
    //人物头像
    UIImageView *photo = [[UIImageView alloc] init];
    [self.contentView addSubview:photo];
    _userPhoto = photo;
    //人物姓名
    UILabel *userName = [[UILabel alloc] init];
    [self.contentView addSubview:userName];
    _userName = userName;
    //人物公司职位
    UILabel *userCompanyPosition = [[UILabel alloc] init];
    [self.contentView addSubview:userCompanyPosition];
    _userCompanyPosition = userCompanyPosition;
    //人物身份标识
    UILabel *userIdentityTitle = [[UILabel alloc] init];
    [self.contentView addSubview:userIdentityTitle];
    _userIdentityTitle = userIdentityTitle;
    //人物概述
    UILabel *userSummary = [[UILabel alloc] init];
    userSummary.numberOfLines = 0;
    [self.contentView addSubview:userSummary];
    _userSummary = userSummary;
}

@end
