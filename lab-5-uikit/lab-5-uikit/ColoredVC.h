//
//  ColoredVC.h
//  lab-5-uikit
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColoredVC : UIViewController <UITextFieldDelegate>

@property (nonatomic) int depth;

- (instancetype)initWithTitlePrefix:(NSString *)titlePrefix andDepth:(unsigned int)depth;
- (instancetype)initWithTitlePrefix:(NSString *)titlePrefix;


@end
