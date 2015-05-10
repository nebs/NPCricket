#import <Foundation/Foundation.h>
#import "NPCricketHandlerProtocol.h"

@interface NPCricketMailgunHandler : NSObject <NPCricketHandler>

+ (instancetype)handlerWithToEmailAddress:(NSString *)toEmailAddress
                         fromEmailAddress:(NSString *)fromEmailAddress
                            subjectPrefix:(NSString *)subjectPrefix
                                   domain:(NSString *)domain
                                   apiKey:(NSString *)apiKey;

@end
