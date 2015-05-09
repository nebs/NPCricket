#import <Foundation/Foundation.h>

@class UIImage;

@protocol NPCricketHandler <NSObject>

- (void)NPCricket_processMessage:(NSString *)message screenshot:(UIImage *)screenshot;

@end
