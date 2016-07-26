
#import <UIKit/UIKit.h>

@class AboutVC;


@protocol AboutVCDelegate <NSObject>

- (void)aboutViewControllerDidFinish:(AboutVC *)sender;

@end


@interface AboutVC : UIViewController

@property (nonatomic, weak) id<AboutVCDelegate> delegate;

@end
