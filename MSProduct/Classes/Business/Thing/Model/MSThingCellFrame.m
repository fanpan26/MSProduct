//
//  MSThingCellFrame.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/9.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSThingCellFrame.h"
#import "MSFrameConfig.h"
#import "MSPhotoView.h"
#import "NSString+MS.h"
#import "MSListThing.h"

@implementation MSThingCellFrame

//计算frame
-(void)setThing:(MSListThing *)thing
{
    _thing = thing;
    CGFloat cellWidth = kMSScreenWidth - 2 * kMSTableViewCellContentPaddingHorizontal;
    //头像
    CGFloat photoX = kMSTableViewCellContentPaddingHorizontal;
    CGFloat photoY = kMSTableViewCellContentPaddingVertical;
    CGSize photoSize = [MSPhotoView photoSizeWithSize:MSPhotoViewSizeSmall];
    _fUserPhoto = CGRectMake(photoX, photoY, photoSize.width, photoSize.height);
    //姓名
    CGFloat nameX = CGRectGetMaxX(_fUserPhoto) + kMSTableViewCellContentPaddingHorizontal;
    CGFloat nameY = photoY + photoSize.height * 0.2;
    CGSize nameSize = [thing.user.name sizeSingleLineWithFont:kMSPeopleUserNameFont];
    _fUserName = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    //身份
    CGFloat identityX = CGRectGetMaxX(_fUserName) + kMSTableViewCellContentPaddingHorizontal;;
    CGFloat identityY = nameY + 3;
    CGSize identitySize = [thing.user.identitytitle sizeSingleLineWithFont:kMSPeopleUserIdentityTitleFont];
    _fUserIdentityTitle = CGRectMake(identityX, identityY, identitySize.width, identitySize.height);
    //标签
    CGSize articleLabelSize = [thing.label sizeSingleLineWithFont:kMSThingArticleLabelFont];
    CGFloat articleLabelX = kMSScreenWidth - 2 * kMSTableViewPaddingLeftRight - articleLabelSize.width - kMSTableViewCellContentPaddingHorizontal;
    CGFloat articleLabelY = nameY;
    _fArticleTypeLabel = CGRectMake(articleLabelX, articleLabelY, articleLabelSize.width, articleLabelSize.height);
    //上部分横线
    CGFloat topLineY = CGRectGetMaxY(_fUserPhoto) + kMSTableViewCellContentPaddingVertical;
    _fTopLine = CGRectMake(1, topLineY, cellWidth - 2, 0);//线条
    //中间内容标题
    CGFloat titleX = photoX;
    CGFloat titleY = CGRectGetMaxY(_fTopLine) + kMSTableViewCellContentPaddingVertical;
    CGFloat titleWidth = cellWidth - 2 * kMSTableViewCellContentPaddingHorizontal;
    CGSize titleSize = [thing.title sizeWithFont:kMSPeopleUserSummaryFont width:titleWidth];
    _fArticleTitle = CGRectMake(titleX, titleY, titleSize.width, titleSize.height);
    //活动时间
    CGFloat activityTimeX = titleX;
    CGFloat activityTimeY = CGRectGetMaxY(_fArticleTitle) + kMSTableViewCellContentPaddingVertical;
    CGSize activityTimeSize = [thing.activetime sizeSingleLineWithFont:kMSPeopleUserCompanyPositionFont];
    _fActivityTime = CGRectMake(activityTimeX, activityTimeY, activityTimeSize.width, activityTimeSize.height);
    //活动地点
    CGFloat activityAddressX = activityTimeX;
    CGFloat activityAddressY = CGRectGetMaxY(_fActivityTime) + kMSTableViewCellContentPaddingVertical;
    CGSize activityAddressSize = [thing.activeaddress sizeSingleLineWithFont:kMSPeopleUserCompanyPositionFont];
    _fActivityAddress = CGRectMake(activityAddressX, activityAddressY, activityAddressSize.width, activityAddressSize.height);
    CGFloat bottomBarY = CGRectGetMaxY(thing.activeaddress.length ? _fActivityAddress : _fActivityTime) + kMSTableViewCellContentPaddingVertical;
    
    _fBottomBar = CGRectMake(0, bottomBarY, cellWidth, 44);
    
    _cellHeight = CGRectGetMaxY(_fBottomBar) + kMSTableViewCellContentPaddingVertical;
}

@end
