#import "NPAppDelegate.h"
#import <NPCricket/NPCricket.h>

@implementation NPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Uncomment one of the options below...

    // Example for internal email composer
//    [NPCricket useEmailComposerWithToEmailAddress:@"feedback@yourdomain.com"];

    // Example for Mailgun email composer
//    [NPCricket useMailgunWithToEmailAddress:@"Name <feedback@yourdomain.com>"
//                           fromEmailAddress:@"Name <cricket@yourdomain.com>"
//                                     domain:@"<INSERT_MAILGUN_DOMAIN>"
//                                     apiKey:@"<INSERT_MAILGUN_API_KEY"];
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [NPCricket show];
    }
}

@end
