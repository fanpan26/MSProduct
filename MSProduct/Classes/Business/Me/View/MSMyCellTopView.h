//
//  MSMyCellTopView.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/11.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <UIKit/UIKit.h>

/*消息  名片 传记 组织*/
typedef NS_ENUM(NSInteger,MSTopViewCellType){
    MSTopViewCellTypeMessage = 0,
    MSTopViewCellTypeCard = 1,
    MSTopViewCellTypeLenged = 2,
    MSTopViewCellTypeGroup = 3
} ;

@class MSMyCellTopView;

@protocol MSMyCellTopViewDelagate <NSObject>

@optional
-(void)topView:(MSMyCellTopView *)topView didClickedCellofType:(MSTopViewCellType)type;

@end

@interface MSMyCellTopView : UIView

@property(nonatomic,weak)id<MSMyCellTopViewDelagate> delegate;

@end
