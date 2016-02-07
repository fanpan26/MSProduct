//
//  HeadPhotoView.h
//  用CALayer制作微博头像
//
//  Created by FanYuepan on 15/9/20.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef enum {
    MSPhotoTypeRound,//圆形
    MSPhotoTypeSquare,//方形
    MSPhotoTypeRoundWhite,//圆形带白边
    MSPhotoTypeSquareWhite,//方形带白边
    MSPhotoTypeSquareRectRound,//方形圆角
    MSPhotoTypeSquareRectRoundWhite,//方形圆角带白边
    MSPhotoTypeNone//原始
} MSPhotoType;

typedef enum{
    MSPhotoSizeBig,//大图
    MSPhotoSizeSmall,//小图
    MSPhotoSizeMiddle//中图
} MSPhotoSize;

@interface MSHeadPhotoView : UIView

@property(nonatomic,copy) NSString *image;

-(instancetype)initWithImage:(NSString *)image smallImage:(NSString *)smallImage;

-(instancetype)initWithImage:(NSString *)image type:(MSPhotoType)type;
-(instancetype)initWithImage:(NSString *)image type:(MSPhotoType)type size:(MSPhotoSize)size;

+(instancetype) roundPhoto:(NSString *)image;
+(instancetype) squarePhoto:(NSString *)image;



+(CGSize)photoSizeWithType:(MSPhotoSize)size;
@end
