
#import "ThirdViewController.h"
#import "DetailViewController.h"

NSString* kThirdStoryboardName = @"third";
NSString* kThirdViewControllerID = @"ThirdViewController";

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


#pragma mark - Actions
- (IBAction)showAllertAction:(id)sender
{
    CGRect bounds = self.view.bounds;
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    alert.frame = CGRectMake(bounds.size.width/4, bounds.size.height/4, bounds.size.width/2, bounds.size.height/2);
    
    [alert show];
}

- (IBAction)showMoreAction:(id)sender
{
    UIStoryboard* detailStoryboard = [UIStoryboard storyboardWithName:kDetailStoryboardName bundle:nil];
    UIViewController* VC = [detailStoryboard instantiateViewControllerWithIdentifier:kDetailViewControllerID];
    [self presentViewController:VC animated:YES completion:nil];
}
@end
