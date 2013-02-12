//
//  BMWPostfixCalc.m
//  Calculator2
//
//  Created by Benjamin Wang on 2/11/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWPostfixCalc.h"
#import "BMWShunting-Yard.h"
#import "BMWShunting-Yard.m"

@implementation BMWPostfixCalc

- (BMWPostfixCalc*) init {
    self = [super init];
    return self;
}

- (NSDecimalNumber*) evaluate:(NSString *)postFixLineObject {
    NSMutableArray* tokenArr = [self tokenize: postFixLineObject];
    NSDecimalNumber* result;
    BMWStack* stacks = [[BMWStack alloc] init];
    //need to put things into the stack...
    
    for (int i = 0; i < [tokenArr count]; i++) {
        
        NSString* temp = [(NSMutableArray*)tokenArr objectAtIndex:i];
    
        if ([temp isEqualToString:@"+"]) {
            NSDecimalNumber* b = [stacks pop];
            NSDecimalNumber* a = [stacks pop];
            result = [a decimalNumberByAdding:b];
        }
        else if ([temp isEqualToString:@"-"]) {
            NSDecimalNumber* b = (NSDecimalNumber*) [stacks pop];
            NSDecimalNumber* a = (NSDecimalNumber*) [stacks pop];
            result = [a decimalNumberBySubtracting:b];
        }
        else if ([temp isEqualToString:@"*"]) {
            NSDecimalNumber* b = (NSDecimalNumber*) [stacks pop];
            NSDecimalNumber* a = (NSDecimalNumber*) [stacks pop];
            result = [a decimalNumberByMultiplyingBy:b];
        }
        else if ([temp isEqualToString:@"^"]) {
            NSDecimalNumber* b = (NSDecimalNumber*) [stacks pop];
            NSDecimalNumber* a = (NSDecimalNumber*) [stacks pop];
            result = [a decimalNumberByRaisingToPower:b];
        }
        else if ([temp isEqualToString:@"/"]) {
            NSDecimalNumber* b = (NSDecimalNumber*) [stacks pop];
            NSDecimalNumber* a = (NSDecimalNumber*) [stacks pop];
            if ([b isEqual:[NSDecimalNumber zero]]) {
                NSLog(@"Cannot divide by zero");
                //send error message to controller!
                return [NSDecimalNumber notANumber];
            }
            else {
                result = [a decimalNumberByDividingBy:b];
            }
        } else {
            [stacks push:temp];
        }
    }
    if ([stacks isEmpty]) {
        return result;
    } else {
        return nil;
    }
    return result;
    
    
}

- (NSMutableArray*) tokenize: (NSString*) expression {
    int expressionLength = [expression length];
    NSMutableArray* tokenArr = [NSMutableArray arrayWithCapacity: expressionLength];
    
    NSMutableString *numToken = [NSMutableString stringWithCapacity:4];
    
    //Add numbers and tokens to stack
    for (int i = 0; i < expressionLength; i++) {
        UniChar ch = [expression characterAtIndex:i];
        switch (ch) {
                //operands and parens
            case '+':
            case '-':
            case '*':
            case '/':
            case '^':
            case '(':
            case ')':
                if ([numToken length] > 0) {
                    [tokenArr addObject: [NSString stringWithString: numToken]];
                    [numToken setString: @""];
                }
                [tokenArr addObject:[NSString stringWithCharacters:&ch length:1]];
                break;
                
                //numbers
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
            case '.':
                [numToken appendString:[NSString stringWithCharacters:&ch length:1]];
                break;
                
            default:
                NSLog(@"Input, %ch, is not supported!", ch);
                break;
        }
    }
    
    if ([numToken length] > 0) {
        [tokenArr addObject:[NSString stringWithString:numToken]];
    }
    
    return tokenArr;
}

@end
