//
//  InputValidator.h
//  StrategyExample
//
//  Created by Sam Lai on 2018/3/31.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InputValidator : NSObject

// A stub for any actual validation strategy
- (BOOL)validateInput:(UITextField *)input error:(NSError **)error;

- (NSRegularExpression *)regularExpressionPattern:(NSString *)pattern error:(NSError **)error;
- (NSUInteger)numberOfMatchesInput:(UITextField *)input fromRegularExpression:(NSRegularExpression *)regex;
- (NSError *)validationErrorWithMessage:(NSString *)message code:(NSInteger)code;

@end
