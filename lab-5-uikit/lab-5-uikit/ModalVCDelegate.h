//
//  ModalVCDelegate.h
//  lab-5-uikit
//
//  Created by Admin on 31/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModalVC;


@protocol ModalVCDelegate <NSObject>

@required
- (void) modalViewFinished:(ModalVC *)modalVC;

@end
