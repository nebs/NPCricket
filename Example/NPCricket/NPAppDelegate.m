#import "NPAppDelegate.h"
#import <NPCricket/NPCricket.h>

@implementation NPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NPCricket useEmailComposerWithToEmailAddress:@"feedback@yourdomain.com"];
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [NPCricket show];
    }
}

@end
