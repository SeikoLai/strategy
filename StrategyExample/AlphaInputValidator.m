//
//  AlphaInputValidator.m
//  StrategyExample
//
//  Created by Sam Lai on 2018/3/31.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import "AlphaInputValidator.h"

@implementation AlphaInputValidator

- (BOOL)validateInput:(UITextField *)input error:(NSError **)error
{
    NSError *regError = nil;
    NSRegularExpression *regex = [super regularExpressionPattern:@"^[a-zA-Z]*$" error:&regError];
    NSUInteger numberOfMatches = [super numberOfMatchesInput:input fromRegularExpression:regex];
    
    if (error != nil) {
        *error = [super validationErrorWithMessage:@"The input can contain only letters" code:1002];
    }
    if (numberOfMatches == 0) {
        return NO;
    }
    return YES;
}

@end
