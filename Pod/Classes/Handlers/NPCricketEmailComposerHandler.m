#import "NPCricketEmailComposerHandler.h"
#import "NSString+NPEmail.h"

@interface NPCricketEmailComposerHandler ()

@property (nonatomic) MFMailComposeViewController *mailComposeViewController;
@property (nonatomic) NSString *toEmailAddress;
@property (nonatomic) NSString *subjectPrefix;
@property (nonatomic) UIViewController *rootViewController;

@end

@implementation NPCricketEmailComposerHandler

#pragma mark - Initialization

+ (instancetype)emailComposerWithToEmailAddress:(NSString *)toEmailAddress subjectPrefix:(NSString *)subjectPrefix {
    NPCricketEmailComposerHandler *emailComposer = [[NPCricketEmailComposerHandler alloc] init];
    emailComposer.toEmailAddress = toEmailAddress;
    emailComposer.subjectPrefix = subjectPrefix;
    return emailComposer;
}

+ (instancetype)emailComposerWithToEmailAddress:(NSString *)toEmailAddress {
    return [NPCricketEmailComposerHandler emailComposerWithToEmailAddress:toEmailAddress subjectPrefix:nil];
}

#pragma mark - NPCricketHandler

- (void)NPCricket_processMessage:(NSString *)message screenshot:(UIImage *)screenshot {
    if ([self.toEmailAddress length] <= 0) {
        return;
    }

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.rootViewController = window.rootViewController;

    self.mailComposeViewController = [[MFMailComposeViewController alloc] init];
    self.mailComposeViewController.mailComposeDelegate = self;
    [self.mailComposeViewController setToRecipients:@[self.toEmailAddress]];
    [self.mailComposeViewController setSubject:[message NP_subjectWithPrefix:self.subjectPrefix]];
    [self.mailComposeViewController setMessageBody:message isHTML:NO];
    NSData *exportData = UIImageJPEGRepresentation(screenshot ,1.0);
    [self.mailComposeViewController addAttachmentData:exportData mimeType:@"image/jpeg" fileName:@"screenshot.jpeg"];
    [self.rootViewController presentViewController:self.mailComposeViewController animated:YES completion:nil];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController*)mailController didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
