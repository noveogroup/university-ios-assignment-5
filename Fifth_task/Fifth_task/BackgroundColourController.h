//
//  BackgroundColourController.h
//  Fifth_task
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 MyCompanyName. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BackgroundColourController : UIViewController
-(instancetype)initWithName:(NSString*)name andLevel:(NSUInteger)level;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIButton *nextLevelButton;
@end
