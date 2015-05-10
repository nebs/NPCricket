#import "NPAppDelegate.h"
#import <NPCricket/NPCricket.h>

@implementation NPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Uncomment one of the options below...

    // Example for internal email composer
//    [NPCricket useInternalEmailComposerWithToEmailAddress:@"feedback@yourdomain.com" subjectPrefix:@"iOS"];

    // Example for Mailgun email composer
//    [NPCricket useMailgunWithToEmailAddress:@"feedback@yourdomain.com"
//                              subjectPrefix:@"iOS"
//                                     domain:@"<INSERT_MAILGUN_DOMAIN>"
//                                     apiKey:@"<INSERT_MAILGUN_API_KEY"];
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
