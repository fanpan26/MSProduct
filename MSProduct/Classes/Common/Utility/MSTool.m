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


-(NSString *)handleNULL:(id)string
{
    return [string isKindOfClass:[NSNull class]]||string == nil ? @"" : string;
}

-(NSString *)transDateFromInt:(NSInteger)strtime
{
   return @"2016-01-01 12:05:46";
}
-(void)setLocalValue:(id)value forKey:(NSString *)key
{
    if (value == nil) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(id)getLocalValueForKey:(NSString *)key
{
   id val = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return  val;
}

@end
