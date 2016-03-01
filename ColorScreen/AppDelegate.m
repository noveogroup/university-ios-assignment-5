//
//  AppDelegate.m
//  ColorScreen
//
//  Created by Vik on 28.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "AppDelegate.h"
#import "AboutAuthorVC.h"
#import "ColorVC.h"

@interface AppDelegate ()
@property (strong, nonatomic) UITabBarController *tabController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    ColorVC *colorVC1 = [[ColorVC alloc] init];
    UINavigationController *navControllerVC1 = [[UINavigationController alloc]
                                                initWithRootViewController:colorVC1];
    NSString *tabName1 = @"Tab 1";
    navControllerVC1.title = tabName1;
    colorVC1.title = tabName1;
    
    
    ColorVC *colorVC2 = [[ColorVC alloc] init];
    UINavigationController *navControllerVC2 = [[UINavigationController alloc]
                                                initWithRootViewController:colorVC2];
    NSString *tabName2 = @"Tab 2";
    navControllerVC2.title = tabName2;
    colorVC2.title = tabName2;
    
    
    AboutAuthorVC *aboutVC = [[AboutAuthorVC alloc] init];
    aboutVC.title = @"About";

    NSArray *controllers = @[navControllerVC1, navControllerVC2, aboutVC];
    self.tabController = [[UITabBarController alloc] init];
    [self.tabController setViewControllers:controllers animated:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabController;
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
