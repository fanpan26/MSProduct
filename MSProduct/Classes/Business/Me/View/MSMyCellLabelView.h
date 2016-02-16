//
//  MSMyCellLabelView.h
//  MSProduct
//
//  Created by FanYuepan on 16/2/12.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSMyCellLabelView : UIView

@property(nonatomic,assign,readonly)CGFloat height;

-(instancetype)initWithFrame:(CGRect)frame texts:(NSArray *)texts;
@end
