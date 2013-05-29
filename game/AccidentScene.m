//
//  AccidentScene.m
//  game
//
//  Created by timut on 4/15/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "AccidentScene.h"


@implementation AccidentScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	
    AccidentLayer *acLayer = [AccidentLayer node];
	
	// add layer as a child to scene
	[scene addChild: acLayer];
	
	// return the scene
	return scene;
}
@end
