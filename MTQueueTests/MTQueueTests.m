//
//  MTQueueTests.m
//  MTQueueTests
//
//  Created by Adam Kirk on 2/6/13.
//  Copyright (c) 2013 Mysterious Trousers. All rights reserved.
//

#import "MTQueueTests.h"
#import "MTQueue.h"


#define STALL(c) while (c) { [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.5]]; }


@implementation MTQueueTests



- (void)testMain
{
    __block BOOL test = NO;
    [MTQueue main:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testCoreData
{
    __block BOOL test = NO;
    [MTQueue coreData:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testNetwork
{
    __block BOOL test = NO;
    [MTQueue network:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testFile
{
    __block BOOL test = NO;
    [MTQueue file:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}


// GCD

- (void)testBackground
{
    __block BOOL test = NO;
    [MTQueue background:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);

    dispatch_async(dispatch_get_main_queue(), ^{

    });
}

- (void)testDefault
{
    __block BOOL test = NO;
    [MTQueue def:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testHighPriority
{
    __block BOOL test = NO;
    [MTQueue high:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testLowPriority
{
    __block BOOL test = NO;
    [MTQueue low:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}



@end
