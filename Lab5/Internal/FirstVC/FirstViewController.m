
#import "FirstViewController.h"

#import "UIColor+hexStringDecoding.h"

@interface FirstViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *colorTextField;
@property (nonatomic, weak) IBOutlet UISlider *redSlider;
@property (nonatomic, weak) IBOutlet UISlider *greenSlider;
@property (nonatomic, weak) IBOutlet UISlider *blueSlider;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@end

@implementation FirstViewController

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //set navigation bar number
    NSUInteger VCIndex = [self.navigationController.viewControllers indexOfObject:self] + 1; //first number should be 1
    NSUInteger tabBarSectionIndex = [self.tabBarController selectedIndex] + 1;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld VC's on %ld tab", (unsigned long)VCIndex, (unsigned long)tabBarSectionIndex];
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.topConstraint.constant = self.navigationController.navigationBar.frame.size.height + self.navigationController.navigationBar.frame.origin.y;
}


#pragma mark - Actions
- (IBAction)showNextVCAction
{
    FirstViewController *vc = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)sliderAction
{
    UIColor* newColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1.f];
    self.view.backgroundColor = newColor;
    self.colorTextField.text = [newColor hexString];
}


#pragma mark - UITextFieldDelegate implementation

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (newString.length > 7) {
        return NO;
    }
    
    if (newString.length) {
        if (![[newString substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"#"]) {
            return NO;
        }
    }
        
    if (newString.length > 1) {
        if (![UIColor isValidHexSring:[newString substringFromIndex:1]]) {
            return NO;
        } else {
            [self setBackgroundColorWithString:newString];
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self setBackgroundColorWithString:self.colorTextField.text];
    self.colorTextField.text = self.colorTextField.text;
    return YES;
}

- (void) setBackgroundColorWithString:(NSString *)string
{

    UIColor* newColor = [UIColor colorWithHexString:[string substringFromIndex:1]];
    self.view.backgroundColor = newColor;
    
    //move sliders to new values
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
    [newColor getRed:&red green:&green blue:&blue alpha:&alpha];
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;

}




@end
