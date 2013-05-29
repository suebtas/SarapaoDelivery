//
//  SPMenuScene.m
//  game
//
//  Created by timut on 2/14/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "SPMenuScene.h"



@implementation SPMenuScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *menuScene = [CCScene node];
	
	// 'layer' is an autorelease object.
	
    SPMenuLayer *menulayer = [SPMenuLayer node];
	
	// add layer as a child to scene
	[menuScene addChild: menulayer];
	
	// return the scene
	return menuScene;
}
@end
