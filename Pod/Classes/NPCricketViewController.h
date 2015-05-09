#import <UIKit/UIKit.h>
#import "NPAnnotatedImageView.h"

@protocol NPCricketViewControllerDelegate;

@interface NPCricketViewController : UIViewController <NPAnnotatedImageViewDelegate>

@property (weak, nonatomic) IBOutlet NPAnnotatedImageView *screenshotImageView;
@property (weak, nonatomic) id<NPCricketViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerLabelYLayoutConstraint;

- (instancetype)initWithScreenshot:(UIImage *)screenshot;

@end

@protocol NPCricketViewControllerDelegate <NSObject>

- (void)cricketViewController:(NPCricketViewController *)cricketViewController didSubmitMessage:(NSString *)message screenshot:(UIImage *)screenshot;
- (void)cricketViewControllerDidCancel:(NPCricketViewController *)cricketViewController;

@end
