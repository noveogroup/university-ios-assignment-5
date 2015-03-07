//
//  AppDelegate.m
//  UIKitApplication
//
//  Created by Иван Букшев on 3/3/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "BackgroundViewController.h"
#import "InformationViewController.h"
#import "UIColor+Extensions.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIColor *bgColor = [UIColor safestVioletColor];
    
    self.window.backgroundColor = bgColor;
    
    BackgroundViewController *backgroungVC1 = [[BackgroundViewController alloc] init];
    BackgroundViewController *backgroungVC2 = [[BackgroundViewController alloc] init];
    InformationViewController *informationVC = [[InformationViewController alloc] init];
    
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:backgroungVC1];
    navController1.title = @"First";

    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:backgroungVC2];
    navController2.title = @"Second";
    
    UINavigationController *navController3 = [[UINavigationController alloc] initWithRootViewController:informationVC];
    navController3.title = @"Third";
    
    UITabBarController *tbController = [[UITabBarController alloc] init];
    [tbController setViewControllers:@[navController1, navController2, navController3]];
    
    self.window.rootViewController = tbController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
