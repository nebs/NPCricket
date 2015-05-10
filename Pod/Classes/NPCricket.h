#import <Foundation/Foundation.h>
#import "NPCricketViewController.h"
#import "NPCricketHandlerProtocol.h"

@interface NPCricket : NSObject <NPCricketViewControllerDelegate>

+ (void)useHandler:(id<NPCricketHandler>)handler;
+ (void)show;

// Convenience presets
+ (void)useMailgunWithToEmailAddress:(NSString *)toEmailAddress
                    fromEmailAddress:(NSString *)fromEmailAddress
                              domain:(NSString *)domain
                              apiKey:(NSString *)apiKey;
+ (void)useMailgunWithToEmailAddress:(NSString *)toEmailAddress
                    fromEmailAddress:(NSString *)fromEmailAddress
                       subjectPrefix:(NSString *)subjectPrefix
                              domain:(NSString *)domain
                              apiKey:(NSString *)apiKey;
+ (void)useEmailComposerWithToEmailAddress:(NSString *)toEmailAddress subjectPrefix:(NSString *)subjectPrefix;
+ (void)useEmailComposerWithToEmailAddress:(NSString *)toEmailAddress;

@end
