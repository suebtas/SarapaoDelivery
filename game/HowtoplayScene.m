//
//  HowtoplayScene.m
//  game
//
//  Created by timut on 2/14/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "HowtoplayScene.h"


@implementation HowtoplayScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	
    SPHowtoplayLayer *htpLayer = [SPHowtoplayLayer node];
	
	// add layer as a child to scene
	[scene addChild: htpLayer];
	
	// return the scene
	return scene;
}
@end
