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
    
    // create tab contents
    ColoredVC *firstColoredVC = [[ColoredVC alloc] initWithTitlePrefix:@"First"];
    ColoredVC *secondColoredVC = [[ColoredVC alloc] initWithTitlePrefix:@"Second"];
    
    // create tabs
    UINavigationController *firstNavigationController =[[UINavigationController alloc]
        initWithRootViewController:firstColoredVC];
    UINavigationController *secondNavigationController =[[UINavigationController alloc]
        initWithRootViewController:secondColoredVC];
    InformationVC *informationVC = [[InformationVC alloc] init];
    
    // set tab bar titles
    firstNavigationController.tabBarItem.title = @"Color 1";
    secondNavigationController.tabBarItem.title = @"Color 2";
    informationVC.tabBarItem.title = @"Info";
    
    // make bars not translucent
    firstNavigationController.navigationBar.translucent = NO;
    secondNavigationController.navigationBar.translucent = NO;
    tabBarController.tabBar.translucent = NO;
    
    // assign tabs to tab bar
    NSArray *tabBarViewControllers = @[
        firstNavigationController,
        secondNavigationController,
        informationVC
    ];
    
    [tabBarController setViewControllers:tabBarViewControllers];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
