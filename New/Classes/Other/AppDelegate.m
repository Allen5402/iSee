//
//  AppDelegate.m
//  News
//
//  Created by nattinessYang on 16/8/12.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "NewsTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    [self.window makeKeyAndVisible];
    // 设置窗口的控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:[[NewsTabBarController alloc] init]];
    self.window.rootViewController = nav;
    
    // 环信
    EMOptions *options = [EMOptions optionsWithAppkey:@"sst208521#xiangkan"];
    
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
