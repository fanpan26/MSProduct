//
//  MSframeConfig.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#ifndef MSFrameConfig_h
#define MSFrameConfig_h


#endif /* MSframeConfig_h */

/*屏幕宽高*/
#define kMSScreenWidth [UIScreen mainScreen].bounds.size.width


#define kMSScreenHeight [UIScreen mainScreen].bounds.size.height

/*表格之间的间距*/
#define kMSTableViewCellMargin 10
/*表格距离左侧的间距*/
#define kMSTableViewCellPaddingLeft 10
/*表格距离右侧的间距*/
#define kMSTableViewCellPaddingRight 10
/*表格内容横向间距*/
#define kMSTableViewCellContentPaddingHorizontal 10;
/*表格内容竖向间距*/
#define kMSTableViewCellContentPaddingVertical 10;
/*表左右两侧间距*/
#define kMSTableViewPaddingLeftRight 10

/*颜色*/
#define kMSColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0];
/*字体*/
#define kMSFont(f) [UIFont systemFontOfSize:(f)]
/*默认字体*/
#define kMSFontDefault kMSFont(15)

/*人物列表相关*/
#define kMSPeopleUserNameFont kMSFont(15)
#define kMSPeopleUserCompanyPositionFont kMSFont(12)
#define kMSPeopleUserIdentityTitleFont kMSFont(13)
#define kMSPeopleUserSummaryFont kMSFont(15)

#define kMSPeopleUserNameColor KMSColor(52,52,52)
#define kMSpeopleUserIdentityTitleColor kMSColor(149,149,149)
#define kMSPeopleUserCompanyPositionColor kMSpeopleUserIdentityTitleColor
#define kMSpeopleSummaryColor kMSpeopleUserIdentityTitleColor
