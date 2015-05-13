#import <Foundation/Foundation.h>
#import "NPCricketHandlerProtocol.h"
#import <MessageUI/MessageUI.h>

@interface NPEmailComposerHandler : NSObject <NPCricketHandler,
                                                             MFMailComposeViewControllerDelegate>

+ (instancetype)emailComposerWithToEmailAddress:(NSString *)toEmailAddress subjectPrefix:(NSString *)subjectPrefix;
+ (instancetype)emailComposerWithToEmailAddress:(NSString *)toEmailAddress;

@end
