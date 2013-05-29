//
//  PlaygameScene.m
//  game
//
//  Created by timut on 2/17/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "PlaygameScene.h"


@implementation PlaygameScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	
    SPPlaygameLayer *layer = [SPPlaygameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
@end
