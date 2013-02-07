//
//  MTQueue.m
//  MTQueue
//
//  Created by Adam Kirk on 2/6/13.
//  Copyright (c) 2013 Mysterious Trousers. All rights reserved.
//

#import "MTq.h"

@implementation MTq


+ (NSOperationQueue *)main
{
	return [NSOperationQueue mainQueue];
}

+ (NSOperationQueue *)coreDataQueue
{
	static NSOperationQueue *queue = nil;
	if (!queue) {
		queue = [[NSOperationQueue alloc] init];
		queue.name = [self queueNameWithPurpose:@"coredata"];
		queue.maxConcurrentOperationCount = 1;
	}
	return queue;
}

+ (NSOperationQueue *)networkQueue
{
	static NSOperationQueue *queue = nil;
	if (!queue) {
		queue = [[NSOperationQueue alloc] init];
		queue.name = [self queueNameWithPurpose:@"network"];
	}
	return queue;
}

+ (NSOperationQueue *)fileSystemQueue
{
	static NSOperationQueue *queue = nil;
	if (!queue) {
		queue = [[NSOperationQueue alloc] init];
		queue.name = [self queueNameWithPurpose:@"filesystem"];
		queue.maxConcurrentOperationCount = 1;
	}
	return queue;
}



// NSBlockOperation

+ (void)main:(MTQueueBlock)operation
{
    [[MTq main] addOperationWithBlock:^{
        if (operation) operation();
    }];
}

+ (void)coreData:(MTQueueBlock)operation
{
    [[MTq coreDataQueue] addOperationWithBlock:^{
        if (operation) operation();
    }];
}

+ (void)network:(MTQueueBlock)operation
{
    [[MTq networkQueue] addOperationWithBlock:^{
        if (operation) operation();
    }];
}

+ (void)file:(MTQueueBlock)operation
{
    [[MTq fileSystemQueue] addOperationWithBlock:^{
        if (operation) operation();
    }];
}



// GCD

+ (void)background:(MTQueueBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        if (block) block();
    });
}

+ (void)def:(MTQueueBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (block) block();
    });
}

+ (void)high:(MTQueueBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        if (block) block();
    });
}

+ (void)low:(MTQueueBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        if (block) block();
    });
}




#pragma mark - Private

+ (NSString *)queueNameWithPurpose:(NSString *)purpose
{
    return [NSString stringWithFormat:@"%@.%@", [NSBundle mainBundle].bundleIdentifier, purpose];
}


@end
