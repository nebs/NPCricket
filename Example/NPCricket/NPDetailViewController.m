#import "NPDetailViewController.h"

@implementation NPDetailViewController

- (IBAction)backButtonPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
