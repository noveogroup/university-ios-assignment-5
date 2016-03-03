
#import "SliderViewController.h"
#import "UIColor+HexColors.h"


@implementation SliderViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.redSlider.value = 1.f;
        self.greenSlider.value = 1.f;
        self.blueSlider.value = 1.f;

    }
    return self;
}




@end
