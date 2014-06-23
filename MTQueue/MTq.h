//
//  MTQueue.h
//  MTQueue
//
//  Created by Adam Kirk on 2/6/13.
//  Copyright (c) 2013 Mysterious Trousers. All rights reserved.
//
@class MTq;

typedef void (^MTQueueBlock)(void);
typedef MTq MTQueue;


@interface MTq : NSObject

+ (NSOperationQueue *)mainQueue;
+ (NSOperationQueue *)coreDataQueue;
+ (NSOperationQueue *)networkQueue;
+ (NSOperationQueue *)fileSystemQueue;

// NSBlockOperation
+ (void)main:(MTQueueBlock)operation;
+ (void)coreData:(MTQueueBlock)operation;
+ (void)network:(MTQueueBlock)operation;
+ (void)file:(MTQueueBlock)operation;

// GCD
+ (void)background:(MTQueueBlock)block;
+ (void)def:(MTQueueBlock)block;
+ (void)high:(MTQueueBlock)block;
+ (void)low:(MTQueueBlock)block;

+ (void)after:(NSTimeInterval)delay block:(MTQueueBlock)block;

@end
