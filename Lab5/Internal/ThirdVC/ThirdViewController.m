
#import "ThirdViewController.h"
#import "DetailViewController.h"

NSString* kThirdStoryboardName = @"third";
NSString* kThirdViewControllerID = @"ThirdViewController";

@interface ThirdViewController ()

@end

@implementation ThirdViewController

#pragma mark - Actions
- (IBAction)showAllertAction:(id)sender
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)showMoreAction:(id)sender
{
    UIStoryboard* detailStoryboard = [UIStoryboard storyboardWithName:kDetailStoryboardName bundle:nil];
    UIViewController* VC = [detailStoryboard instantiateViewControllerWithIdentifier:kDetailViewControllerID];
    [self presentViewController:VC animated:YES completion:nil];
}
@end
