# NPCricket

[![CI Status](http://img.shields.io/travis/nebspetrovic/NPCricket.svg?style=flat)](https://travis-ci.org/nebspetrovic/NPCricket)
[![Version](https://img.shields.io/cocoapods/v/NPCricket.svg?style=flat)](http://cocoapods.org/pods/NPCricket)
[![License](https://img.shields.io/cocoapods/l/NPCricket.svg?style=flat)](http://cocoapods.org/pods/NPCricket)
[![Platform](https://img.shields.io/cocoapods/p/NPCricket.svg?style=flat)](http://cocoapods.org/pods/NPCricket)

## About

Cricket is an iOS library for sending feedback directly from within the app. It grabs a screenshot, some feedback and sends the data to wherever you want (see overview below for details).

![GitHub Logo](/demo.gif)

## Example Usage (with built-in composer)

In your app delegate:
```objective-c
#import <NPCricket/NPCricket.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [NPCricket useEmailComposerWithToEmailAddress:@"feedback@yourdomain.com"];
  // ... your code here ...
  return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [NPCricket show];
    }
}
```

## Example Usage (with Mailgun)

In your app delegate:
```objective-c
#import <NPCricket/NPCricket.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [NPCricket useMailgunWithToEmailAddress:@"Name <feedback@yourdomain.com>"
                         fromEmailAddress:@"Name <cricket@yourdomain.com>"
                                   domain:@"<INSERT_MAILGUN_DOMAIN>"
                                   apiKey:@"<INSERT_MAILGUN_API_KEY"];
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

Cricket does not show itself automatically. Instead, you must call `[NPCricket show]` yourself. One example would be to show it when the user shakes their phone (see the example above).

Cricket is designed to be extensible by relying on "handlers" to process the feedback. Any class can become a handler by conforming to the `NPCricketHandler` protocol. This way you could for example send the feedback directly to your server via a custom API.

For your convenience I've included the following handlers:
- `NPEmailComposerHandler` : This will show the built-in iOS email composer.
- `NPMailgunHandler` : This will send the feedback directly via Mailgun.

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

Then you simply tell `NPCricket` to use it, like so:
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
