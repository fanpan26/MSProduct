//
//  MSThingCell.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/9.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSThingCell.h"
#import "MSPhotoView.h"
#import "MSThingBottomBar.h"
#import "UIView+Img.h"
#import "MSListThing.h"
#import "MSThingCellFrame.h"
#import "MSFrameConfig.h"
#import "MSSystem.h"
#import "UIColor+MS.h"
#import "MSSingleLine.h"

@interface MSThingCell()
{
    MSPhotoView *_userPhoto;
    UILabel *_userName;
    UILabel *_userIdentityTitle;
    UILabel *_articleTypeLabel;//类型标签
    MSSingleLine *_topLine;
    UILabel *_title;
    UILabel *_activeTime;
    UILabel *_activeAddress;
    MSThingBottomBar *_bottomBar;//底部
}

@end

@implementation MSThingCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addAllSubViews];
    }
    return self;
}

-(void)addAllSubViews
{
    [super addAllSubViews];
    /*
     MSPhotoView *_userPhoto;
     UILabel *_userName;
     UILabel *_userIdentityTitle;
     UILabel *_articleTypeLabel;//类型标签
     UIView *_topLine;
     UILabel *_title;
     UILabel *_activeTime;
     UILabel *_activeAddress;
     UILabel *_pubTime;
     MSThingBottomBar *_bottomBar;//底部
     */
    //头像
    MSPhotoView *photo = [[MSPhotoView alloc] initWithPhoto:nil size:MSPhotoViewSizeSmall];
    photo.photoType = MSPhotoViewTypeRound;
    [self.contentView addSubview: photo];
    _userPhoto = photo;
    //姓名
    _userName = [self addSingleLineLabel];
    _userName.font = kMSPeopleUserNameFont;
    //身份
    _userIdentityTitle = [self addSingleLineLabel];
    _userIdentityTitle.font = kMSPeopleUserIdentityTitleFont;
    _userIdentityTitle.textColor = kMSpeopleUserIdentityTitleColor;
    //文章类型
    _articleTypeLabel = [self addSingleLineLabel];
    _articleTypeLabel.font = kMSThingArticleLabelFont;
    _articleTypeLabel.textColor = [UIColor colorWithHexString: [MSSystem platInfo].color];
    //上边横线
    MSSingleLine *line = [MSSingleLine singleLine];
    [self.contentView addSubview:line];
    _topLine = line;
    //标题
    _title = [self addSingleLineLabel];
    _title.font = kMSPeopleUserSummaryFont;
    //活动时间
    _activeTime = [self addSingleLineLabel];
    _activeTime.font = kMSPeopleUserCompanyPositionFont;
    _activeTime.textColor = kMSPeopleUserCompanyPositionColor;
    //活动地点
    _activeAddress = [self addSingleLineLabel];
    _activeAddress.font = kMSPeopleUserCompanyPositionFont;
    _activeAddress.textColor = kMSPeopleUserCompanyPositionColor;
    //下边工具条
    MSThingBottomBar *bar = [[MSThingBottomBar alloc] initWithType:MSBottomBarTypeOther];
    [self.contentView addSubview:bar];
    _bottomBar = bar;
}

-(void)setCellFrame:(MSThingCellFrame *)cellFrame
{
    _cellFrame = cellFrame;
    MSListThing *thing = cellFrame.thing;
    [_userPhoto setImage:thing.user.headphoto];
    
    _userPhoto.frame = cellFrame.fUserPhoto;
    
    _userName.frame = cellFrame.fUserName;
    _userName.text = thing.user.name;
    
    _userIdentityTitle.frame = cellFrame.fUserIdentityTitle;
    _userIdentityTitle.text = thing.user.identitytitle;
    
    _articleTypeLabel.frame = cellFrame.fArticleTypeLabel;
    _articleTypeLabel.text = thing.label;
    
    _topLine.frame = cellFrame.fTopLine;
    
    _title.frame = cellFrame.fArticleTitle;
    _title.text = thing.title;
    
    _activeTime.frame = cellFrame.fActivityTime;
    _activeTime.text = thing.activetime;
    
    _activeAddress.frame = cellFrame.fActivityAddress;
    _activeAddress.text = thing.activeaddress;
    
    _bottomBar.frame = cellFrame.fBottomBar;
    _bottomBar.thing = thing;
    
}

-(void)setFrame:(CGRect)frame
{
    frame.origin.x += kMSTableViewCellPaddingLeft;
    frame.origin.y += kMSTableViewCellMargin;
    frame.size.width = kMSScreenWidth - 2 * kMSTableViewPaddingLeftRight;
    frame.size.height -= kMSTableViewCellMargin;
    [super setFrame:frame];
}

@end
