//
//  InformationViewController.h
//  UIKitApplication
//
//  Created by Иван Букшев on 3/5/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface InformationViewController : UIViewController <InformationVCDelegate>

- (IBAction)fullInfoButtonTap:(id)sender;
- (IBAction)aboutButtonTap:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *aboutButton;
@property (weak, nonatomic) IBOutlet UIButton *fullInfoButton;

@end
