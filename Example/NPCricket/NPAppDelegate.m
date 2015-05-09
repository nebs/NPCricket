#import "NPAppDelegate.h"
#import <NPCricket/NPCricket.h>

@implementation NPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NPCricket useInternalEmailComposerWithToEmailAddress:@"feedback@yourdomain.com" subjectPrefix:@"iOS"];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [NPCricket show];
    }
}

@end
