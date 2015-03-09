

#import "AppDelegate.h"
#import "ColorVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ColorVC *colorVC1 = [[ColorVC alloc]init];
    ColorVC *colorVC2 = [[ColorVC alloc]init];
    
    UINavigationController *navVC1 = [[UINavigationController alloc] initWithRootViewController:colorVC1];
    navVC1.title = @"First";
    UINavigationController *navVC2 = [[UINavigationController alloc] initWithRootViewController:colorVC2];
    navVC2.title = @"Second";
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    [tabVC setViewControllers:@[navVC1, navVC2]];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];

    
    return YES;
}



@end
