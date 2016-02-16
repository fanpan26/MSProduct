//
//  MSUser.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSBaseUser.h"

@implementation MSBaseUser

-(void)setCvnumber:(NSInteger)cvnumber
{
    _cvnumber = cvnumber;
    self.PK = [NSString stringWithFormat:@"%ld",cvnumber];
}


@end
