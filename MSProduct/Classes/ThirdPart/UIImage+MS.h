//
//  UIImage+Extension.h
//  SinaWeiBoV20151217
//
//  Created by FanYuepan on 15/12/19.
//  Copyright © 2015年 FanYuepan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (UIImage *) fullscreenImage:(NSString *)imageName;

+ (UIImage *) resizeImage:(NSString *) imageName;

+ (UIImage *)resizedImage:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos;

@end
