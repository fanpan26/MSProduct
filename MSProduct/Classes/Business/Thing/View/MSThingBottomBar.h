//
//  MSThingBottomBar.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/9.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSListThing.h"

typedef NS_ENUM(NSInteger,MSBottomBarType){
    MSBottomBarTypeSign, //报名
    MSBottomBarTypeOther //其他
} ;

@interface MSThingBottomBar : UIView

-(instancetype)initWithType:(MSBottomBarType)type;

@property(nonatomic,strong) MSListThing *thing;

@end
