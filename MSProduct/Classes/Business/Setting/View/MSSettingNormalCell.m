//
//  MSSettingNormalCell.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/11.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSSettingNormalCell.h"
#import "MSFrameConfig.h"

@implementation MSSettingNormalCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.textColor = kMSSystemLightGrayColor;
        self.textLabel.font = kMSFont(13);
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow"]];
    }
    return self;
}

-(void)setAbout:(MSAbout *)about
{
    _about = about;
    self.textLabel.text = _about.title;
}

-(void)setFrame:(CGRect)frame
{
    frame.origin.y += 20;
    frame.size.height -= 20;
    [super setFrame:frame];
}

@end
