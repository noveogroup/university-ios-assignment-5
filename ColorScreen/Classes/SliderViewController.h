
#import <UIKit/UIKit.h>

@interface SliderViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;

@property (strong, nonatomic) IBOutlet UILabel *labelRedValue;
@property (strong, nonatomic) IBOutlet UILabel *labelGreenValue;
@property (strong, nonatomic) IBOutlet UILabel *labelBlueValue;


@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UIView *firstView;





@end
