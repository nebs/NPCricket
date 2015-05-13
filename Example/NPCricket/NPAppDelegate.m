#import "NPAppDelegate.h"
#import <NPCricket/NPCricket.h>
#import <NPCricket/NPNativeEmailHandler.h>

@implementation NPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NPNativeEmailHandler *nativeEmailHandler = [NPNativeEmailHandler handlerWithToEmailAddress:@"feedback@yourdomain.com"];
    [NPCricket useHandler:nativeEmailHandler];
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [NPCricket show];
    }
}

@end
