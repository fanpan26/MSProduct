//
//  HeadPhotoView.m
//  用CALayer制作微博头像
//
//  Created by FanYuepan on 15/9/20.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "MSHeadPhotoView.h"

#define kMSHeadPhotoSizeBig  100
#define kMSHeadPhotoSizeMiddle  60
#define kMSHeadPhotoSizeSmall  30

@interface MSHeadPhotoView()
{
    UIImageView *_bigImage;
    UIImageView *_smallImage;
    MSPhotoSize _photoSize;
    CGFloat _imageWidth;
    CGFloat _imageHeight;
}

@end

@implementation MSHeadPhotoView

-(instancetype)init
{
    if (self = [super init]) {
        _photoSize = MSPhotoSizeSmall;
    }
    return self;
}

-(instancetype)initWithImage:(NSString *)image smallImage:(NSString *)smallImage
{
    if (self = [self init]) {
        UIImageView *bigImage = [[UIImageView alloc] init];
        bigImage.image = [UIImage imageNamed:image];
        bigImage.layer.cornerRadius = 2;
        bigImage.layer.masksToBounds = YES;
        //bigImage.layer.borderColor = [UIColor blueColor].CGColor;
        //bigImage.layer.borderWidth = 2;
        bigImage.frame = CGRectMake(0, 0, 50, 50);
        [self addSubview:bigImage];
        
        _bigImage = bigImage;
        UIImageView *small = [[UIImageView alloc] init];
        small.image = [UIImage imageNamed:smallImage];
        small.frame = CGRectMake(0, 0, 15, 15);
        [self addSubview:small];
        _smallImage = small;
    }
    return  self;
}

-(instancetype)initWithImage:(NSString *)image type:(MSPhotoType)type
{
    if (self = [self init]) {
        UIImageView *bigImage = [[UIImageView alloc] init];
        bigImage.image = [UIImage imageNamed:image];
        CGSize size = [self photoSizeWithType:_photoSize];
        CGFloat imageWidth = size.width;
        CGFloat imageHeight = size.height;
        switch (_photoSize) {
            case MSPhotoSizeBig:
                imageWidth = kMSHeadPhotoSizeBig;
                imageHeight = kMSHeadPhotoSizeBig;
                break;
            case MSPhotoSizeMiddle:
                imageWidth = kMSHeadPhotoSizeMiddle;
                imageHeight = kMSHeadPhotoSizeMiddle;
                break;
            case MSPhotoSizeSmall:
                imageWidth = kMSHeadPhotoSizeSmall;
                imageHeight = kMSHeadPhotoSizeSmall;
                break;
            default:
                break;
        }
        bigImage.frame = CGRectMake(0, 0, imageHeight, imageWidth);
        //根据类型生成不同的头像
        switch (type) {
            //前两个默认
            case MSPhotoTypeNone:
            case MSPhotoTypeSquare:
                break;
            case MSPhotoTypeRound:
                bigImage.layer.cornerRadius = imageWidth * 0.5;
                //bigImage.layer.borderColor = [UIColor whiteColor].CGColor;
                //bigImage.layer.borderWidth = 1;
                break;
                
            case MSPhotoTypeRoundWhite:
                bigImage.layer.cornerRadius = imageWidth * 0.5;
                bigImage.layer.borderColor = [UIColor whiteColor].CGColor;
                bigImage.layer.borderWidth = 2;
                break;
                
            case MSPhotoTypeSquareRectRound:
                bigImage.layer.cornerRadius = 2;
                break;
                
            case MSPhotoTypeSquareRectRoundWhite:
                bigImage.layer.cornerRadius = 2;
                bigImage.layer.borderColor = [UIColor whiteColor].CGColor;
                bigImage.layer.borderWidth = 2;
                break;
                
            case MSPhotoTypeSquareWhite:
                bigImage.layer.borderColor = [UIColor whiteColor].CGColor;
                bigImage.layer.borderWidth = 2;
                break;
            default:
                break;
        }
        bigImage.layer.masksToBounds = YES;
        [self addSubview:bigImage];
    }
    return self;
}

- (instancetype)initWithImage:(NSString *)image type:(MSPhotoType)type size:(MSPhotoSize)size
{
    _photoSize = size;
    return  [self initWithImage:image type:type];
}

+(instancetype)roundPhoto:(NSString *)image
{
    MSHeadPhotoView *headPhoto = [[MSHeadPhotoView alloc] initWithImage:image type:MSPhotoTypeRoundWhite];
    return headPhoto;
}

+(instancetype)squarePhoto:(NSString *)image
{
    MSHeadPhotoView *headPhoto = [[MSHeadPhotoView alloc] initWithImage:image type:MSPhotoTypeSquareRectRoundWhite];
    return headPhoto;
}

+(CGSize)photoSizeWithType:(MSPhotoSize)size
{
    MSHeadPhotoView *head = [[MSHeadPhotoView alloc] init];
    
    return [head photoSizeWithType:size];
}

- (CGSize)photoSizeWithType:(MSPhotoSize)size
{
    CGFloat imageWidth = 0.0f;
    CGFloat imageHeight = 0.0f;
    switch (size) {
        case MSPhotoSizeBig:
            imageWidth = kMSHeadPhotoSizeBig;
            imageHeight = kMSHeadPhotoSizeBig;
            break;
        case MSPhotoSizeMiddle:
            imageWidth = kMSHeadPhotoSizeMiddle;
            imageHeight = kMSHeadPhotoSizeMiddle;
            break;
        case MSPhotoSizeSmall:
            imageWidth = kMSHeadPhotoSizeSmall;
            imageHeight = kMSHeadPhotoSizeSmall;
            break;
        default:
            break;
    }
    return CGSizeMake(imageWidth, imageHeight);
}

- (void)setFrame:(CGRect)frame
{
    CGRect f = frame;
    f.size.width = _imageWidth;
    f.size.height = _imageHeight;
    [super setFrame:frame];
}

//重点部分，根据caLayer设置小图标的位置
//- (void)setFrame:(CGRect)frame
//{
//    frame.size.height = 50;
//    frame.size.width = 50;
//    //定位在右下角
//    _smallImage.layer.position = CGPointMake(50,50);
//    //以某个点为中心（0.6，0.6）可以适当调整0-1之间
//    _smallImage.layer.anchorPoint = CGPointMake(0.5, 0.5);
//    [super setFrame:frame];
//}

@end
