
#import "AboutVC.h"

@implementation AboutVC

- (IBAction)dismissView:(id)sender
{
    [self.delegate aboutViewControllerDidFinish:self];
}

@end
