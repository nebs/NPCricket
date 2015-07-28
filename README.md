# NPCricket

[![CI Status](http://img.shields.io/travis/nebspetrovic/NPCricket.svg?style=flat)](https://travis-ci.org/nebspetrovic/NPCricket)
[![Version](https://img.shields.io/cocoapods/v/NPCricket.svg?style=flat)](http://cocoapods.org/pods/NPCricket)
[![License](https://img.shields.io/cocoapods/l/NPCricket.svg?style=flat)](http://cocoapods.org/pods/NPCricket)
[![Platform](https://img.shields.io/cocoapods/p/NPCricket.svg?style=flat)](http://cocoapods.org/pods/NPCricket)

## About

Cricket is an iOS library for sending feedback from within your app. 

#### Typical Scenario:

1. Alice wants to leave feedback. She shakes her phone.
2. Cricket grabs a screenshot of the current screen.
3. Alice draws a rectangle around a button she doesn't like.
4. She writes "I hate buttons!"
5. Cricket attaches the annotated screenshot to an email and Alice sends it.

![GitHub Logo](/demo.gif)

## Hello Cricket

```objective-c
#import <NPCricket/NPCricket.h>
#import <NPCricket/NPNativeEmailHandler.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NPNativeEmailHandler *nativeEmailHandler = [NPNativeEmailHandler handlerWithToEmailAddress:@"feedback@yourdomain.com"];
    [NPCricket useHandler:nativeEmailHandler];
  // ... your code here ...
  return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [NPCricket show];
    }
}
```

## Overview

Cricket does not show itself automatically. Instead, you must call `[NPCricket show]` yourself. The example above uses a shake gesture to trigger Cricket. It also sends the feedback via email. You can customize and configure both of these things to your liking.

Cricket uses "handlers" to process feedback. Any class can become a handler by conforming to the `NPCricketHandler` protocol. An example of a custom handler could be something that sends feedback directly to your server.

For your convenience I've included a handler for using the built-in email composer (`NPEmailComposerHandler`)

## Creating Handlers

If you want to create your own handler simply create a class that conforms to `NPCricketHandler` and implement the single method, like so:

```objective-c
#import "NPCricketHandlerProtocol.h"

@interface MyCustomHandler : NSObject <NPCricketHandler>
@end

@implementation MyCustomHandler

- (void)NPCricket_handleFeedback:(NPFeedback *)feedback {
  // Do something with the feedback ...
}

@end
```

Don't forget to tell `NPCricket` to use your handler.
```objective-c
MyCustomHandler *myCustomHandler = [[MyCustomHandler alloc] init];
[NPCricket useHandler:myCustomHandler];
```

## Requirements

Cricket requires iOS 8.0 and above.

## Installation

NPCricket is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NPCricket"
```

## Author

Nebojsa Petrovic, nebspetrovic@gmail.com

## License

NPCricket is available under the MIT license. See the LICENSE file for more info.
