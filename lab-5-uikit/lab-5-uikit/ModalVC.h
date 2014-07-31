//
//  ModalVC.h
//  lab-5-uikit
//
//  Created by Admin on 31/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalVCDelegate.h"

@interface ModalVC : UIViewController

@property id<ModalVCDelegate> delegate;

@end
