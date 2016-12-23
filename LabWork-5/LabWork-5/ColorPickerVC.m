#import "ColorPickerVC.h"


static NSString *const BACK_BUTTON_TEXT = @"Back";


@interface ColorPickerVC ()

// UI elements
@property (strong, nonatomic) UIButton *nextVCButton;
@property (strong, nonatomic) UITextField *colorField;
@property (strong, nonatomic) UILabel *colorLabel;

// View controllers
@property (strong, nonatomic) ColorSliderVC *redSliderVC;
@property (strong, nonatomic) ColorSliderVC *greenSliderVC;
@property (strong, nonatomic) ColorSliderVC *blueSliderVC;

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
    
    // Initialize default background color
    [self updateBackgroundColorAndControls:[UIColor whiteColor]];
}

- (void)initializeElements {
    // Initialize nextVC button
    NSInteger buttonRadius = 50;
    CGRect nextVCButtonFrame = {
        self.view.bounds.size.width / 2 - buttonRadius,
        110,
        buttonRadius * 2,
        buttonRadius * 2
    };
    self.nextVCButton = [[UIButton alloc] initWithFrame:nextVCButtonFrame];
    self.nextVCButton.layer.masksToBounds = YES;
    self.nextVCButton.layer.cornerRadius = buttonRadius;
    self.nextVCButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.nextVCButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nextVCButton setTitle:@"Push to\nnext VC" forState:UIControlStateNormal];
    [self updateNextVCbuttonPosition];
    [self.view addSubview:self.nextVCButton];
    
    // Initialize color text field with it's label
    NSInteger fieldMargin = 110;
    NSInteger fieldHeight = 30;
    NSInteger yPosIndex = 5; // Index for calculating "y" position of elements
    CGRect colorFieldFrame = {
        fieldMargin,
        (self.view.bounds.size.height - fieldHeight) / 10 * yPosIndex,
        self.view.bounds.size.width - fieldMargin * 2,
        fieldHeight
    };
    self.colorField = [[UITextField alloc] initWithFrame: colorFieldFrame];
    self.colorField.textAlignment = NSTextAlignmentCenter;
    self.colorField.borderStyle = UITextBorderStyleRoundedRect;
    self.colorField.placeholder = @"######";
    self.colorField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.colorField];
    CGRect colorLabelFrame = {
        10,
        self.colorField.frame.origin.y,
        100,
        fieldHeight
    };
    self.colorLabel = [[UILabel alloc] initWithFrame:colorLabelFrame];
    self.colorLabel.text = @"Hex Color: #";
    self.colorLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(colorLabelTapped:)];
    [self.colorLabel addGestureRecognizer:tap];
    [self.view addSubview:self.colorLabel];
    
    
    // Initialize color sliders with their controllers
    NSInteger sliderHeight = 30;
    
    // Initialize red slider with it's controller
    self.redSliderVC = [[ColorSliderVC alloc]
                        initWithNibName:NSStringFromClass([ColorSliderVC class])
                                 bundle:[NSBundle mainBundle]];
    yPosIndex = 6;
    CGRect redSliderFrame = {
        0,
        (self.view.bounds.size.height - sliderHeight) / 10 * yPosIndex,
        self.view.bounds.size.width,
        sliderHeight
    };
    self.redSliderVC.view.frame = redSliderFrame;
    self.redSliderVC.label.text = @"Red:";
    [self.view addSubview:self.redSliderVC.view];
    
    // Initialize green slider with it's controller
     self.greenSliderVC = [[ColorSliderVC alloc]
                           initWithNibName:NSStringFromClass([ColorSliderVC class])
                                    bundle:[NSBundle mainBundle]];
    yPosIndex = 7;
    CGRect greenSliderFrame = {
        0,
        (self.view.bounds.size.height - sliderHeight) / 10 * yPosIndex,
        self.view.bounds.size.width,
        sliderHeight
    };
    self.greenSliderVC.view.frame = greenSliderFrame;
    self.greenSliderVC.label.text = @"Green:";
    [self.view addSubview:self.greenSliderVC.view];
    
    // Initialize blue slider with it's controller
    self.blueSliderVC = [[ColorSliderVC alloc]
                         initWithNibName:NSStringFromClass([ColorSliderVC class])
                                  bundle:[NSBundle mainBundle]];
    yPosIndex = 8;
    CGRect blueSliderFrame = {
        0,
        (self.view.bounds.size.height - sliderHeight) / 10 * yPosIndex,
        self.view.bounds.size.width,
        sliderHeight
    };
    self.blueSliderVC.view.frame = blueSliderFrame;
    self.blueSliderVC.label.text = @"Blue:";
    [self.view addSubview:self.blueSliderVC.view];
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
    [self.redSliderVC.slider addTarget:self
                       action:@selector(colorSliderValueChanged:)
             forControlEvents:UIControlEventValueChanged];
    [self.greenSliderVC.slider addTarget:self
                         action:@selector(colorSliderValueChanged:)
               forControlEvents:UIControlEventValueChanged];
    [self.blueSliderVC.slider addTarget:self
                        action:@selector(colorSliderValueChanged:)
              forControlEvents:UIControlEventValueChanged];
    [self.nextVCButton addTarget:self
                          action:@selector(buttonTouchDownAnimation:)
                forControlEvents:(UIControlEventTouchDown)];
    [self.nextVCButton addTarget:self
                          action:@selector(buttonTouchUpAnimation:)
                forControlEvents:(UIControlEventTouchUpInside)];
    [self.nextVCButton addTarget:self
                          action:@selector(buttonTouchUpAnimation:)
                forControlEvents:(UIControlEventTouchDragExit)];
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
    self.nextVCButton.center = (CGPoint){self.nextVCButton.center.x,
                                         self.view.bounds.size.height / 7 * 2};
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
    [self.colorLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin
                                       | UIViewAutoresizingFlexibleBottomMargin];
    [self.redSliderVC.view setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin
                                             | UIViewAutoresizingFlexibleBottomMargin
                                             | UIViewAutoresizingFlexibleWidth];
    [self.greenSliderVC.view setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin
                                               | UIViewAutoresizingFlexibleBottomMargin
                                               | UIViewAutoresizingFlexibleWidth];
    [self.blueSliderVC.view setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin
                                              | UIViewAutoresizingFlexibleBottomMargin
                                              | UIViewAutoresizingFlexibleWidth];
}

