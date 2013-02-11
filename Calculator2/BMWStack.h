//
//  BMWStack.h
//  Calculator2
//
//  Created by Benjamin Wang on 2/9/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMWStack : NSObject {
    NSMutableArray *mutArray;
}

- (BMWStack*) init;

- (void) push : (id) object;

- (int) length;

- (id) pop;

- (id) peek;

- (BOOL) isEmpty;

@end
