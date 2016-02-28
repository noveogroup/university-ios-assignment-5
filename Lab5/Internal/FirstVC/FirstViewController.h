
#import <UIKit/UIKit.h>

extern NSString* kFirstStoryboardName;
extern NSString* kFirstViewControllerID;

@interface FirstViewController : UIViewController <UITextFieldDelegate>

- (IBAction)showNextVCAction:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *setColorTextField;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

- (IBAction)sliderAction:(id)sender;

@end
