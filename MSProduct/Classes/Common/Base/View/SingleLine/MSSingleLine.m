//
//  MSSingleLine.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/9.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSSingleLine.h"
#import "UIView+Img.h"

@implementation MSSingleLine

+(instancetype)singleLine
{
    MSSingleLine  *line = [[MSSingleLine alloc] initWithImage:@"common_card_heng" frame:CGRectZero];
    return line;
}

-(void)setFrame:(CGRect)frame
{
    frame.size.height = 5;
    [super setFrame:frame];
}

@end
