//
//  MSTool.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/8.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSTool.h"

@implementation MSTool

single_implementation(MSTool);

-(NSString *)filterHTML:(NSString *)html
{
   
        NSScanner * scanner = [NSScanner scannerWithString:html];
        NSString * text = nil;
        while([scanner isAtEnd]==NO)
        {
            //找到标签的起始位置
            [scanner scanUpToString:@"<" intoString:nil];
            //找到标签的结束位置
            [scanner scanUpToString:@">" intoString:&text];
            //替换字符
            html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
        }
        //    NSString * regEx = @"<([^>]*)>";
            html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
        return html;
}

@end
