
#import "ColorVC.h"
#import "UIColor+HexColor.h"

@interface ColorVC () <UITextFieldDelegate>

@property (nonatomic) IBOutlet UITextField *colorTextFiled;
@property (nonatomic) IBOutlet UISlider *redColorSlider;
@property (nonatomic) IBOutlet UISlider *greenColorSlider;
@property (nonatomic) IBOutlet UISlider *blueColorSlider;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic) UITextField *activeField;

@end

@implementation ColorVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.redColorSlider.value = (arc4random() % 255) / 255.0;
    self.greenColorSlider.value = (arc4random() % 255) / 255.0;
    self.blueColorSlider.value = (arc4random() % 255) / 255.0;
    
    [self sliderValueChanged];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@ %lu", self.navigationController.title, self.navigationController.viewControllers.count];
    
    [self registerForKeyboardNotifications];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super viewWillDisappear:animated];
}

- (IBAction)gotoNextVC:(id)sender
{
    ColorVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)sliderValueChanged
{
    float red = self.redColorSlider.value;
    float green = self.greenColorSlider.value;
    float blue = self.blueColorSlider.value;
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.colorTextFiled.text = [NSString stringWithFormat:@"%02X%02X%02X", (int)(red * 255), (int)(green * 255), (int)(blue * 255)];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSError *error = nil;
    UIColor *color = [UIColor colorWithHexString:newString error:&error];
    
    if (error) {
        if (error.code == HexColorErrorInvalidCharacter || error.code == HexColorErrorLenghtIsGreaterThan6) {
            return NO;
        }
        else {
            return YES;
        }
    }

    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    self.redColorSlider.value = red;
    self.greenColorSlider.value = green;
    self.blueColorSlider.value = blue;
    
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSError *error = nil;
    [UIColor colorWithHexString:textField.text error:&error];
    
    if (error) {
        
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:error.domain message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:NULL]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return NO;
    }
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Scroll-Keyboard routines

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    NSLog(@"%f", kbSize.height);
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
//    CGRect aRect = self.view.frame;
//    aRect.size.height -= kbSize.height;
//    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
//        [self.scrollView scrollRectToVisible:self.activeField.frame animated:YES];
//    }
}

//- (void)keyboardWasShown:(NSNotification*)aNotification {
//    
//    NSDictionary* info = [aNotification userInfo];
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    CGRect bkgndRect = self.activeField.superview.frame;
//    bkgndRect.size.height += kbSize.height;
//    [self.activeField.superview setFrame:bkgndRect];
//    [self.scrollView setContentOffset:CGPointMake(0.0, self.activeField.frame.origin.y-kbSize.height) animated:YES];
//}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
}

@end

















