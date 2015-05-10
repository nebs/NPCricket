#import <Foundation/Foundation.h>

@class UIImage;

@interface NPFeedback : NSObject

@property (nonatomic) NSString *message;
@property (nonatomic) UIImage *screenshot;
@property (nonatomic, readonly) NSString *deviceName;
@property (nonatomic, readonly) NSString *deviceModel;
@property (nonatomic, readonly) NSString *operatingSystemName;
@property (nonatomic, readonly) NSString *operatingSystemVersion;
@property (nonatomic, readonly) NSString *appVersion;
@property (nonatomic, readonly) NSString *appBuild;
@property (nonatomic, readonly) NSString *messageWithMetaData;

@end
