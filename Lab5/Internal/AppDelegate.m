
#import "AppDelegate.h"

#import "MainTabBarViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) MainTabBarViewController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.tabBarController = [[MainTabBarViewController alloc] init];
    
    UIStoryboard* firstStoryboard = [UIStoryboard storyboardWithName:kFirstStoryboardName bundle:nil];
    UINavigationController* nav1 = [firstStoryboard instantiateViewControllerWithIdentifier:kFirstViewControllerID];
    nav1.title = @"first";
    
    UINavigationController* nav2 = [firstStoryboard instantiateViewControllerWithIdentifier:kFirstViewControllerID];
    nav2.title = @"second";
    
    UIStoryboard* thirdStoryboard = [UIStoryboard storyboardWithName:kThirdStoryboardName bundle:nil];
    UINavigationController* nav3 = [thirdStoryboard instantiateViewControllerWithIdentifier:kThirdViewControllerID];
    nav3.title = @"third";
    
    NSArray* controllers = [NSArray arrayWithObjects:nav1, nav2, nav3, nil];
    [self.tabBarController setViewControllers:controllers animated:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;}

@end
