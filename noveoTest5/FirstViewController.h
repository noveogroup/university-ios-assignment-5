//
//  FirstViewController.h
//  noveoTest5
//
//  Created by АлиДени on 13.03.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;


@property (weak, nonatomic) IBOutlet UISlider *redComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueComponentSlider;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

- (IBAction)actionSlider:(UISlider *)sender;
- (IBAction)actionEnabled:(UISwitch *)sender;

@end
