#import "UIView+NPStyle.h"

@implementation UIView (NPStyle)

- (void)NP_applyShadow {
    self.layer.masksToBounds = NO;
    self.layer.cornerRadius = 3;
    self.layer.shadowOffset = CGSizeMake(2, 2);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
}

@end
