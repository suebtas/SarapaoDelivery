//
//  AppDelegate.h
//  game
//
//  Created by timut on 2/14/56 BE.
//  Copyright __MyCompanyName__ 2556. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "GCHelper.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
}
@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;

@end
