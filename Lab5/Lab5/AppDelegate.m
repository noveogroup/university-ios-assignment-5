#import "AppDelegate.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.tabBarController = [[UITabBarController alloc] init];

    UINavigationController *firstTabNC = [UINavigationController new];
    UINavigationController *secondTabNC = [UINavigationController new];
    AuthorVC *authorTabVC = [AuthorVC new];
    NSArray *tabViewControllers = @[firstTabNC, secondTabNC, authorTabVC];

    [self.tabBarController setViewControllers: tabViewControllers];
    [self.window setRootViewController:[self tabBarController]];
    [self.window makeKeyAndVisible];
    
    ColorVC *firstTabVC = [ColorVC new];
    ColorVC *secondTabVC = [ColorVC new];
    [firstTabNC setViewControllers:@[firstTabVC]];
    [secondTabNC setViewControllers:@[secondTabVC]];

    firstTabVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"First" image:nil tag:0];
    secondTabVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Second" image:nil tag:1];
    authorTabVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"About author" image:nil tag:2];

    firstTabVC.title = @"First";
    firstTabVC.titleDeepCount = @0;
    secondTabVC.title = @"Second";
    secondTabVC.titleDeepCount = @0;

    return YES;
}

@end
