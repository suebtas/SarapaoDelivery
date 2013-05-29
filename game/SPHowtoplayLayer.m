//
//  SPHowtoplayLayer.m
//  game
//
//  Created by timut on 2/14/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "SPHowtoplayLayer.h"
#import "SimpleAudioEngine.h"

@implementation SPHowtoplayLayer
-(id)init{
    if( (self=[super init]) ) {
        self.isTouchEnabled = YES;
        [self showhowtoplay];
        
        
    }
    return self;
}
-(void)showhowtoplay{
    CGSize size = [[CCDirector sharedDirector]winSize];
    bg = [CCSprite spriteWithFile:@"4HowToPlay.png"];
    bg.position = ccp(size.width/2, size.height/2);
    btmain = [CCSprite spriteWithFile:@"button_mainmenu.png"];
    btmain.position = ccp(250, 60);
    
    [self addChild:bg z:0];
    [self addChild:btmain z:1];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector]convertToGL:location];
    
    if(CGRectContainsPoint([btmain boundingBox], location)){
        [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
        [self scheduleOnce:@selector(mainmenu) delay:0];
    }
    
}
-(void)mainmenu{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[SPMenuScene scene]]];
}
@end
