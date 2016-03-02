

#import "ColorVC.h"
#import "InputHEXColorVC.h"
#import "SliderViewController.h"
#import "UIColor+HexColors.h"

static CGSize const buttonSize = (CGSize){160, 40};
static NSString *const defaultHexString = @"000000";
static NSInteger const margin = 30;


@interface ColorVC () <UITextFieldDelegate>
@property (assign, nonatomic) NSInteger count;
@property (strong, nonatomic) InputHEXColorVC *inputHEXColorVC;
@property (strong, nonatomic) SliderViewController *sliderVC;
@property (strong, nonatomic) UIButton *nextButton;
@property (copy, nonatomic) NSString *currentHexStringColor;


@end

@implementation ColorVC



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.count = 1;
    }
    return self;
}

- (instancetype)initWithLevel:(NSInteger)level
{
    self = [self init];
    
    if (self) {
        self.count = level;
    }
    
    return self;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    
    self.nextButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - buttonSize.width / 2,
                              CGRectGetMaxY(self.view.bounds) - self.tabBarController.tabBar.frame.size.height,
                              buttonSize.width,
                              buttonSize.height);
    

    


}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self addNextButton];
    [self addHEXColorField];
    [self addRGBSliders];
    
    self.view.backgroundColor = self.color = [UIColor whiteColor];



}

#pragma mark - Methods

- (void)redSliderChanged:(UISlider *)sender {
    self.sliderVC.labelRedValue.text = [NSString stringWithFormat:@"%.f", sender.value * 255];
    [self updateBackgroundColor];
}

- (void)greenSliderChanged:(UISlider *)sender {
    self.sliderVC.labelGreenValue.text = [NSString stringWithFormat:@"%.f", sender.value * 255];
    [self updateBackgroundColor];
}

- (void)blueSliderChanged:(UISlider *)sender {
    self.sliderVC.labelBlueValue.text = [NSString stringWithFormat:@"%.f", sender.value * 255];
    [self updateBackgroundColor];
}

- (void)updateSliderValueWithColor:(UIColor *)color {
    CIColor *tempColor = [[CIColor alloc] initWithColor:color];
    
    float red = tempColor.red;
    float green = tempColor.green;
    float blue = tempColor.blue;
    
    self.sliderVC.labelRedValue.text = [NSString stringWithFormat:@"%.f", red * 255];
    self.sliderVC.labelGreenValue.text = [NSString stringWithFormat:@"%.f", green * 255];
    self.sliderVC.labelBlueValue.text = [NSString stringWithFormat:@"%.f", blue * 255];
    
    self.sliderVC.redSlider.value = red;
    self.sliderVC.greenSlider.value = green;
    self.sliderVC.blueSlider.value = blue;
    
}

- (void)updateBackgroundColor {
    
    UIColor *newColor = [UIColor colorWithRed:self.sliderVC.redSlider.value
                                        green:self.sliderVC.greenSlider.value
                                         blue:self.sliderVC.blueSlider.value
                                        alpha:1];
    
    self.view.backgroundColor = newColor;
    self.inputHEXColorVC.textFieldInputHEXColor.text = [[UIColor hexValuesFromUIColor:newColor] uppercaseString];
    
}








- (void)goNextViewControllerFrom:(UIButton *)sender {
    NSInteger level = self.count + 1;
    ColorVC *nextColorVC = [[ColorVC alloc] initWithLevel:level];
    
    nextColorVC.title = [NSString stringWithFormat:@"%@ level: %ld", self.navigationController.title, (long)level];
    nextColorVC.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                                    style:UIBarButtonItemStylePlain
                                                                                   target:self
                                                                                   action:nil];
    
    [self.navigationController pushViewController:nextColorVC animated:YES];
}




- (void)addHEXColorField {
    
    self.inputHEXColorVC = [[InputHEXColorVC alloc]
                            initWithNibName:NSStringFromClass([InputHEXColorVC class])
                            bundle:[NSBundle mainBundle]];
    
    self.inputHEXColorVC.view.frame = CGRectMake(CGRectGetMinX(self.view.bounds),
                                                 CGRectGetMinY(self.view.bounds) + margin,
                                                 self.inputHEXColorVC.view.frame.size.width,
                                                 self.inputHEXColorVC.view.frame.size.height);
    
    self.inputHEXColorVC.textFieldInputHEXColor.delegate = self;
    
    self.inputHEXColorVC.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    [self.view addSubview:self.inputHEXColorVC.view];

}

- (void)addRGBSliders {
    self.sliderVC = [[SliderViewController alloc]
                     initWithNibName:NSStringFromClass([SliderViewController class])
                     bundle:[NSBundle mainBundle]];


    
    
    self.sliderVC.view.frame = CGRectMake(CGRectGetMinX(self.view.bounds),
                                          CGRectGetMaxY(self.inputHEXColorVC.view.frame) + margin,
                                          self.sliderVC.view.frame.size.width - margin * 3,
                                          300);
    
    
    
    self.sliderVC.firstView.backgroundColor = self.sliderVC.containerView.backgroundColor = [UIColor clearColor];
    
    [self.sliderVC.redSlider addTarget:self
                                action:@selector(redSliderChanged:)
                      forControlEvents:UIControlEventValueChanged];
    
    [self.sliderVC.greenSlider addTarget:self
                                action:@selector(greenSliderChanged:)
                      forControlEvents:UIControlEventValueChanged];
    
    [self.sliderVC.blueSlider addTarget:self
                                action:@selector(blueSliderChanged:)
                      forControlEvents:UIControlEventValueChanged];
    
    
    
    
    [self.view addSubview:self.sliderVC.view];
    
    
    
    
}




- (void)addNextButton {
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.nextButton addTarget:self
               action:@selector(goNextViewControllerFrom:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];

    
    
    
    self.nextButton.backgroundColor = [UIColor blackColor];
    
    self.nextButton.layer.cornerRadius = 5.f;
    self.nextButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.nextButton.layer.borderWidth = 1.f;
    
    self.nextButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                              UIViewAutoresizingFlexibleLeftMargin |
                              UIViewAutoresizingFlexibleRightMargin;
    
    [self.view addSubview:self.nextButton];
    
    
}

- (void)updateBackgoundColorWithHexString:(NSString *)hexString {
    self.view.backgroundColor = self.color = [UIColor colorWithHexString:hexString];
    
    [self updateSliderValueWithColor:self.view.backgroundColor = self.color];
    
    

}

- (NSString *)hexColorString:(NSString *)string {
    NSRange range = NSMakeRange(string.length - 1, defaultHexString.length - string.length);
    NSString *subString = [defaultHexString substringWithRange:range];
    return [NSString stringWithFormat:@"%@%@", string, subString];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.inputHEXColorVC.textFieldInputHEXColor) {
        [self.inputHEXColorVC.textFieldInputHEXColor resignFirstResponder];
        
    }
    return NO;
    
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
    NSCharacterSet *validationSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEF"] invertedSet];
    
    if (range.length == 1) {
        return YES;
    } else if (textField.text.length < 6) {
        
        NSMutableString *tempString = [NSMutableString stringWithString:textField.text];
        
        [tempString appendString:string];
        
        self.currentHexStringColor = [self hexColorString:[tempString copy]];

        [self updateBackgoundColorWithHexString:self.currentHexStringColor];
        
        return ([string stringByTrimmingCharactersInSet:validationSet].length > 0);
        
    } else {
        return NO;
    }

    

}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    self.view.backgroundColor = self.color = [UIColor whiteColor];

    return YES;
}




@end
