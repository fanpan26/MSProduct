//
//  MSSettingLogOutCell.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/11.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSSettingLogOutCell.h"
#import "UIButton+MS.h"
#import "MSFrameConfig.h"
#import "UIColor+MS.h"
#import "MSSystem.h"

@implementation MSSettingLogOutCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return  self;
}

-(void)buildUI
{
    self.backgroundColor = [UIColor clearColor];
    UIButton *btn = [UIButton rectRoundButton];
    CGFloat x = kMSTableViewCellContentPaddingHorizontal;
    CGFloat width = kMSScreenWidth - 2 * x;
    btn.frame = CGRectMake(x,0, width, self.frame.size.height);
    [btn setTitle:@"退 出" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor colorWithHexString:[MSSystem platInfo].color]];
    [self.contentView addSubview:btn];
}


-(void)setFrame:(CGRect)frame
{
    frame.origin.y += 20;
    [super setFrame:frame];
}
@end
