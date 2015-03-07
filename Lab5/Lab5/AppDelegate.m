#import "AppDelegate.h"
#import "ColoredVC.h"
#import "AutorInfoVC.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    UINavigationController *navControllerFirst = [[UINavigationController alloc] initWithRootViewController:[[ColoredVC alloc] init]];
    navControllerFirst.title = @"FirstController";
    
    UINavigationController *navControllerSecond = [[UINavigationController alloc] initWithRootViewController:[[ColoredVC alloc] init]];
    navControllerSecond.title = @"SecondController";
    
    AutorInfoVC *autorController = [[AutorInfoVC alloc] init];//initWithNibName:@"AutorInfoVC" bundle:[NSBundle mainBundle]];
    autorController.title = @"AutorController";
    
    // Add VC into tabBarController
    [tabBarController setViewControllers:@[navControllerFirst, navControllerSecond, autorController]
                                animated:true];
    
    
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
