#import "NPFeedback.h"

@implementation NPFeedback

- (NSString *)deviceName {
    return [[UIDevice currentDevice] name];
}

- (NSString *)deviceModel {
    return [[UIDevice currentDevice] model];
}

- (NSString *)operatingSystemName {
    return [[UIDevice currentDevice] systemName];
}

- (NSString *)operatingSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

- (NSString *)appVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return infoDictionary[@"CFBundleShortVersionString"];
}

- (NSString *)appBuild {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return infoDictionary[(NSString *)kCFBundleVersionKey];
}

- (NSString *)messageWithMetaData {
    NSMutableString *result = [NSMutableString string];
    [result appendString:self.message];
    [result appendString:@"\n\n--- META DATA ---\n"];
    [result appendFormat:@"%@ (%@)\n", self.deviceModel, self.deviceName];
    [result appendFormat:@"%@ %@\n", self.operatingSystemName, self.operatingSystemVersion];
    [result appendFormat:@"App Version: %@\n", self.appVersion];
    [result appendFormat:@"App Build: %@\n", self.appBuild];
    return [result copy];
}

@end
