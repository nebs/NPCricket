#import "NSString+NPEmail.h"

@implementation NSString (NPEmail)

- (NSString *)NP_subjectWithPrefix:(NSString *)prefix {
    NSUInteger maxCharacterCount = 40;
    NSMutableString *subject = [[NSMutableString alloc] initWithString:@""];
    if ([prefix length] > 0) {
        [subject appendFormat:@"[%@] ", prefix];
    }
    if ([self length] < maxCharacterCount) {
        [subject appendString:self];
    } else {
        [subject appendFormat:@"%@...", [self substringWithRange:NSMakeRange(0, maxCharacterCount)]];
    }
    return [subject copy];
}

@end
