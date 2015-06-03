//
//  AppDelegate.m
//  PKTProject
//
//  Created by young on 15/5/30.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeViewController.h"
#import "RadioViewController.h"
#import "GroupViewController.h"
#import "DebrisViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    [self setRootViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
- (void)setRootViewController{
    
    HomeViewController *HomeVC = [[HomeViewController alloc]init];
    RadioViewController *twoVC = [[RadioViewController alloc]init];
    GroupViewController *threeVC = [[GroupViewController alloc]init];
    DebrisViewController *fourVC = [[DebrisViewController alloc]init];
 
    
    UINavigationController *navgVC1 = [[UINavigationController alloc]initWithRootViewController:HomeVC];
    UINavigationController *navgVC2 = [[UINavigationController alloc]initWithRootViewController:twoVC];
    UINavigationController *navgVC3 = [[UINavigationController alloc]initWithRootViewController:threeVC];
    UINavigationController *navgVC4 = [[UINavigationController alloc]initWithRootViewController:fourVC];

    
    UITabBarController *mainTabBar = [[UITabBarController alloc]init];
    mainTabBar.viewControllers = @[navgVC1, navgVC2, navgVC3, navgVC4];
    self.window.rootViewController = mainTabBar;
    
    navgVC1.title = @"主页";
    navgVC2.title = @"电台";
    navgVC3.title = @"社区";
    navgVC4.title = @"碎片";
    
    
//    navgVC1.tabBarItem.image = [UIImage imageNamed:@"tab_icon"];
//    navgVC2.tabBarItem.image = [UIImage imageNamed:@"tab_icon"];
//    navgVC3.tabBarItem.image = [UIImage imageNamed:@"tab_icon"];
//    navgVC4.tabBarItem.image = [UIImage imageNamed:@"tab_icon"];
 
    mainTabBar.tabBar.tintColor = [UIColor blackColor];

    
    
    
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

@end
