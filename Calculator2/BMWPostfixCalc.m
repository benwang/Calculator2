//
//  BMWPostfixCalc.m
//  Calculator2
//
//  Created by Benjamin Wang on 2/11/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWPostfixCalc.h"
#import "BMWShunting-Yard.h"

@implementation BMWPostfixCalc

- (BMWPostfixCalc*) init {
    self = [super init];
    return self;
}

- (NSDecimalNumber*) evaluate:(NSString *) postFixLineObject {
    NSString* trimmedPostfix = [postFixLineObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSDecimalNumber* answer;
    BMWStack* stacks = [[BMWStack alloc] init];
    NSArray *tokenArr = [trimmedPostfix componentsSeparatedByString:@" "];
    //need to put things into the stack...
    
    for (NSString* token in tokenArr) {
    
        if ([token isEqualToString:@"+"]) {
            NSDecimalNumber* b = [NSDecimalNumber decimalNumberWithString: [stacks pop]];
            NSDecimalNumber* a = [NSDecimalNumber decimalNumberWithString: [stacks pop]];

            answer = [a decimalNumberByAdding:b];
        }
        else if ([token isEqualToString:@"-"]) {
            NSDecimalNumber* b = [NSDecimalNumber decimalNumberWithString: [stacks pop]];
            NSDecimalNumber* a = [NSDecimalNumber decimalNumberWithString: [stacks pop]];
            
            answer = [a decimalNumberBySubtracting:b];
        }
        else if ([token isEqualToString:@"*"]) {
            NSDecimalNumber* b = [NSDecimalNumber decimalNumberWithString: [stacks pop]];
            NSDecimalNumber* a = [NSDecimalNumber decimalNumberWithString: [stacks pop]];
            
            answer = [a decimalNumberByMultiplyingBy:b];
        }
        else if ([token isEqualToString:@"^"]) {
            NSDecimalNumber* b = [NSDecimalNumber decimalNumberWithString: [stacks pop]];
            NSDecimalNumber* a = [NSDecimalNumber decimalNumberWithString: [stacks pop]];
            
            answer = [a decimalNumberByRaisingToPower:[b intValue]];
        }
        else if ([token isEqualToString:@"/"]) {
            NSDecimalNumber* b = [NSDecimalNumber decimalNumberWithString: [stacks pop]];
            NSDecimalNumber* a = [NSDecimalNumber decimalNumberWithString: [stacks pop]];
            
            if ([b isEqual:[NSDecimalNumber zero]]) {
                NSLog(@"Cannot divide by zero");
                //send error message to controller!
                return [NSDecimalNumber notANumber];
            }
            else {
                answer = [a decimalNumberByDividingBy:b];
            }
        } else {
            [stacks push:token];
        }
    }
    if ([stacks isEmpty]) {
        return answer;
    } else {
        return nil;
    }
    
    return answer;
}

@end
