//
//  MSMyCellTopViewDetailCell.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/11.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSMyCellTopViewDetailCell.h"
#import "UIImage+MS.h"
#import "MSFrameConfig.h"
#import "MSSingleLine.h"

@implementation MSMyCellTopViewDetailCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow"]];
        self.textLabel.textColor = kMSColor(44, 44, 44);
        self.backgroundColor = [UIColor clearColor];
    }
    return  self;
}

-(void)setHasLine:(BOOL)hasLine
{
    _hasLine = hasLine;
    if (hasLine) {
        MSSingleLine *singleLine = [MSSingleLine singleLine];
        CGFloat lineWidth =  kMSScreenWidth - 2 * kMSTableViewPaddingLeftRight - 20;
        singleLine.frame = CGRectMake(10, self.frame.size.height - 2, lineWidth, 0);
        [self.contentView addSubview:singleLine];
    }
}

-(void)setCardTitle:(NSString *)cardTitle
{
    self.textLabel.text = cardTitle;
}

@end
