#import <UIKit/UIKit.h>


@interface ColorSliderVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UISlider *slider;

- (void)updateOutputLabel;

@end