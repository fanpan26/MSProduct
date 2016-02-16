//
//  MSUserCardController.h
//  PPNetWorking
//
//  Created by 范月成 on 16/2/5.
//  Copyright © 2016年 范月成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSUserCard.h"
#import "MSBaseTableController.h"

@interface MSUserCardInfo  : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;

+ (NSMutableArray *)initWithMSUserCard:(MSUserCard *)userCard;

@end

@interface MSUserCardCell  : UITableViewCell

@property (nonatomic, strong) MSUserCardInfo *userInfo;

@end

@interface MSUserCardController : MSBaseTableController

@property(nonatomic,assign) NSInteger userCvNumber;

@end
