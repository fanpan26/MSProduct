//
//  MSSearchBar.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/8.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSSearchBar.h"
#import "MSFrameConfig.h"

@interface MSSearchBar()<UISearchBarDelegate>

@end

@implementation MSSearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSearchBar];
    }
    return self;
}

-(void)addSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc]  initWithFrame:CGRectMake(0, 0, kMSScreenWidth, 44)];
    searchBar.placeholder = @"搜索人名";
    searchBar.backgroundColor = [UIColor clearColor];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:@"取消"];
    }else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
    }
    searchBar.delegate = self;
    [self addSubview:searchBar];
}

-(void)setFrame:(CGRect)frame
{
    frame.size = CGSizeMake(kMSScreenWidth, 44);
    [super setFrame:frame];
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
}

@end
