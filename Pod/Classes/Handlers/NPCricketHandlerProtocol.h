#import <Foundation/Foundation.h>
#import "NPFeedback.h"

@class UIImage;

@protocol NPCricketHandler <NSObject>

- (void)NPCricket_handleFeedback:(NPFeedback *)feedback;

@end
