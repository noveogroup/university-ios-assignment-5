#import "AppDelegate.h"
#import "ColorPickerVC.h"


@interface AppDelegate ()
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
                                        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initialize window of the app
    CGRect windowFrame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:windowFrame];
    
    // Initialize first tab content
    NSString *firstTabName = @"First Tab";
    UIViewController *firstTabVC = [[ColorPickerVC alloc] init];
    UINavigationController *firstTabNC = [[UINavigationController alloc]
                                   initWithRootViewController:firstTabVC];
    firstTabNC.title = firstTabVC.title = firstTabName;

    // Initialize second tab content
    NSString *secondTabName = @"Second Tab";
    UIViewController *secondTabVC = [[ColorPickerVC alloc] init];
    UINavigationController *secondTabNC = [[UINavigationController alloc]
                                   initWithRootViewController:secondTabVC];
    secondTabNC.title = secondTabVC.title = secondTabName;
    
    // Initialize tab bar controller and insert the created controllers to it
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[firstTabNC, secondTabNC];
    
    // Set the tab bar controller as root view controller and make it visible
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end