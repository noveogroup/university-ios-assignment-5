//
//  InformationVCDelegate.h
//  UIKitApplication
//
//  Created by Иван Букшев on 3/5/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class InformationViewController;

@protocol InformationVCDelegate <NSObject>

- (void)infoViewFinished:(InformationViewController *)infoVC;

@end
