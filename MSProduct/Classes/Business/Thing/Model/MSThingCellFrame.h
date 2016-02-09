//
//  MSThingCellFrame.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/9.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MSListThing;
@interface MSThingCellFrame : NSObject

@property(nonatomic,assign) CGRect fUserPhoto;
@property(nonatomic,assign) CGRect fUserName;
@property(nonatomic,assign) CGRect fUserIdentityTitle;
@property(nonatomic,assign) CGRect fArticleTypeLabel;
@property(nonatomic,assign) CGRect fTopLine;
@property(nonatomic,assign) CGRect fArticleTitle;
@property(nonatomic,assign) CGRect fActivityTime;
@property(nonatomic,assign) CGRect fActivityAddress;
@property(nonatomic,assign) CGRect fBottomBar;

@property(nonatomic,strong) MSListThing *thing;

@property(nonatomic,assign,readonly) CGFloat cellHeight;

@end
