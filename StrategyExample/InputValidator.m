//
//  InputValidator.m
//  StrategyExample
//
//  Created by Sam Lai on 2018/3/31.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import "InputValidator.h"

@implementation InputValidator

- (BOOL)validateInput:(UITextField *)input error:(NSError **)error
{
    if (error != nil) {
        error = nil;
    }
    return NO;
}

- (NSRegularExpression *)regularExpressionPattern:(NSString *)pattern error:(NSError **)error
{
    NSError *regError = nil;
    return [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionAnchorsMatchLines error:&regError];
}

- (NSUInteger)numberOfMatchesInput:(UITextField *)input fromRegularExpression:(NSRegularExpression *)regex
{
    return [regex numberOfMatchesInString:input.text options:NSMatchingAnchored range:NSMakeRange(0, input.text.length)];
}

- (NSError *)validationErrorWithMessage:(NSString *)message code:(NSInteger)code
{
    NSString *description = NSLocalizedString(@"Input Validation Failed", @"");
    NSString *reason = NSLocalizedString(message, @"");
    
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description, NSLocalizedFailureReasonErrorKey : reason};
    
    return [NSError errorWithDomain:@"InputValidationErrorDomain" code:code userInfo:userInfo];
}

@end
