#import "NPCricketInternalEmailComposerHandler.h"
#import "NSString+NPEmail.h"

@interface NPCricketInternalEmailComposerHandler ()

@property (nonatomic) MFMailComposeViewController *mailComposeViewController;
@property (nonatomic) NSString *toEmailAddress;
@property (nonatomic) NSString *subjectPrefix;

@end

@implementation NPCricketInternalEmailComposerHandler

#pragma mark - Initialization

+ (instancetype)emailComposerWithToEmailAddress:(NSString *)toEmailAddress subjectPrefix:(NSString *)subjectPrefix {
    NPCricketInternalEmailComposerHandler *emailComposer = [[NPCricketInternalEmailComposerHandler alloc] init];
    emailComposer.toEmailAddress = toEmailAddress;
    emailComposer.subjectPrefix = subjectPrefix;
    emailComposer.mailComposeViewController = [[MFMailComposeViewController alloc] init];
    emailComposer.mailComposeViewController.mailComposeDelegate = emailComposer;
    return emailComposer;
}

+ (instancetype)emailComposerWithToEmailAddress:(NSString *)toEmailAddress {
    return [NPCricketInternalEmailComposerHandler emailComposerWithToEmailAddress:toEmailAddress subjectPrefix:nil];
}

#pragma mark - NPCricketHandler

- (void)NPCricket_processMessage:(NSString *)message screenshot:(UIImage *)screenshot {
    if ([self.toEmailAddress length] <= 0) {
        return;
    }

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self.mailComposeViewController setToRecipients:@[self.toEmailAddress]];
    [self.mailComposeViewController setSubject:[message NP_subjectWithPrefix:self.subjectPrefix]];
    [self.mailComposeViewController setMessageBody:message isHTML:NO];
    NSData *exportData = UIImageJPEGRepresentation(screenshot ,1.0);
    [self.mailComposeViewController addAttachmentData:exportData mimeType:@"image/jpeg" fileName:@"screenshot.jpeg"];
    [window.rootViewController presentViewController:self.mailComposeViewController animated:YES completion:nil];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController*)mailController didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [mailController dismissViewControllerAnimated:YES completion:nil];
}

@end
