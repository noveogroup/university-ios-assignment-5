

#import "ColorVC.h"
#import "InputHEXColorVC.h"
#import "SliderViewController.h"
#import "UIColor+HexColors.h"

static CGSize const ButtonSize = (CGSize){160, 40};
static NSString *const DefaultHexString = @"000000";


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
    
    
    self.nextButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - ButtonSize.width / 2,
                              CGRectGetMaxY(self.view.bounds) - self.tabBarController.tabBar.frame.size.height - 20,
                              ButtonSize.width,
                              ButtonSize.height);


}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;

    self.view.backgroundColor = [UIColor whiteColor];
    

    

    
 
    [self addNextButton];
    
    [self addHEXColorField];
    //[self addRGBSliders];
    
    


}

#pragma mark - Methods

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
                                                 CGRectGetMinY(self.view.bounds) + 30,
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
    CGRect sliderRect = CGRectMake(0,
                                   CGRectGetMaxY(self.inputHEXColorVC.view.bounds),
                                   self.view.bounds.size.width,
                                   0);
    
    self.sliderVC.view.frame = sliderRect;
    
    
    
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
    
    
    self.nextButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - ButtonSize.width / 2,
                              CGRectGetMaxY(self.view.bounds) - self.tabBarController.tabBar.frame.size.height - 20,
                              ButtonSize.width,
                              ButtonSize.height);
    
    
    self.nextButton.layer.cornerRadius = 5.f;
    self.nextButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.nextButton.layer.borderWidth = 1.f;
    
    self.nextButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                              UIViewAutoresizingFlexibleLeftMargin |
                              UIViewAutoresizingFlexibleRightMargin;
    
    [self.view addSubview:self.nextButton];
    
    
}

- (void)updateBackgoundColorWithHexString:(NSString *)hexString {
    self.view.backgroundColor = [UIColor colorWithHexString:hexString];
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
    self.view.backgroundColor = [UIColor clearColor];
    return YES;
}

- (NSString *)hexColorString:(NSString *)string {
    NSRange range = NSMakeRange(string.length - 1, DefaultHexString.length - string.length);
    NSString *subString = [DefaultHexString substringWithRange:range];
    return [NSString stringWithFormat:@"%@%@", string, subString];
}


@end
