#import <Foundation/Foundation.h>
#import "NPCricketViewController.h"
#import "NPCricketHandlerProtocol.h"
#import "NPCricketInternalEmailComposerHandler.h"

@interface NPCricket : NSObject <NPCricketViewControllerDelegate>

+ (void)setupWithHandler:(id<NPCricketHandler>)handler;
+ (void)show;

@end
