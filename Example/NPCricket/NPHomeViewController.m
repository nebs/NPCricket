#import "NPHomeViewController.h"
#import "NPDetailViewController.h"

@implementation NPHomeViewController

- (IBAction)showModalButtonPressed:(id)sender {
    NPDetailViewController *detailViewController = [[NPDetailViewController alloc] init];
    [self presentViewController:detailViewController animated:YES completion:nil];
}

@end
