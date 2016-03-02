
#import "ThirdViewController.h"
#import "DetailViewController.h"

NSString* kThirdStoryboardName = @"third";
NSString* kThirdViewControllerID = @"ThirdViewController";

@implementation ThirdViewController

#pragma mark - Actions
- (IBAction)showAllertAction
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert show];
}

@end
