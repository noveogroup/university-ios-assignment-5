//
//  ColoredVC.h
//  lab-5-uikit
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColoredVC : UIViewController

@property (nonatomic) int depth;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;

- (instancetype)initWithTitlePrefix:(NSString *)titlePrefix;
- (instancetype)initWithTitlePrefix:(NSString *)titlePrefix andDepth:(unsigned int)depth;

@end
