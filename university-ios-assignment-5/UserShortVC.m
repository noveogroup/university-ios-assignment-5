#import "UserShortVC.h"

@interface UserShortVC ()

@property (nonatomic, strong) IBOutlet UILabel *name;
@property (nonatomic, strong) IBOutlet UILabel *description;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@end

@implementation UserShortVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

	if (self)
	{
        // Custom initialization
    }

	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction) alertButtonPressed:(UIButton *)sender
{
    UIAlertView *helloEarthInputAlert = [[UIAlertView alloc]
            initWithTitle:@"Онегин" message:@"И жить торопится и чувствовать спешит."
            delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [helloEarthInputAlert show];
}

@end
