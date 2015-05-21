#import "NPCricket.h"
#import <UIKit/UIKit.h>
#import "UIView+NPScreenshot.h"
#import "NPNativeEmailHandler.h"
#import "UIViewController+NPHierarchy.h"

@interface NPCricket ()

@property (nonatomic) id<NPCricketHandler> handler;
@property (nonatomic) BOOL isShowing;
@property (nonatomic) UIViewController *baseViewController;

@end

@implementation NPCricket

#pragma mark - Initializers

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Public Interface

+ (void)useHandler:(id<NPCricketHandler>)handler {
    [NPCricket sharedInstance].handler = handler;
}

+ (void)show {
    [[NPCricket sharedInstance] show];
}

- (void)show {
    if (!self.handler) {
        return;
    }

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!self.isShowing) {
        self.isShowing = YES;
        NPCricketViewController *cricketViewController = [[NPCricketViewController alloc] initWithScreenshot:[window NP_screenshot]];
        cricketViewController.delegate = self;
        self.baseViewController = [window.rootViewController NP_topMostViewController];
        [self.baseViewController presentViewController:cricketViewController animated:YES completion:nil];
    } else {
        [self.baseViewController dismissViewControllerAnimated:YES completion:^{
            self.isShowing = NO;
        }];
    }
}

#pragma mark - NPCricketViewControllerDelegate

- (void)cricketViewController:(NPCricketViewController *)cricketViewController didSubmitMessage:(NSString *)message screenshot:(UIImage *)screenshot {
    [self.baseViewController dismissViewControllerAnimated:YES completion:^{
        self.isShowing = NO;
        NPFeedback *feedback = [[NPFeedback alloc] init];
        feedback.message = message;
        feedback.screenshot = screenshot;
        [self.handler NPCricket_handleFeedback:feedback];
    }];
}

- (void)cricketViewControllerDidCancel:(NPCricketViewController *)cricketViewController {
    [self.baseViewController dismissViewControllerAnimated:YES completion:^{
        self.isShowing = NO;
    }];
}

@end
