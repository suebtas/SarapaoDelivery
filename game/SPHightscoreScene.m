//
//  SPHightscoreScene.m
//  game
//
//  Created by timut on 3/7/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "SPHightscoreScene.h"


@implementation SPHightscoreScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	
    SPHightscoreLayer *hsLayer = [SPHightscoreLayer node];
	
	// add layer as a child to scene
	[scene addChild: hsLayer];
	
	// return the scene
	return scene;
}
@end
