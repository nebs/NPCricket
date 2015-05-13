#import "NPNativeEmailHandler.h"
#import "NSString+NPEmail.h"

@interface NPNativeEmailHandler ()

@property (nonatomic) MFMailComposeViewController *mailComposeViewController;
@property (nonatomic) NSString *toEmailAddress;
@property (nonatomic) NSString *subjectPrefix;
@property (nonatomic) UIViewController *rootViewController;

@end

@implementation NPNativeEmailHandler

#pragma mark - Initialization

+ (instancetype)handlerWithToEmailAddress:(NSString *)toEmailAddress subjectPrefix:(NSString *)subjectPrefix {
    NPNativeEmailHandler *emailComposer = [[NPNativeEmailHandler alloc] init];
    emailComposer.toEmailAddress = toEmailAddress;
    emailComposer.subjectPrefix = subjectPrefix;
    return emailComposer;
}

+ (instancetype)handlerWithToEmailAddress:(NSString *)toEmailAddress {
    return [NPNativeEmailHandler handlerWithToEmailAddress:toEmailAddress subjectPrefix:nil];
}

#pragma mark - NPCricketHandler

- (void)NPCricket_handleFeedback:(NPFeedback *)feedback {
    if ([self.toEmailAddress length] <= 0) {
        return;
    }

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.rootViewController = window.rootViewController;

    self.mailComposeViewController = [[MFMailComposeViewController alloc] init];
    self.mailComposeViewController.mailComposeDelegate = self;
    [self.mailComposeViewController setToRecipients:@[self.toEmailAddress]];
    [self.mailComposeViewController setSubject:[feedback.message NP_subjectWithPrefix:self.subjectPrefix]];
    [self.mailComposeViewController setMessageBody:feedback.messageWithMetaData isHTML:NO];
    NSData *exportData = UIImageJPEGRepresentation(feedback.screenshot ,1.0);
    [self.mailComposeViewController addAttachmentData:exportData mimeType:@"image/jpeg" fileName:@"screenshot.jpeg"];
    [self.rootViewController presentViewController:self.mailComposeViewController animated:YES completion:nil];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController*)mailController didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
