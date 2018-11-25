//
//  CustomTextField.h
//  StrategyExample
//
//  Created by Sam Lai on 2018/3/31.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputValidator.h"

@interface CustomTextField : UITextField

@property (nonatomic, strong) IBOutlet InputValidator *inputValidator;

- (BOOL)validate;

@end
