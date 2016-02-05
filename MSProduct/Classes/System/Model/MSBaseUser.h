//
//  MSUser.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/5.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSBaseUser : NSObject
{
    NSString *_name;
    NSString *_headphoto;
    NSInteger _cvnumber;
}
@property(nonatomic,assign) NSInteger cvnumber;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *headphoto;

@end
