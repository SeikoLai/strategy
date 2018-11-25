//
//  ViewController.h
//  StrategyExample
//
//  Created by Sam Lai on 2018/3/31.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumericInputValidator.h"
#import "AlphaInputValidator.h"
#import "CustomTextField.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet CustomTextField *numericTextField;
@property (nonatomic, strong) IBOutlet CustomTextField *alphaTextField;

@end

