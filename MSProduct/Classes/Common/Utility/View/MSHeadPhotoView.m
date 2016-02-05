//
//  MSHeadPhotoView.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSHeadPhotoView.h"

@implementation MSHeadPhotoView

-(instancetype)initWithPhoto:(NSString *)photo
{
    if (self = [super init]) {
        self.layer.contents = (id)[UIImage imageNamed:photo];
    }
    return self;
}

//+(instancetype)sharedView
//{
//    static MSHeadPhotoView *instance;
//    dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [[MSHeadPhotoView alloc] init];
//    });
//    return instance;
//}

@end
