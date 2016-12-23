#import "AppDelegate.h"

#import "RecursiveVC.h"
#import "UserShortVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *rootController = [[UITabBarController alloc] init];
	rootController.tabBar.translucent = NO;
    
    UINavigationController *first = [[UINavigationController alloc]
            initWithRootViewController:[[RecursiveVC alloc]
                    initWithNibName:@"RecursiveVC" bundle:[NSBundle mainBundle] name:@"First"]];

    first.navigationBar.translucent = NO;

	UINavigationController *second = [[UINavigationController alloc]
            initWithRootViewController:[[RecursiveVC alloc] initWithNibName:@"RecursiveVC"
                    bundle:[NSBundle mainBundle] name:@"Second"]];

	second.navigationBar.translucent = NO;

    UIViewController *third = [[UserShortVC alloc]
            initWithNibName:@"UserShortVC" bundle:[NSBundle mainBundle]];

	rootController.viewControllers = @[first, second, third];

    first.tabBarItem.title = @"First";
    second.tabBarItem.title = @"Second";
    third.tabBarItem.title = @"Third";

    self.window.rootViewController = rootController;
    
    [self.window makeKeyAndVisible];

    return YES;
}

@end
