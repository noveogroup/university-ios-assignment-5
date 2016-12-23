
#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *redComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueComponentSlider;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

- (IBAction)actionSlider:(UISlider *)sender;


@end
