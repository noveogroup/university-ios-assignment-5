
#import "AuthorVC.h"

@interface AuthorVC ()

@end

@implementation AuthorVC

- (IBAction)showAlertView:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Message" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
