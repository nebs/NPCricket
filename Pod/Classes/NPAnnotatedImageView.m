#import "NPAnnotatedImageView.h"
#import "UIView+NPScreenshot.h"

@interface NPAnnotatedImageView ()

@property (nonatomic) CGPoint annotationViewPointA;
@property (nonatomic) CGPoint annotationViewPointB;
@property (nonatomic) UIView *annotationView;

@end

@implementation NPAnnotatedImageView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    self.annotationViewPointA = touchPoint;
    self.annotationViewPointB = touchPoint;
    [self updateAnnotationView];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];

    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    self.annotationViewPointB = touchPoint;
    [self updateAnnotationView];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];

    [self.delegate annotatedImageView:self didFinishWithScreenshot:[self NP_screenshot]];
}

- (void)updateAnnotationView {
    if (!self.annotationView) {
        self.annotationView = [[UIView alloc] initWithFrame:CGRectZero];
        self.annotationView.backgroundColor = [UIColor clearColor];
        self.annotationView.layer.borderColor = [UIColor greenColor].CGColor;
        self.annotationView.layer.borderWidth = 3.0;
        [self addSubview:self.annotationView];
    }

    CGFloat x = self.annotationViewPointA.x;
    CGFloat y = self.annotationViewPointA.y;
    CGFloat w = self.annotationViewPointB.x - x;
    CGFloat h = self.annotationViewPointB.y - y;
    self.annotationView.frame = CGRectMake(x, y, w, h);
}

@end
