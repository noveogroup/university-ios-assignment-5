//
//  UIColor.h
//  Task5
//
//  Created by Sergey Plotnikov on 18.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hexadecimal)

+ (UIColor *)colorWithHexString:(NSString *)hexString error:(NSError *__autoreleasing *)error;

@end
