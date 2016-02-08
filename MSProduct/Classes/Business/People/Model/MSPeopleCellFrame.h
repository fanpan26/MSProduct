//
//  MSPeopleCellFrame.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MSListUser;
@interface MSPeopleCellFrame : NSObject

@property(nonatomic,strong) MSListUser *user;

@property(nonatomic,assign) CGRect fUserPhoto;
@property(nonatomic,assign) CGRect fCompanyPosition;
@property(nonatomic,assign) CGRect fUserName;
@property(nonatomic,assign) CGRect fIdentityTitle;
@property(nonatomic,assign) CGRect fUserSummary;

@property(nonatomic,assign,readonly) CGFloat cellHeight;

@end
