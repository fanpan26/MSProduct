//
//  UIImage+Extension.m
//  SinaWeiBoV20151217
//
//  Created by FanYuepan on 15/12/19.
//  Copyright © 2015年 FanYuepan. All rights reserved.
//

#import "UIImage+MS.h"
#import "UIImageView+WebCache.h"

@implementation UIImage (Extension)

//全屏幕
+(UIImage *)fullscreenImage:(NSString *)imageName
{
    return [self imageNamed:imageName];
}

///拉伸图片
+ (UIImage *) resizeImage:(NSString *)imageName
{
    return [self resizedImage:imageName xPos:0.5 yPos:0.5];
}

+ (UIImage *)resizedImage:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos
{
    UIImage *image = [UIImage imageNamed:imgName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * xPos topCapHeight:image.size.height * yPos];
}

@end
