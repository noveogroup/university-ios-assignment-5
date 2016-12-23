//
//  ViewController.h
//  UIKitApplication
//
//  Created by Иван Букшев on 3/3/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformationVCDelegate.h"

@interface ViewController : UIViewController

@property id<InformationVCDelegate> delegate;

@end
