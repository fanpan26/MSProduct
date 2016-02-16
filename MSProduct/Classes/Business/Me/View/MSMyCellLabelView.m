//
//  MSMyCellLabelView.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/12.
//  Copyright © 2016年 Macrosage. All rights reserved.
// 姓名 ，身份等信息 展示 封装。

#import "MSMyCellLabelView.h"
#import "MSFrameConfig.h"
#import "NSString+MS.h"


@implementation MSMyCellLabelView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame texts:(NSArray *)texts
{
    if (self = [self initWithFrame:frame]) {
        [self addSubviewsWithTexts:texts];
    }
    return self;
}

-(void)addSubviewsWithTexts:(NSArray *)texts
{
    //循环创建label
    for (int i = 0; i < texts.count; i ++) {
        UILabel *label = [[UILabel alloc] init];
        NSString *txt = texts[i];
        label.text = txt;
        label.font = kMSMyTopViewDetailsFont;
        label.textColor = [UIColor whiteColor];
        CGSize labelSize = [txt sizeSingleLineWithFont:kMSMyTopViewDetailsFont];
        CGFloat labelY = i * labelSize.height + (i + 1) * kMSTableViewCellMargin;
        label.frame = CGRectMake(0, labelY, labelSize.width, labelSize.height);
        label.center = CGPointMake(kMSScreenWidth * 0.5, labelY + labelSize.height * 0.5);
        [self addSubview:label];
        if (i == texts.count - 1) {
            _height = CGRectGetMaxY(label.frame) + kMSTableViewCellMargin;
            CGRect f = self.frame;
            f.size.height = _height;
            [self setFrame:f];
        }
    }
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
}
-(void)buildUI
{
    self.backgroundColor = [UIColor clearColor];
}

@end
