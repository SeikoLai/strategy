//
//  CustomTextField.m
//  StrategyExample
//
//  Created by Sam Lai on 2018/3/31.
//  Copyright © 2018 YSDT. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (BOOL)validate
{
    NSError *error = nil;
    
    BOOL validationResult = [self.inputValidator validateInput:self error:&error];
    
    if (!validationResult) {
        NSLog(@"%@: %@", error.localizedDescription, error.localizedFailureReason);
    }
    
    return validationResult;
}

@end
