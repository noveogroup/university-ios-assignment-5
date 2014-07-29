//
//  AppDelegate.m
//  lab-5-uikit
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "AppDelegate.h"
#import "ColoredVC.h"
#import "InformationVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // create tab bar controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [self.window setRootViewController:tabBarController];
    
    // create tabs
    UINavigationController *firstNavigationController =[[UINavigationController alloc] initWithRootViewController:[[ColoredVC alloc] initWithTitlePrefix:@"First"]];
    UINavigationController *secondNavigationController =[[UINavigationController alloc] initWithRootViewController:[[ColoredVC alloc] initWithTitlePrefix:@"Second"]];
    InformationVC *informationVC = [[InformationVC alloc] init];
    
    // create tab bar items
    [firstNavigationController setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Color 1" image:nil tag:0]];
    [secondNavigationController setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Color 2" image:nil tag:1]];
    [informationVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Info" image:nil tag:2]];
    
    firstNavigationController.navigationBar.translucent = NO;
    secondNavigationController.navigationBar.translucent = NO;
    
    // assign tabs to tab bar
    NSArray *tabBarViewControllers = @[
        firstNavigationController,
        secondNavigationController,
        informationVC
        ];
    
    [tabBarController setViewControllers:tabBarViewControllers animated:YES];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
