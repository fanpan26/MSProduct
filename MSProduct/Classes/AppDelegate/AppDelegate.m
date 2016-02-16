//
//  AppDelegate.m
//  MSProduct
//
//  Created by FanYuepan on 16/2/3.
//  Copyright © 2016年 Macrosage. All rights reserved.
//

#import "AppDelegate.h"
#import "MSTabBarController.h"
#import "MSTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self prepareTables];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[MSTabBarController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*create fmdb*/

-(void)prepareTables
{
//    NSString *hasCreate =[[MSTool sharedMSTool] getLocalValueForKey:@"MS_CREATE_TABLE"];
//     if ([hasCreate isEqualToString: @"OK"] ) {
//        NSLog(@"已经创建过表了，不需要再次创建");
//        return;
//     }
//     //MS_UserInfo
//     NSMutableArray *array = [NSMutableArray array];
//     [array addObject:[[MSDBField alloc] initWithName:@"cvnumber" type:MSDBFieldTypeInteger]];
//     NSArray *arrayFields = [NSArray arrayWithObjects:@"name",@"headphotos",@"company",@"email",@"mobile",@"position",@"landline",@"weixin",@"address",@"ability",@"achieve",@"identitytitle",nil];
//     for (int i = 0; i < arrayFields.count; i ++) {
//      [array addObject:[[MSDBField alloc] initDefaultTypeWithName:arrayFields[i]]];
//     }
//     [array addObject:[[MSDBField alloc] initWithName:@"hidemobile" type:MSDBFieldTypeInteger]];
//     //创建userInfo表
//     [[MSDataBase sharedMSDataBase] createTable:@"MS_UserInfo" fields:array];
//     [[MSTool sharedMSTool] setLocalValue:@"OK" forKey:@"MS_CREATE_TABLE"];
}

@end
