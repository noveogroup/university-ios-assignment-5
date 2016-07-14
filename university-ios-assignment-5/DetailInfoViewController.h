//
//  detailInfoViewController.h
//  university-ios-assignment-5
//
//  Created by admin on 14/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailInfoViewControllerDelegate <NSObject>

- (void)closeDetailInfo;

@end

@interface DetailInfoViewController : UIViewController

@property (nonatomic,weak) id <DetailInfoViewControllerDelegate> delegate;

@end
