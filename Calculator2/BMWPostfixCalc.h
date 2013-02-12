//
//  BMWPostfixCalc.h
//  Calculator2
//
//  Created by Benjamin Wang on 2/11/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMWstack.h"

@interface BMWPostfixCalc : NSObject {
    NSArray *operators;
    BMWStack *stack;
}

- (BMWPostfixCalc*) init;

- (NSDecimalNumber*) evaluate:(NSString*) postFixLineObject;


@end
