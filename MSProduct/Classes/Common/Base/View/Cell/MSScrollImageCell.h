//
//  MSScrollImageCell.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/8.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+MS.h"

#define  kImageScrollImageHeight 150

@interface MSScrollImageCell : UITableViewCell

@property(nonatomic,strong) NSArray *scrollImages;//要滚动的图片

+(CGFloat)scrollHeight;

@end
