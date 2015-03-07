
#import "ColoredVC.h"

@interface ColoredVC ()

@property (strong, nonatomic) UIButton *createVCButton;
@property (strong, nonatomic) UISlider *slider4RedColor;
@property (strong, nonatomic) UISlider *slider4GreenColor;
@property (strong, nonatomic) UISlider *slider4BlueColor;

-(void) setBackgroudColorWithR:(float) red
                             G:(float) green
                             B:(float) blue;

@end

@implementation ColoredVC

@synthesize createVCButton = createVCButton_;
@synthesize slider4RedColor = slider4RedColor_;
@synthesize slider4GreenColor = slider4GreenColor_;
@synthesize slider4BlueColor = slider4BlueColor_;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Self reference
    self.navigationItem.title = [NSString stringWithFormat:@"ColoredVC - %d",[self.navigationController.viewControllers indexOfObject:self]];
    [self setBackgroudColorWithR:15 G:200 B:35];
    
    // init UIButton
    
    createVCButton_ = [[UIButton alloc] initWithFrame:(CGRect) {50,50, 150, 50}];
    createVCButton_.backgroundColor = [UIColor blackColor];
    [createVCButton_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [createVCButton_.titleLabel setFont:[UIFont systemFontOfSize:8]];
    [createVCButton_ setTitle:@"Create new VC" forState:UIControlStateNormal];
    [createVCButton_ addTarget:self
                        action:@selector(buttonTap:)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createVCButton_];
    
    
    // init sliders
    slider4RedColor_ = [[UISlider alloc] initWithFrame:(CGRect) {0.0, 150.0, 200.0, 5.0}];
    [self initSlider:slider4RedColor_];
    slider4GreenColor_ = [[UISlider alloc] initWithFrame:(CGRect) {0.0, 200.0, 200.0, 5.0}];
    [self initSlider:slider4GreenColor_];
    slider4BlueColor_ = [[UISlider alloc] initWithFrame:(CGRect) {0.0, 250.0, 200.0, 5.0}];
    [self initSlider:slider4BlueColor_];
    
    [self setBackgroudColorWithR:[slider4RedColor_ value]
                               G:[slider4GreenColor_ value]
                               B:[slider4BlueColor_ value]];
}

-(void)buttonTap:(UIButton *) sender
{
    if (!!self.navigationController)
    {
        ColoredVC   *newColoredVC = [[ColoredVC alloc] init];
        [self.navigationController pushViewController:newColoredVC animated:YES];
    }
    
}

-(void)sliderValueChanged
{
    [self setBackgroudColorWithR:[slider4RedColor_ value]
                               G:[slider4GreenColor_ value]
                               B:[slider4BlueColor_ value]];
}


-(void) setBackgroudColorWithR:(float)red G:(float)green B:(float)blue
{
    if (!!self.view)
    {
        self.view.backgroundColor = [UIColor colorWithRed:(red/255.0)
                                                    green:(green/255.0)
                                                     blue:(blue/255.0)
                                                    alpha:(1.0)];
    }
}

-(void) initSlider:(UISlider*) slider
{
    if (slider)
    {
        [slider addTarget:self action:@selector(sliderValueChanged) forControlEvents:UIControlEventValueChanged];
        slider.minimumValue = 0.0;
        slider.maximumValue = 250.0;
        slider.value = 25.0;
        [self.view addSubview:slider];
    }
}

@end
