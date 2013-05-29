//
//  GCHelper.m
//  SarapaoDelivery
//
//  Created by timut on 5/1/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "GCHelper.h"


@implementation GCHelper



static GCHelper *sharedHelper = nil;
+ (GCHelper *) sharedInstance {
    @synchronized([GCHelper class])
    {
        if (!sharedHelper) {
            [[self alloc] init];
        }
        return sharedHelper;
    }
    return nil; }
+(id)alloc {
    @synchronized ([GCHelper class])
    {
        NSAssert(sharedHelper == nil, @"Attempted to allocated a \
                 second instance of the GCHelper singleton");
        sharedHelper = [super alloc];
        return sharedHelper;
    }
    return nil;
}

- (BOOL)isGameCenterAvailable {
    // check for presence of GKLocalPlayer API
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    // check if the device is running iOS 4.1 or later
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer
                                           options:NSNumericSearch] != NSOrderedAscending);
    return (gcClass && osVersionSupported);
}
- (id)init {
    if ((self = [super init])) {
        gameCenterAvailable = [self isGameCenterAvailable];
        if (gameCenterAvailable) {
        } }
    NSNotificationCenter *nc =
    [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(authenticationChanged)
               name:GKPlayerAuthenticationDidChangeNotificationName
             object:nil];
    return self;
}
#pragma mark Internal functions
- (void)authenticationChanged {
    dispatch_async(dispatch_get_main_queue(), ^(void)
                   {
                       if ([GKLocalPlayer localPlayer].isAuthenticated &&
                           !userAuthenticated) {
                           NSLog(@"Authentication changed: player authenticated.");
                           userAuthenticated = TRUE;
                       } else if (![GKLocalPlayer localPlayer].isAuthenticated &&
                                  userAuthenticated) {
                           NSLog(@"Authentication changed: player not authenticated");
                           userAuthenticated = FALSE;
                       }
                   });
}
- (void)authenticateLocalUser {
    if (!gameCenterAvailable) return;
    NSLog(@"Authenticating local user...");
    if ([GKLocalPlayer localPlayer].authenticated == NO) {
        [[GKLocalPlayer localPlayer]
         authenticateWithCompletionHandler:nil];
    } else {
        NSLog(@"Already authenticated!");
    }
}




@end
