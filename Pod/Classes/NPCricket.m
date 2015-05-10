#import "NPCricket.h"
#import <UIKit/UIKit.h>
#import "UIView+NPScreenshot.h"
#import "NPCricketEmailComposerHandler.h"
#import "NPCricketMailgunHandler.h"

@interface NPCricket ()

@property (nonatomic) id<NPCricketHandler> handler;
@property (nonatomic) BOOL isShowing;

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

#pragma mark - Convenience Presets

+ (void)useMailgunWithToEmailAddress:(NSString *)toEmailAddress
                    fromEmailAddress:(NSString *)fromEmailAddress
                              domain:(NSString *)domain
                              apiKey:(NSString *)apiKey {
    [NPCricket useMailgunWithToEmailAddress:toEmailAddress fromEmailAddress:fromEmailAddress subjectPrefix:nil domain:domain apiKey:apiKey];
}

+ (void)useMailgunWithToEmailAddress:(NSString *)toEmailAddress
                    fromEmailAddress:(NSString *)fromEmailAddress
                       subjectPrefix:(NSString *)subjectPrefix
                              domain:(NSString *)domain
                              apiKey:(NSString *)apiKey {
    [NPCricket useHandler:[NPCricketMailgunHandler handlerWithToEmailAddress:toEmailAddress fromEmailAddress:fromEmailAddress subjectPrefix:subjectPrefix domain:domain apiKey:apiKey]];
}

+ (void)useEmailComposerWithToEmailAddress:(NSString *)toEmailAddress subjectPrefix:(NSString *)subjectPrefix {
    [NPCricket useHandler:[NPCricketEmailComposerHandler emailComposerWithToEmailAddress:toEmailAddress subjectPrefix:subjectPrefix]];
}

+ (void)useEmailComposerWithToEmailAddress:(NSString *)toEmailAddress {
    [NPCricket useEmailComposerWithToEmailAddress:toEmailAddress subjectPrefix:nil];
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
        [window.rootViewController presentViewController:cricketViewController animated:YES completion:nil];
    } else {
        [window.rootViewController dismissViewControllerAnimated:YES completion:^{
            self.isShowing = NO;
        }];
    }
}

#pragma mark - NPCricketViewControllerDelegate

- (void)cricketViewController:(NPCricketViewController *)cricketViewController didSubmitMessage:(NSString *)message screenshot:(UIImage *)screenshot {
    [cricketViewController.presentingViewController dismissViewControllerAnimated:YES completion:^{
        self.isShowing = NO;
        NPFeedback *feedback = [[NPFeedback alloc] init];
        feedback.message = message;
        feedback.screenshot = screenshot;
        [self.handler NPCricket_handleFeedback:feedback];
    }];
}

- (void)cricketViewControllerDidCancel:(NPCricketViewController *)cricketViewController {
    [cricketViewController.presentingViewController dismissViewControllerAnimated:YES completion:^{
        self.isShowing = NO;
    }];
}

@end
