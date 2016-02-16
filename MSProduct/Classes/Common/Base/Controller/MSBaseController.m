//
//  MSBaseController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

/*
    基础类型的Controller
 */
#import "MSBaseController.h"
#import "MBProgressHUD.h"
#import "MSLoadingView.h"

@interface MSBaseController()
{
    MBProgressHUD *_hud;
    MSLoadingView *_loadingView;
}

@end

@implementation MSBaseController


- (void) showLoading{
    _hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    if (!_loadingView) {
//        _loadingView = [[MSLoadingView alloc] init];
//    }
//    [_loadingView showLoading:self.navigationController.view];
}
- (void)hideLoading
{
    //[_loadingView endLoading];
    [_hud hide:YES];
}

-(void)pushController:(UIViewController *)controller
{
    [self.navigationController pushViewController:controller animated:YES];
}

-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
   
}

-(void)buildUI
{
    self.title = @"记忆";
}

@end
