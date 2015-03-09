
#import "ColoredVC.h"


const CGFloat INDENT = 50;
const CGFloat ButtonHeight = 50;
const CGFloat SliderHeight = 5;


@interface ColoredVC ()

@property (strong, nonatomic) UIButton *createVCButton;
@property (strong, nonatomic) UISlider *slider4RedColor;
@property (strong, nonatomic) UISlider *slider4GreenColor;
@property (strong, nonatomic) UISlider *slider4BlueColor;

-(void) setBackgroudColorWithR:(CGFloat) red
                             G:(CGFloat) green
                             B:(CGFloat) blue;

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
    
    // init UIButton
    
    createVCButton_ = [[UIButton alloc] init];
    createVCButton_.frame = CGRectMake(0,INDENT, self.view.bounds.size.width/2, ButtonHeight);
    
    createVCButton_.backgroundColor = [UIColor blackColor];
    [createVCButton_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [createVCButton_.titleLabel setFont:[UIFont systemFontOfSize:8]];
    [createVCButton_ setTitle:@"Create new VC" forState:UIControlStateNormal];
    [createVCButton_ addTarget:self
                        action:@selector(buttonTap:)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createVCButton_];
    
    
    // init sliders
    slider4RedColor_ = [[UISlider alloc] init];
    slider4RedColor_.frame = CGRectMake(0, INDENT*3, self.view.bounds.size.width, SliderHeight);
    [self initSlider:slider4RedColor_];
    
    slider4GreenColor_ = [[UISlider alloc] init];
    slider4GreenColor_.frame = CGRectMake(0, INDENT*4, self.view.bounds.size.width, SliderHeight);
    [self initSlider:slider4GreenColor_];
    
    slider4BlueColor_ = [[UISlider alloc] init];
    slider4BlueColor_.frame = CGRectMake(0, INDENT*5, self.view.bounds.size.width, SliderHeight);
    [self initSlider:slider4BlueColor_];
    
    [self setBackgroudColorWithR:[slider4RedColor_ value]
                               G:[slider4GreenColor_ value]
                               B:[slider4BlueColor_ value]];
}

-(void)buttonTap:(UIButton *) sender
{
    ColoredVC   *newColoredVC = [[ColoredVC alloc] init];
    [self.navigationController pushViewController:newColoredVC animated:YES];
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
