//
//  AboutScene.m
//  game
//
//  Created by timut on 2/14/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "AboutScene.h"


@implementation AboutScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	
    SPAboutLayer *aboutLayer = [SPAboutLayer node];
	
	// add layer as a child to scene
	[scene addChild: aboutLayer];
	
	// return the scene
	return scene;
}
@end
