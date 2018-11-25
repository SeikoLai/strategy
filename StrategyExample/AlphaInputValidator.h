//
//  AlphaInputValidator.h
//  StrategyExample
//
//  Created by Sam Lai on 2018/3/31.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import "InputValidator.h"

@interface AlphaInputValidator : InputValidator

- (BOOL)validateInput:(UITextField *)input error:(NSError **)error;

@end
