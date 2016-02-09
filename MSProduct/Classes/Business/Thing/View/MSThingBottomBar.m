//
//  MSThingBottomBar.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/9.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSThingBottomBar.h"
#import "MSSingleLine.h"
#import "MSFrameConfig.h"
#import "NSString+MS.h"
#import "MSTool.h"


#define  kMSThingBottomBarHeight 44

@interface MSThingBottomBar()
{
    MSBottomBarType _type;
    MSSingleLine *_line;
    UILabel *_pubtime;
    UILabel *_rightlabel1;
    UILabel *_rightlabel2;
}

@end

@implementation MSThingBottomBar

-(instancetype)init
{
    if (self = [super init]) {
        _type = MSBottomBarTypeOther;
    }
    return self;
}

-(instancetype)initWithType:(MSBottomBarType)type
{
    if (self = [self initWithFrame:CGRectZero]) {
        _type = type;
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _type = MSBottomBarTypeOther;
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews
{
    MSSingleLine *line = [MSSingleLine singleLine];
    [self addSubview:line];
    _line = line;
    
    UILabel *left = [self contentLabel];
    left.text = @"一星期前";
    UILabel *right1 = [self contentLabel];
    right1.text = @"查看：3";
    UILabel *right2 = [self contentLabel];
    right2.text = @"报名：2";
    [self addSubview:left];
    [self addSubview:right1];
    [self addSubview:right2];
    
    _pubtime = left;
    _rightlabel1 = right1;
    _rightlabel2 = right2;
}

-(UILabel *)contentLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.font = kMSFont(12);
    label.textColor = kMSColor(158, 158, 158);
    return label;
}

-(void)layoutSubviews
{
    _line.frame = CGRectMake(0, 0, self.frame.size.width, 0);
}


-(void)setThing:(MSListThing *)thing
{
    _thing = thing;
    NSString *pubText = [[MSTool sharedMSTool] transDateFromInt:thing.addtime];
    _pubtime.text = pubText;
    
    NSString *right1Text = [NSString stringWithFormat:@"查看:%ld", thing.scannum];
    
    _rightlabel1.text = right1Text;
    
    NSString *right2Text =thing.articletype == 2 ? [NSString stringWithFormat:@"报名:%ld", thing.signnum] : [NSString stringWithFormat:@"评论:%ld", thing.commentnum];

    _rightlabel2.text = right2Text;
    
    CGFloat pubtimeX = kMSTableViewCellContentPaddingHorizontal;
    
    CGFloat allY = self.frame.size.height * 0.25;
    
    CGSize pubtimeSize = [pubText sizeSingleLineWithFont:kMSFont(12)];
    _pubtime.frame = CGRectMake(pubtimeX, allY, pubtimeSize.width, pubtimeSize.height);
    
    CGSize right1Size = [right1Text sizeSingleLineWithFont:kMSFont(12)];
    CGSize right2Size = [right2Text sizeSingleLineWithFont:kMSFont(12)];

    CGFloat margin = kMSTableViewCellContentPaddingHorizontal;
    CGFloat right1X = self.frame.size.width - (right2Size.width + right1Size.width + 2 * margin);
    
    _rightlabel1.frame = CGRectMake(right1X, allY, right1Size.width, right1Size.height);
    CGFloat right2X = CGRectGetMaxX(_rightlabel1.frame) + kMSTableViewCellContentPaddingHorizontal;
    _rightlabel2.frame = CGRectMake(right2X, allY, right2Size.width, right2Size.height);
    
}

@end
