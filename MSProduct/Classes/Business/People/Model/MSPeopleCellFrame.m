//
//  MSPeopleCellFrame.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSPeopleCellFrame.h"
#import "MSListUser.h"
#import "MSFrameConfig.h"
#import "MSPhotoView.h"
#import "NSString+MS.h"
#import <UIKit/UIKit.h>

@implementation MSPeopleCellFrame

-(void)setUser:(MSListUser *)user
{
    _user = user;
    //头像
    CGFloat photoX = kMSTableViewCellContentPaddingHorizontal;
    CGFloat photoY = kMSTableViewCellContentPaddingVertical;
    CGSize photoSize = [MSPhotoView photoSizeWithSize:MSPhotoViewSizeDefault];
    _fUserPhoto = CGRectMake(photoX, photoY, photoSize.width, photoSize.height);
    //姓名
    CGFloat nameX = CGRectGetMaxX(_fUserPhoto) + kMSTableViewCellContentPaddingHorizontal;
    CGFloat nameY = photoY + 5;
    CGSize nameSize = [_user.name sizeSingleLineWithFont:kMSPeopleUserNameFont];
    _fUserName = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    //公司职位
    CGFloat companyX = CGRectGetMaxX(_fUserName) + kMSTableViewCellContentPaddingHorizontal;
    CGFloat companyY = nameY;
    CGSize companySize = [_user.companyposition sizeSingleLineWithFont:kMSPeopleUserCompanyPositionFont];
    CGFloat companyWidth = kMSScreenWidth - companyX;
    _fCompanyPosition = CGRectMake(companyX, companyY,companyWidth , companySize.height);
    //身份
    CGFloat identityX = nameX;
    CGFloat identityY = CGRectGetMaxY(_fUserName) + kMSTableViewCellContentPaddingVertical;
    CGSize identitySize = [_user.title3string sizeSingleLineWithFont:kMSPeopleUserIdentityTitleFont ];
    _fIdentityTitle = CGRectMake(identityX, identityY, identitySize.width, identitySize.height);
    //概述
    CGFloat summaryX = nameX;
    CGFloat summaryY = CGRectGetMaxY(_fIdentityTitle) + kMSTableViewCellContentPaddingVertical;
    CGFloat summaryWidth = kMSScreenWidth - nameX - 2 * kMSTableViewPaddingLeftRight;
    CGSize summarySize = [_user.summary sizeWithFont:kMSPeopleUserSummaryFont width:summaryWidth];
    _fUserSummary = CGRectMake(summaryX, summaryY, summarySize.width, summarySize.height);
    
    if (_user.summary) {
        _cellHeight = CGRectGetMaxY(_fUserSummary) + kMSTableViewCellContentPaddingVertical;
    }else {
        _cellHeight = CGRectGetMaxY(_fIdentityTitle) + kMSTableViewCellContentPaddingVertical;
    }
    
}
@end
