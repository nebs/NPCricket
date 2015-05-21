#import "NPAppDelegate.h"
#import <NPCricket/NPCricket.h>
#import <NPCricket/NPNativeEmailHandler.h>
#import "NPHomeViewController.h"

@implementation NPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NPNativeEmailHandler *nativeEmailHandler = [NPNativeEmailHandler handlerWithToEmailAddress:@"feedback@yourdomain.com"];
    [NPCricket useHandler:nativeEmailHandler];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NPHomeViewController *viewController = [[NPHomeViewController alloc] init];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [NPCricket show];
    }
}

@end