- (void)colorValueChanged:(UITextField *)sender {
    NSString *hexColorString = sender.text;
    unsigned baseValue;
    [[NSScanner scannerWithString:hexColorString] scanHexInt:&baseValue];
    float red = ((baseValue >> 16) & 0xFF)/255.0f;
    float green = ((baseValue >> 8) & 0xFF)/255.0f;
    float blue = ((baseValue >> 0) & 0xFF)/255.0f;
    [self updateSlidersWithRed:red green:green blue:blue];
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    [self updateBackgroundColors: newColor];
}

// Update sliders' values and their output labels
- (void)updateSlidersWithRed:(float)redValue green:(float)greenValue blue:(float)blueValue {
    self.redSliderVC.slider.value = redValue;
    self.greenSliderVC.slider.value = greenValue;
    self.blueSliderVC.slider.value = blueValue;
    [self.redSliderVC updateOutputLabel];
    [self.greenSliderVC updateOutputLabel];
    [self.blueSliderVC updateOutputLabel];
}

- (void)colorValueEntered:(UITextField *)sender {
    [sender resignFirstResponder];
    
    // Fill color field by valid hex value got from background color
    CGFloat red, green, blue, alpha;
    [self.view.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
    [self updateHexColorValueWithRed:red green:green blue:blue];
}

- (void)colorSliderValueChanged:(UISlider *)sender {
    float red = self.redSliderVC.slider.value;
    float green = self.greenSliderVC.slider.value;
    float blue = self.blueSliderVC.slider.value;
    [self updateHexColorValueWithRed:red green:green blue:blue];
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    [self updateBackgroundColors: newColor];
}

- (void)updateHexColorValueWithRed:(float)redValue green:(float)greenValue blue:(float)blueValue {
    self.redSliderVC.slider.value = redValue;
    self.greenSliderVC.slider.value = greenValue;
    self.blueSliderVC.slider.value = blueValue;
    NSString *hexColorString = [NSString stringWithFormat:@"%02X%02X%02X",
                                (int)(redValue * 255),
                                (int)(greenValue * 255),
                                (int)(blueValue * 255)];
    self.colorField.text = hexColorString;
}

// Updates background color and values of color sliders and color text field
- (void)updateBackgroundColorAndControls:(UIColor *)color {
    [self updateBackgroundColors:color];
    CGFloat red, green, blue, alpha;
    [self.view.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
    [self updateSlidersWithRed:red green:green blue:blue];
    [self updateHexColorValueWithRed:red green:green blue:blue];
}

- (void)updateBackgroundColors:(UIColor *)color {
    self.view.backgroundColor = color;
    self.nextVCButton.backgroundColor = [[self class] invertColor:color];
}

+ (UIColor *)invertColor:(UIColor *)color {
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    return [UIColor colorWithRed:1.-red green:1.-green blue:1.-blue alpha:alpha];
}

- (void)buttonTouchDownAnimation:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        sender.alpha = 0.5;
    }];
}

- (void)buttonTouchUpAnimation:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        sender.alpha = 1.0;
    }];
}

- (void)colorLabelTapped:(UILabel *)sender {
    [self.colorField becomeFirstResponder];
}

@end