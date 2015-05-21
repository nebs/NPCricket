#import "UIViewController+NPHierarchy.h"

@implementation UIViewController (NPHierarchy)

- (UIViewController *)NP_topMostViewController {
    if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = (UINavigationController *)self;
        return [navController.topViewController NP_topMostViewController];
    } else if (self.presentedViewController) {
        return [self.presentedViewController NP_topMostViewController];
    } else {
        return self;
    }
}

@end
