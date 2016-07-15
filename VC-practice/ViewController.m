//
//  ViewController.m
//  VC-practice
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldCenterConstraint;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

+ (UIColor *)colorFromHex:(NSString *)hex
{
    NSScanner *scanner2 = [NSScanner scannerWithString:hex];
    uint baseColor1;
    if ([scanner2 scanHexInt:&baseColor1]) {
        CGFloat red   = ((baseColor1 & 0xFF0000) >> 16) / 255.0f;
        CGFloat green = ((baseColor1 & 0x00FF00) >>  8) / 255.0f;
        CGFloat blue  =  (baseColor1 & 0x0000FF) / 255.0f;
        return [UIColor colorWithRed:red green:green blue:blue alpha:1];
    }
    return nil;

}

+ (NSString *)hexFromColor:(UIColor *)color
{
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat red = components[0];
    CGFloat green = components[1];
    CGFloat blue = components[2];
    return [NSString stringWithFormat:@"%02lX%02lX%02lX",
            lroundf(red * 255),
            lroundf(green * 255),
            lroundf(blue * 255)];
}

- (void)setUpLabels
{
    self.redLabel.text = [NSString stringWithFormat:@"%.*f", 2, self.redSlider.value];
    self.greenLabel.text = [NSString stringWithFormat:@"%.*f", 2, self.greenSlider.value];
    self.blueLabel.text = [NSString stringWithFormat:@"%.*f", 2, self.blueSlider.value];
}

- (void)setUpColorWithSliders
{
    self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value
                                                green:self.greenSlider.value
                                                 blue:self.blueSlider.value
                                                alpha:1];
    self.subView.backgroundColor = self.view.backgroundColor;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [self setUpLabels];
    [self setUpColorWithSliders];
    self.textField.text = [ViewController hexFromColor:self.view.backgroundColor];
    NSMutableString *title = [NSMutableString stringWithFormat:@"%@(", self.tabBarController.tabBar.selectedItem.title];
    [title appendFormat:@"%u)", self.navigationController.viewControllers.count];
    self.navigationItem.title = title;
}

#pragma mark - Action methods

- (IBAction)sliderChanged:(id)sender
{
    [self setUpColorWithSliders];
    [self setUpLabels];
    self.textField.text = [ViewController hexFromColor:self.view.backgroundColor];
}

- (IBAction)textChanged:(id)sender
{
    UIColor *color = [ViewController colorFromHex:self.textField.text];
    
    if (!color) {
        
         static const CGFloat diff = 7.0f;
        
        [UIView
         animateKeyframesWithDuration:0.5
         delay:0
         options:UIViewKeyframeAnimationOptionCalculationModeLinear
         animations:^{
             [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/5.0 animations:^{
                 self.textFieldCenterConstraint.constant = -diff;
                 [self.view layoutIfNeeded];
             }];
             [UIView addKeyframeWithRelativeStartTime:1/5.0 relativeDuration:1/5.0 animations:^{
                 self.textFieldCenterConstraint.constant = diff;
                 [self.view layoutIfNeeded];
             }];
             [UIView addKeyframeWithRelativeStartTime:2/5.0 relativeDuration:1/5.0 animations:^{
                 self.textFieldCenterConstraint.constant = -diff;
                 [self.view layoutIfNeeded];
             }];
             [UIView addKeyframeWithRelativeStartTime:3/5.0 relativeDuration:1/5.0 animations:^{
                 self.textFieldCenterConstraint.constant = diff;
                 [self.view layoutIfNeeded];
             }];
             [UIView addKeyframeWithRelativeStartTime:4/5.0 relativeDuration:1/5.0 animations:^{
                 self.textFieldCenterConstraint.constant = 0.0f;
                 [self.view layoutIfNeeded];
             }];
         }
         completion:^(BOOL finished) {
             self.textField.text = [ViewController hexFromColor:self.view.backgroundColor];
         }];
        
        return;
    }
    CGFloat red, green, blue;
    [color getRed:&red green:&green blue:&blue alpha:nil];
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    [self setUpColorWithSliders];
    [self setUpLabels];
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    NSDictionary* info = [notification userInfo];
    CGRect kbRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    kbRect = [self.view convertRect:kbRect fromView:nil];
    
    CGRect scrollViewRect = self.scrollView.frame;
    
    CGRect hiddenScrollViewRect = CGRectIntersection(scrollViewRect, kbRect);
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, hiddenScrollViewRect.size.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardDidHide:(NSNotification *)notification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

@end
