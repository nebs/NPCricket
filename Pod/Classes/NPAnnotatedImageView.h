#import <UIKit/UIKit.h>

@protocol NPAnnotatedImageViewDelegate;

@interface NPAnnotatedImageView : UIImageView

@property (nonatomic) id<NPAnnotatedImageViewDelegate> delegate;

@end

@protocol NPAnnotatedImageViewDelegate <NSObject>

- (void)annotatedImageView:(NPAnnotatedImageView *)annotatedImageView didFinishWithScreenshot:(UIImage *)screenshot;

@end
