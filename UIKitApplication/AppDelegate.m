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

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIColor *bgColor = [UIColor colorWithRed:51.f/255.f
                                       green:153.f/255.f
                                        blue:255.f/255.f
                                       alpha:1.f];
    
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
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
