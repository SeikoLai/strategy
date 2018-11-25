//
//  NumericInputValidator.m
//  StrategyExample
//
//  Created by Sam Lai on 2018/3/31.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import "NumericInputValidator.h"

@implementation NumericInputValidator

- (BOOL)validateInput:(UITextField *)input error:(NSError **)error
{
    NSError *regError = nil;
    NSRegularExpression *regex = [super regularExpressionPattern:@"^[0-9]*$" error:&regError];
    NSUInteger numberOfMatches = [super numberOfMatchesInput:input fromRegularExpression:regex];
    
    if (error != nil) {
        *error = [super validationErrorWithMessage:@"The input can contain only numerical values" code:1001];
    }
    if (numberOfMatches == 0) {
        return NO;
    }
    return YES;
}

@end
