//
//  IntroLayer.m
//  game
//
//  Created by timut on 2/14/56 BE.
//  Copyright __MyCompanyName__ 2556. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "SPMenuScene.h"
#import "SimpleAudioEngine.h"

#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(void) onEnter
{
	[super onEnter];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bgsound.mp3"];
	// ask director for the window size
	CGSize size = [[CCDirector sharedDirector] winSize];

	CCSprite *background;
	
	
    background = [CCSprite spriteWithFile:@"1-welcome.png"];
	
	background.position = ccp(size.width/2, size.height/2);

	// add the label as a child to this Layer
	[self addChild: background];
	
	// In one second transition to the new scene
	[self scheduleOnce:@selector(makeTransition) delay:2];
}

-(void) makeTransition
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[SPMenuScene scene] withColor:ccWHITE]];
}
@end
