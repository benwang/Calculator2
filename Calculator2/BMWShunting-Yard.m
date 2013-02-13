//
//  BMWShunting-Yard.m
//  Calculator2
//
//  Created by Benjamin Wang on 2/10/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWShunting-Yard.h"

@interface BMWShunting_Yard ()
    - (BOOL) isNum:(NSString*) stringObj;
    - (BOOL) isOp:(NSString*)stringObj;
    - (BOOL) precedence:(NSString*) operator1 isGreaterorEqual:(NSString*) operator2;
    - (NSUInteger) operatorPrecedenceInt:(NSString*) operator;
    - (BOOL) balancedParens:(NSString *) input;
    - (NSMutableArray*) tokenize: (NSString*) expression;
@end

@implementation BMWShunting_Yard

- (BMWShunting_Yard*) init {
    self = [super init];
    
    return self;
}

- (NSString*) parseInput:(NSString *)input {
    if (![self balancedParens:input]) {
//        [self error:@"Unbalanced parens"];
        return nil;
    }
    BMWStack *operators = [[BMWStack alloc] init];
    NSMutableString *output = [NSMutableString stringWithCapacity:[input length]];
    NSMutableArray *lineToken = [self tokenize: input];
//    NSMutableArray *output = [NSMutableArray arrayWithCapacity: [lineToken count]];

    
    for (int i = 0; i < [lineToken count]; i++) {
        NSString *temp = [lineToken objectAtIndex:i];

        if ([self isNum:temp]) {
            [output appendString:[NSString stringWithFormat:@"%@ ", temp]];
        }
        else if ([self isOp:temp]){
            [operators push:temp];
        }
        else if ([temp isEqualToString:@"("]) {
            [operators push:temp];
        }
        else if ([temp isEqualToString:@")"]) {
            NSString * op = [operators pop];
            while (op && !([op isEqualToString:@"("])) {
                [output appendString:[NSString stringWithFormat:@"%@ ", op]];
                op = [operators pop];
            }
            if (!op || !([op isEqualToString:@"("])) {
                NSLog(@"Unequal Parens!!");
                return nil;
            }
        }
        else {
            [output appendString: [NSString stringWithFormat:@"%@ ", temp]];
        }
    }
    
    while (! [operators isEmpty]) {
        [output appendString: [NSString stringWithFormat:@"%@ ",[operators pop]]];
    }
    NSLog(@"Postfix output: %@", output);
    return output;
}

- (BOOL) isNum:(NSString *)stringObj {
    return !([stringObj isEqualToString:@"^"] || [stringObj isEqualToString:@"+"] || [stringObj isEqualToString:@"-"] || [stringObj isEqualToString:@"*"] || [stringObj isEqualToString:@"/"] || [stringObj isEqualToString:@"("] || [stringObj isEqualToString:@")"]);
}

- (BOOL) isOp:(NSString*)stringObj {
    return [stringObj isEqualToString:@"^"] || [stringObj isEqualToString:@"+"] || [stringObj isEqualToString:@"-"] || [stringObj isEqualToString:@"*"] || [stringObj isEqualToString:@"/"];
}

- (BOOL) precedence:(NSString*) operator1 isGreaterorEqual:(NSString*) operator2 {
    int op1 = [self operatorPrecedenceInt: operator1];
    int op2 = [self operatorPrecedenceInt: operator2];
    return op1 >= op2;
}

- (NSUInteger) operatorPrecedenceInt:(NSString*) operator {
    if ([operator isEqual: @"+"] || [operator isEqual: @"-"]) {
        return 2;
    }
    else if ([operator isEqual: @"*"] || [operator isEqual: @"/"]) {
        return 3;
    }
    else if ([operator isEqual: @"^"]) {
        return 4;
    }
    else return 0;
}

- (BOOL) balancedParens:(NSString *) input {
    int openParens = 0;
    int closedParens = 0;
    
    for(int i = 0; i < input.length; i++) {
        if ([input characterAtIndex:i] == '(') {
            openParens++;
        }
        if ([input characterAtIndex:i] == ')') {
            closedParens++;
        }
    }
            
    return openParens == closedParens;
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
            case ' ':
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











