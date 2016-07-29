//
//  MoreInfoVC.h
//  VC-practice
//

#import <UIKit/UIKit.h>
#import "MoreInfoVCDelegateProtocol.h"

@class AthorViewController;

@interface MoreInfoVC : UIViewController

@property (nonatomic, weak) id<MoreInfoVCDelegate> delegate;

@end
