#import "UserShortVC.h"
#import "ModalVC.h"

@interface UserShortVC ()

@property (nonatomic, strong) IBOutlet UILabel *name;
@property (nonatomic, strong) IBOutlet UILabel *description;

@end

@implementation UserShortVC

- (IBAction) alertButtonPressed:(UIButton *)sender
{
    UIAlertView *helloEarthInputAlert = [[UIAlertView alloc]
            initWithTitle:@"Онегин" message:@"И жить торопится и чувствовать спешит."
            delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [helloEarthInputAlert show];
}

- (IBAction) modalButtonPressed:(UIButton *)sender
{
    [self presentViewController:[[ModalVC alloc] init] animated:YES completion:^{}];
}

@end
