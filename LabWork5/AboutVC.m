
#import "AboutVC.h"

@interface AboutVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation AboutVC

- (void)viewDidLoad
{
    self.imageView.image = [UIImage imageNamed:@"OSX"];
}

- (IBAction)dismissView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
