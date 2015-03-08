#import "ColorPickerVC.h"


static NSString *const BACK_BUTTON_TEXT = @"Back";


@interface ColorPickerVC ()

// UI elements
@property (strong, nonatomic) UIButton *nextVCButton;
@property (strong, nonatomic) UITextField *colorField;
@property (strong, nonatomic) UISlider *redSlider;
@property (strong, nonatomic) UISlider *greenSlider;
@property (strong, nonatomic) UISlider *blueSlider;

// Other properties
@property (assign, nonatomic) NSInteger drillLevel;

@end


@implementation ColorPickerVC

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _drillLevel = 1;
    }
    return self;
}

- (instancetype)initWithDrillLevel:(NSInteger)drillLevel {
    self = [self init];
    if (self != nil) {
        _drillLevel = drillLevel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize elements of the view
    [self initializeElements];
    
    // Initialize autoresizing masks
    [self initializeAutoresizingMasks];
    
    // Initialize actions of elements
    [self initializeActions];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)initializeElements {
    // Initialize nextVC button
    NSInteger buttonRadius = 50;
    CGRect nextVCButtonRect = {
        self.view.bounds.size.width / 2 - buttonRadius,
        110,
        buttonRadius * 2,
        buttonRadius * 2
    };
    self.nextVCButton = [[UIButton alloc] initWithFrame:nextVCButtonRect];
    self.nextVCButton.layer.masksToBounds = YES;
    self.nextVCButton.layer.cornerRadius = buttonRadius;
    self.nextVCButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.nextVCButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nextVCButton setTitle:@"Push to\nnext VC" forState:UIControlStateNormal];
    self.nextVCButton.backgroundColor = [UIColor blackColor];
    [self updateNextVCbuttonPosition];
    [self.view addSubview:self.nextVCButton];
    
    // Initialize color text field
    NSInteger fieldMargin = 110;
    NSInteger fieldHeight = 30;
    NSInteger yPosIndex = 5;
    CGRect colorFieldRect = {
        fieldMargin,
        (self.view.bounds.size.height - fieldHeight) / 10 * yPosIndex,
        self.view.bounds.size.width - fieldMargin * 2,
        fieldHeight
    };
    self.colorField = [[UITextField alloc] initWithFrame: colorFieldRect];
    self.colorField.textAlignment = NSTextAlignmentCenter;
    self.colorField.borderStyle = UITextBorderStyleRoundedRect;
    self.colorField.placeholder = @"######";
    self.colorField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.colorField];
    
    
    // Initialize color sliders
    NSInteger sliderMargin = 70;
    
    // Initialize red slider
    yPosIndex = 6;
    CGRect redSliderRect = {
        sliderMargin,
        self.view.bounds.size.height / 10 * yPosIndex,
        self.view.bounds.size.width - sliderMargin * 2,
        0
    };
    self.redSlider = [[UISlider alloc] initWithFrame: redSliderRect];
    [self.view addSubview:self.redSlider];
    
    // Initialize green slider
    yPosIndex = 7;
    CGRect greenSliderRect = {
        sliderMargin,
        self.view.bounds.size.height / 10 * yPosIndex,
        self.view.bounds.size.width - sliderMargin * 2,
        0
    };
    self.greenSlider = [[UISlider alloc] initWithFrame: greenSliderRect];
    [self.view addSubview:self.greenSlider];
    
    // Initialize blue slider
    yPosIndex = 8;
    CGRect blueSliderRect = {
        sliderMargin,
        self.view.bounds.size.height / 10 * yPosIndex,
        self.view.bounds.size.width - sliderMargin * 2,
        0
    };
    self.blueSlider = [[UISlider alloc] initWithFrame: blueSliderRect];
    [self.view addSubview:self.blueSlider];
    
}

- (void)initializeActions {
    [self.nextVCButton addTarget:self
                          action:@selector(nextVCButtonTapped:)
                forControlEvents:UIControlEventTouchUpInside];
    [self.colorField addTarget:self
                        action:@selector(colorValueChanged:)
              forControlEvents:UIControlEventEditingChanged];
    [self.colorField addTarget:self
                        action:@selector(colorValueEntered:)
              forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (void)nextVCButtonTapped:(UIButton *)sender {
    NSInteger nextDrillLevel = self.drillLevel + 1;
    UIViewController *nextVC = [[[self class] alloc] initWithDrillLevel:nextDrillLevel];
    nextVC.title = [NSString stringWithFormat:@"%@ - level %ld",
                    self.navigationController.title,
                    (long)nextDrillLevel];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:BACK_BUTTON_TEXT
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:nil
                                                                  action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)updateNextVCbuttonPosition {
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
        self.nextVCButton.center = (CGPoint){self.nextVCButton.center.x, 160};
    }
    else {
        self.nextVCButton.center = (CGPoint){self.nextVCButton.center.x, 90};
    }
}

- (void)viewWillLayoutSubviews {
    [self updateNextVCbuttonPosition];
}

- (void)initializeAutoresizingMasks {
    [self.nextVCButton setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin
                                         | UIViewAutoresizingFlexibleRightMargin];
    [self.colorField setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin
                                       | UIViewAutoresizingFlexibleBottomMargin
                                       | UIViewAutoresizingFlexibleWidth];
    [self.redSlider setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin
                                      | UIViewAutoresizingFlexibleBottomMargin
                                      | UIViewAutoresizingFlexibleWidth];
    [self.greenSlider setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin
                                        | UIViewAutoresizingFlexibleBottomMargin
                                        | UIViewAutoresizingFlexibleWidth];
    [self.blueSlider setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin
                                       | UIViewAutoresizingFlexibleBottomMargin
                                       | UIViewAutoresizingFlexibleWidth];
}

- (void)colorValueChanged:(UITextField *)sender {
    NSString *hexColorString = sender.text;
    self.view.backgroundColor = [[self class] colorFromHexString:hexColorString];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    NSUInteger baseValue;
    [[NSScanner scannerWithString:hexString] scanHexInt:&baseValue];
    float red = ((baseValue >> 16) & 0xFF)/255.0f;
    float green = ((baseValue >> 8) & 0xFF)/255.0f;
    float blue = ((baseValue >> 0) & 0xFF)/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

- (void)colorValueEntered:(UITextField *)sender {
    [sender resignFirstResponder];
}

@end