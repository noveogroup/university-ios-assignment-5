#import "ColorSliderVC.h"


@interface ColorSliderVC ()

@property (strong, nonatomic) IBOutlet UILabel *output;

@end


@implementation ColorSliderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateOutputLabel];
    [self.slider addTarget:self
                    action:@selector(sliderValueChanged:)
          forControlEvents:UIControlEventValueChanged];
}

- (void)updateOutputLabel {
    self.output.text = [NSString stringWithFormat:@"%.f", self.slider.value * 255];
}

- (void)sliderValueChanged:(UISlider *)sender {
    [self updateOutputLabel];
}

@end
