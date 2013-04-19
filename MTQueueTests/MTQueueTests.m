//
//  MTQueueTests.m
//  MTQueueTests
//
//  Created by Adam Kirk on 2/6/13.
//  Copyright (c) 2013 Mysterious Trousers. All rights reserved.
//

#import "MTQueueTests.h"
#import "MTq.h"


#define STALL(c) while (c) { [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.5]]; }


@implementation MTQueueTests



- (void)testMain
{
    __block BOOL test = NO;
    [MTq main:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testCoreData
{
    __block BOOL test = NO;
    [MTq coreData:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testNetwork
{
    __block BOOL test = NO;
    [MTq network:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testFile
{
    __block BOOL test = NO;
    [MTq file:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}


// GCD

- (void)testBackground
{
    __block BOOL test = NO;
    [MTq background:^{
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
    [MTq def:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testHighPriority
{
    __block BOOL test = NO;
    [MTq high:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testLowPriority
{
    __block BOOL test = NO;
    [MTq low:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}

- (void)testLongSyntax
{
    __block BOOL test = NO;
    [MTQueue low:^{
        test = YES;
    }];
    STALL(!test);
    STAssertTrue(test, nil);
}


@end
