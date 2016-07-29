//
//  MoreInfoVCDelegateProtocol.h
//  VC-practice
//

@class MoreInfoVC;

@protocol MoreInfoVCDelegate <NSObject>

- (void)cancelDidTouch:(MoreInfoVC *)viewController;

@end