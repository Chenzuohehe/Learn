//
//  AppDelegate.m
//  nei
//
//  Created by ChenZuo on 2016/11/3.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "AppDelegate.h"
#import "NHMainTabbarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    NHMainTabbarViewController *tabbar = [[NHMainTabbarViewController alloc] init];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
