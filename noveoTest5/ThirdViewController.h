#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonBack;

- (IBAction)showAlertAction:(id)sender;
- (IBAction)showDetailInfoAction:(id)sender;

@end
