//
//  BMWStack.m
//  Calculator2
//
//  Created by Benjamin Wang on 2/9/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWStack.h"

@implementation BMWStack

- (BMWStack*) init {
    self = [super init];
    mutArray = [[NSMutableArray alloc] initWithCapacity:30];
    return self;
}

- (void) push : (id) obj {
    [mutArray addObject: obj];
}

- (int) length {
    return [mutArray count];
}

- (id) pop {
    if (mutArray.count < 1) {
        return nil;
    }
    else {
        id temp = [mutArray lastObject];
        [mutArray removeLastObject];
        return temp;
    }
}

- (id) peek {
    if (mutArray.count < 1) {
        return nil;
    }
    else {
        return [mutArray lastObject];
    }
}

- (BOOL) isEmpty {
    if (mutArray.count == 0) {
        return TRUE;
    }
    else {
        return FALSE;
    }
}


@end
