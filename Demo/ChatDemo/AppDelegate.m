//
//  AppDelegate.m
//  ChatDemo
//
//  Created by 周传祥 on 2018/10/19.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "AppDelegate.h"
#import "MainFrameController.h"
#import "ContactController.h"
#import "FindController.h"
#import "MeController.h"
#import <Foundation/Foundation.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]init];
    UITabBarController *root = [[UITabBarController alloc]init];
    MainFrameController *vc1 = [[MainFrameController alloc]init];
    ContactController *vc2 = [[ContactController alloc]init];
    FindController *vc3 = [[FindController alloc]init];
    MeController *vc4 = [[MeController alloc]init];
   
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:vc4];
//设置导航标题为白色字体
    [UINavigationBar appearance].titleTextAttributes =@{NSForegroundColorAttributeName : [UIColor whiteColor]};
//设置背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:29/255.0f green:28/255.0f blue:33/255.0f alpha:1]];
    nav1.navigationBar.translucent = YES;
// 设置状态栏为白色字体
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackTranslucent];
    root.viewControllers = @[nav1,nav2,nav3,nav4];
    vc1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"微信" image:[UIImage imageNamed:@"tabbar_mainframe_24x22_"] selectedImage:[UIImage imageNamed:@"tabbar_mainframeHL_24x22_"]];
    vc2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"通讯录" image:[UIImage imageNamed:@"tabbar_contacts_26x22_"] selectedImage:[UIImage imageNamed:@"tabbar_contactsHL_26x22_"]];
    vc3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"tabbar_discover_22x22_"] selectedImage:[UIImage imageNamed:@"tabbar_discoverHL_22x22_"]];
    vc4.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"tabbar_me_22x22_"] selectedImage:[UIImage imageNamed:@"tabbar_meHL_22x22_"]];
    //tabbarItem字体颜色（被选中时）
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:34/255.0f green:139/255.0f blue:34/255.0f alpha:1]} forState:UIControlStateSelected];
//ios 12.1 版本出现的tabbar异常动画的bug 透明度设置为yes会导致导航控制器返回时tabbar图标和标题frame为0从而出现预料之外的动画
    [[UITabBar appearance] setTranslucent:NO];
//   添加rootController
    [self.window setRootViewController:root];
//    显示window
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
