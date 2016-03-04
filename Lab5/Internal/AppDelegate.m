
#import "AppDelegate.h"

#import "FirstViewController.h"
#import "ThirdViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    FirstViewController *vc1 = [[FirstViewController alloc] init];
    UINavigationController* nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav1.title = @"first";
    
    FirstViewController *vc2 = [[FirstViewController alloc] init];
    UINavigationController* nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    nav2.title = @"second";
    
    UIStoryboard* thirdStoryboard = [UIStoryboard storyboardWithName:kThirdStoryboardName bundle:nil];
    UINavigationController* nav3 = [thirdStoryboard instantiateInitialViewController];
    nav3.title = @"third";
    
    NSArray* controllers = [NSArray arrayWithObjects:nav1, nav2, nav3, nil];
    [self.tabBarController setViewControllers:controllers animated:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;}

@end
