//
//  MSTabBarController.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "MSTabBarController.h"
#import "MSNavigationController.h"
#import "MSMeController.h"
#import "MSMemoryController.h"
#import "MSThingController.h"
#import "MSPeopleController.h"
#import "MSSettingController.h"
#import "MSSystem.h"
#import "MSPlatFormModel.h"

@implementation MSTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addChildViewControllers];
}

//添加子控制器
- (void)addChildViewControllers
{
    NSMutableArray *childControllers = [NSMutableArray array];
    //记忆
    MSNavigationController *memory = [[MSNavigationController alloc] initWithRootViewController:[[MSMemoryController alloc] init]];
    memory.tabBarItem = [[UITabBarItem alloc] initWithTitle:kMSSysTitle image:[UIImage imageNamed:@"tabbar_home"] tag:1];
     [childControllers addObject:memory];
    //人物
    MSPeopleController *peopleChild = [[MSPeopleController alloc] init];
    peopleChild.shoudUseRefresh = YES;
    MSNavigationController *people = [[MSNavigationController alloc] initWithRootViewController:peopleChild];
    people.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"人物" image:[UIImage imageNamed:@"tabbar_profile"] tag:2];
    [childControllers addObject:people];
    //有事
    MSNavigationController *thing = [[MSNavigationController alloc] initWithRootViewController:[[MSThingController alloc] init]];
    thing.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"有事" image:[UIImage imageNamed:@"tabbar_discover"] tag:3];
    [childControllers addObject:thing];
    //我的
    MSNavigationController *me = [[MSNavigationController alloc] initWithRootViewController:[[MSMeController alloc] init]];
    me.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"tab_recent_nor"] tag:4];
    //me.tabBarItem.badgeValue = @"12";
    [childControllers addObject:me];
    //设置
    MSNavigationController *setting = [[MSNavigationController alloc] initWithRootViewController:[[MSSettingController alloc] init]];
    setting.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"tab_me_nor"] tag:5];
    //me.tabBarItem.badgeValue = @"12";
    [childControllers addObject:setting];
    self.viewControllers = childControllers;
    [self.tabBar setTintColor:[MSSystem systemColorWith:1]];
}
@end
