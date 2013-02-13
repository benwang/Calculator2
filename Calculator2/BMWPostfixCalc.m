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

//- (NSMutableArray*) tokenize: (NSString*) expression {
//    int expressionLength = [expression length];
//    NSMutableArray* tokenArr = [NSMutableArray arrayWithCapacity: expressionLength];
//    
//    NSMutableString *numToken = [NSMutableString stringWithCapacity:4];
//    
//    //Add numbers and tokens to stack
//    for (int i = 0; i < expressionLength; i++) {
//        UniChar ch = [expression characterAtIndex:i];
//        switch (ch) {
//                //operands and parens
//            case '+':
//            case '-':
//            case '*':
//            case '/':
//            case '^':
//            case '(':
//            case ')':
//                if ([numToken length] > 0) {
//                    [tokenArr addObject: [NSString stringWithString: numToken]];
//                    [numToken setString: @""];
//                }
//                [tokenArr addObject:[NSString stringWithCharacters:&ch length:1]];
//                break;
//                
//                //numbers
//            case '0':
//            case '1':
//            case '2':
//            case '3':
//            case '4':
//            case '5':
//            case '6':
//            case '7':
//            case '8':
//            case '9':
//            case '.':
//                [numToken appendString:[NSString stringWithCharacters:&ch length:1]];
//                break;
//            case ' ':
//                break;
//            default:
//                NSLog(@"Input, %ch, is not supported!", ch);
//                break;
//        }
//    }
//    
//    if ([numToken length] > 0) {
//        [tokenArr addObject:[NSString stringWithString:numToken]];
//    }
//    
//    return tokenArr;
//}
//
@end
