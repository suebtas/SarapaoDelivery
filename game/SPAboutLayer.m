//
//  SPAboutLayer.m
//  game
//
//  Created by timut on 2/14/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "SPAboutLayer.h"
#import "SimpleAudioEngine.h"


@implementation SPAboutLayer
-(id)init{
    if( (self=[super init]) ) {
        self.isTouchEnabled = YES;
        
        [self showAbout];
        
    }
    return self;
}
-(void)showAbout{
    CGSize size = [[CCDirector sharedDirector]winSize];
    bg = [CCSprite spriteWithFile:@"5AboutUs.png"];
    bg.position = ccp(size.width/2, size.height/2);
    
    
    btmain = [CCSprite spriteWithFile:@"button_mainmenu.png"];
    btmain.position = ccp(270, 120);
    
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
