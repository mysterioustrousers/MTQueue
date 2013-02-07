MTQueue
=======

Add blocks to queues in a super terse and readable way!

### Why?

Before:

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
      ...
      dispatch_async(dispatch_get_main_queue(), ^{
        ...
      });
    });

Now:

    [MTq background:^{
      ...
      [MTq main:^{
        ...
      }];
    }];

So much easier to read and understand! (and type, jeez!)


### Installation

In your Podfile, add this line:

    pod "MTQueue"

pod? => https://github.com/CocoaPods/CocoaPods/


### What's Available

Higher level is better, so some NSOperationQueues are created for you lazily as you need them:

    [MTq main:^{
      // an operation on the main thread
    }];

    [MTq network:^{
      // a network operation
    }];

    [MTq coreData:^{
      // a core data operation (serial queue)
    }];

    [MTq file:^{
      // a file system operation
    }];

    [MTq background:^{
      // The GCD global background queue
    }];

    [MTq def:^{
      // The GCD global default queue
    }];

    [MTq high:^{
      // The GCD global high priority queue
    }];

    [MTq low:^{
      // The GCD global low priority queue
    }];
