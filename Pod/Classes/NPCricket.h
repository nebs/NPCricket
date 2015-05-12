#import <Foundation/Foundation.h>
#import "NPCricketViewController.h"
#import "NPCricketHandlerProtocol.h"

@interface NPCricket : NSObject <NPCricketViewControllerDelegate>

+ (void)useHandler:(id<NPCricketHandler>)handler;
+ (void)show;

// Convenience presets
+ (void)useEmailComposerWithToEmailAddress:(NSString *)toEmailAddress subjectPrefix:(NSString *)subjectPrefix;
+ (void)useEmailComposerWithToEmailAddress:(NSString *)toEmailAddress;

@end
