#import "ModalVC.h"

@interface ModalVC ()

//@property IBOutlet UIScrollView *scrollView;
@property IBOutlet UITextView *textView;

@end

@implementation ModalVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        self.modalPresentationStyle = UIModalPresentationFormSheet;
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)dismiss:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
