//
//  MSLoadingView.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/9.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSLoadingView.h"
#import "MSFrameConfig.h"

@interface MSLoadingView()
{
    UIActivityIndicatorView *_indicator;
}

@end

@implementation MSLoadingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addLoadingView];
    }
    return self;
}

-(void)addLoadingView
{
    CGPoint center = self.center;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(center.x - 50, center.y - 22, 100, 44)];
    view.backgroundColor = [UIColor lightGrayColor];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] init];
    CGRect indicatorFrame = CGRectMake(45, 22,0,0);
    indicator.frame = indicatorFrame;
    [view addSubview:indicator];
    [self addSubview:view];
    _indicator = indicator;
}

-(void)showLoading:(UIView *)view
{
    [self setFrame:CGRectZero];
    [view addSubview:self];
    [self startLoading];
}

-(void)startLoading
{
    [_indicator startAnimating];
}

-(void)endLoading
{
    [UIView animateWithDuration:0.8 animations:^{
        self.alpha = 0.01;
    } completion:^(BOOL finished) {
        if ([_indicator isAnimating]) {
            [_indicator stopAnimating];
        }
        [self removeFromSuperview];
    }];
    
}

-(void)setFrame:(CGRect)frame
{
    
    frame.size.width = kMSScreenWidth;
    frame.size.height = kMSScreenHeight;
    [super setFrame:frame];
}

@end
