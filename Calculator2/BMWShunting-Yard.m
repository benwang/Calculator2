//
//  BMWShunting-Yard.m
//  Calculator2
//
//  Created by Benjamin Wang on 2/10/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWShunting-Yard.h"

@interface BMWShunting_Yard ()
    - (BOOL) precedence:(NSString*) operator1 isGreaterorEqual:(NSString*) operator2;
    - (NSUInteger) operatorPrecedenceInt:(NSString*) operator;
    - (BOOL) balancedParens:(NSString *) input;
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
    
    BMWStack * operators = [[BMWStack alloc] init];
    NSMutableString* output = [NSMutableString stringWithCapacity:[input length]];
    
    NSMutableArray * lineToken = [self tokenize: input];
    
    
}



- (BOOL) precedence:(NSString*) operator1 isGreaterorEqual:(NSString*) operator2 {
    int op1 = operatorPrecedenceInt(operator1);
    int op2 = operatorPrecedenceInt(operator2);
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

@end
