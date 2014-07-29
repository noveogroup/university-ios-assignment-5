#import <UIKit/UIKit.h>

@interface RecursiveVC : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *field;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
        name:(NSString *)name;

@end
