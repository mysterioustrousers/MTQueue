MTQueue
=======

Add blocks to queues in a super terse and readable way!

### Why?

Before:

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
      // something in the background
      dispatch_async(dispatch_get_main_queue(), ^{
        // back on the main queue
      });
    });

Now:

    [MTQueue background:^{
      // something in the background
      [MTQueue main:^{
        // back on the main queue
      }];
    }];

So much easier to read and understand! (and type, jeez!)


### Installation

In your Podfile, add this line:

    pod "MTQueue"

pod? => https://github.com/CocoaPods/CocoaPods/


### What's Available

Higher level is better, so some NSOperationQueues are created for you lazily as you need them:

    [MTQueue main:^{
      // an operation on the main thread
    }];

    [MTQueue network:^{
      // a network operation
    }];

    [MTQueue coreData:^{
      // a core data operation (serial queue)
    }];

    [MTQueue file:^{
      // a file system operation
    }];
