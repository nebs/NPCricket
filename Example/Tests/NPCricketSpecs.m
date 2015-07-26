#import <NPCricket/NPCricket.h>
#import <NPCricket/NPNativeEmailHandler.h>

@interface NPCricket ()

@property (nonatomic) UIViewController *baseViewController;
@property (nonatomic) id<NPCricketHandler> handler;
+ (instancetype)sharedInstance;

@end

SpecBegin(NPCricketSpecs)

describe(@"NPCricket", ^{
    describe(@"showing", ^{
        it(@"present a cricket view controller", ^{
            expect([NPCricket sharedInstance].baseViewController).to.beNil;
            [NPCricket show];
            expect([NPCricket sharedInstance].baseViewController).toNot.beNil;
        });
    });

    describe(@"registering a handler", ^{
        __block NPNativeEmailHandler *handler;

        before(^{
            handler = [NPNativeEmailHandler handlerWithToEmailAddress:@"foo@example.com"];
            [NPCricket useHandler:handler];
        });

        it(@"should register that handler", ^{
            expect([NPCricket sharedInstance].handler).equal(handler);
        });
    });
});

SpecEnd
