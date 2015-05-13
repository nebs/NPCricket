#import <Foundation/Foundation.h>
#import "NPCricketHandlerProtocol.h"
#import <MessageUI/MessageUI.h>

@interface NPNativeEmailHandler : NSObject <NPCricketHandler,
                                                             MFMailComposeViewControllerDelegate>

+ (instancetype)handlerWithToEmailAddress:(NSString *)toEmailAddress subjectPrefix:(NSString *)subjectPrefix;
+ (instancetype)handlerWithToEmailAddress:(NSString *)toEmailAddress;

@end
