//
//  MSPhotoView.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/7.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSPhotoView.h"
#import "UIImageView+MS.h"

#define kMSBigWidth 100
#define kMSBigHeight 100

#define kMSSmallWidth 40
#define kMSSmallHeight 40

#define kMSDefaultWidth 50
#define kMSDefaultHeight 50

@interface MSPhotoView()
{
    UIImageView *_photoView;
    MSPhotoViewSize _defaultSize;
}

@end

@implementation MSPhotoView

-(void) buildUI
{
    UIImageView *photoView = [[UIImageView alloc] init];
    [self addSubview:photoView];
    _photoView = photoView;
    [self setSize:MSPhotoViewSizeDefault];
    [self setPhotoType:MSPhotoViewTypeSquare];
}

-(instancetype)initWithPhoto:(NSString *)image size:(MSPhotoViewSize)size
{
    if (self = [self init]) {
        
        [_photoView setImageWithUrl:image placeHolder:nil];
        [self setSize:size];
    }
    return self;
}

-(instancetype)initWithPhoto:(NSString *)image
{
    return  [self initWithPhoto:image size:MSPhotoViewSizeNone];
}

-(instancetype)init
{
    if (self = [super init]) {
        
        [self buildUI];
    }
    return self;
}

-(void)setSize:(MSPhotoViewSize)size
{
    _defaultSize = size == MSPhotoViewSizeNone ? MSPhotoViewSizeDefault : size;
    switch (size) {
        case MSPhotoViewSizeBig:
            _photoView.frame = CGRectMake(0, 0, kMSBigWidth, kMSBigHeight);
            break;
        case MSPhotoViewSizeDefault:
            _photoView.frame = CGRectMake(0, 0, kMSDefaultWidth, kMSDefaultHeight);
            break;
        case MSPhotoViewSizeSmall:
            _photoView.frame = CGRectMake(0, 0, kMSSmallWidth, kMSSmallHeight);
            break;
        case  MSPhotoViewSizeNone:
            [self setSize:MSPhotoViewSizeDefault];
            break;
        default:
            [self setSize:MSPhotoViewSizeDefault];
            break;
    }
}

//photo
-(void)setPhotoType:(MSPhotoViewType)photoType
{
    _photoType = photoType;
    switch (photoType) {
        case MSPhotoViewTypeDefault:
            [self setPhotoType:MSPhotoViewTypeSquare];
            break;
        case MSPhotoViewTypeRound:
            _photoView.layer.cornerRadius = _photoView.frame.size.width * 0.5;
            _photoView.clipsToBounds = YES;

            break;
        case MSPhotoViewTypeRoundWhite:
            _photoView.layer.cornerRadius = _photoView.frame.size.width * 0.5;
            _photoView.layer.borderColor = [UIColor whiteColor].CGColor;
            _photoView.layer.borderWidth = 2;
            _photoView.clipsToBounds = YES;
            break;
        case MSPhotoViewTypeSquare:
            //_photoView.layer.cornerRadius = 1;
            break;
        case MSPhotoViewTypeSquareRectRound:
            _photoView.layer.cornerRadius = 2;
            _photoView.clipsToBounds = YES;

            
            break;
        case MSPhotoViewTypeSquareRectRoundWhite:
            _photoView.layer.cornerRadius = 2;
            _photoView.layer.borderColor = [UIColor whiteColor].CGColor;
            _photoView.layer.borderWidth = 2;
            _photoView.clipsToBounds = YES;

            break;
        case MSPhotoViewTypeSquareWhite:
            _photoView.layer.borderColor = [UIColor whiteColor].CGColor;
            _photoView.layer.borderWidth = 2;
            _photoView.clipsToBounds = YES;

            break;
        default:
            break;
    }
}

//重写frame
-(void)setFrame:(CGRect)frame
{
    CGFloat width = 0.0f;
    CGFloat height = 0.0f;
    switch (_defaultSize) {
        case MSPhotoViewSizeBig:
            width = kMSBigWidth;
            height = kMSBigHeight;
            break;
        case MSPhotoViewSizeDefault:
            width = kMSDefaultWidth;
            height = kMSDefaultHeight;
            break;
        case MSPhotoViewSizeNone:
            width = kMSDefaultWidth;
            height = kMSDefaultHeight;
            break;
        case MSPhotoViewSizeSmall:
            width = kMSSmallWidth;
            height = kMSSmallHeight;
            break;
    }
    frame.size.width = width;
    frame.size.height = height;
    [super setFrame:frame];
}
@end
