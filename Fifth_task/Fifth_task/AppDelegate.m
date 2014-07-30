//
//  AppDelegate.m
//  Fifth_task
//
//  Created by Admin on 28/07/14.
//  Copyright (c) 2014 MyCompanyName. All rights reserved.
//

#import "AppDelegate.h"
#import "BackgroundColourController.h"
#import "AuthorViewController.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor brownColor];
    
    BackgroundColourController *bcc1 = [[BackgroundColourController alloc]initWithName:(NSString*)@"first" andLevel:0];
    BackgroundColourController *bcc2 = [[BackgroundColourController alloc]initWithName:(NSString*)@"second" andLevel:0];
    
    UINavigationController* nc1 = [[UINavigationController alloc]initWithRootViewController:bcc1];
    nc1.tabBarItem.title = @"First";
    UINavigationController* nc2 = [[UINavigationController alloc]initWithRootViewController:bcc2];
    nc2.tabBarItem.title = @"Second";
    
    AuthorViewController* avc = [[AuthorViewController alloc]init];
    avc.tabBarItem.title = @"Author";
    
    MainViewController* mvc = [[MainViewController alloc]init];
    [mvc setViewControllers: @[nc1, nc2, avc]];
    
    self.window.rootViewController = mvc;
    
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
