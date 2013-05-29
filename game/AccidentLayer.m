//
//  AccidentLayer.m
//  game
//
//  Created by timut on 4/15/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "AccidentLayer.h"


@implementation AccidentLayer
-(id)init{
    if( (self=[super init]) ) {
        i=0;
        [self scheduleOnce:@selector(showAccident) delay:1.0];
        [self scheduleOnce:@selector(showGameover) delay:2.5];
    }
    return self;
}
-(void)showAccident{
    CGSize size = [[CCDirector sharedDirector]winSize];
    
    bg = [CCSprite spriteWithFile:@"acsident_road.png"];
    bg.scale = 0.2f;
    bg.position = ccp(size.width/2, size.height/2);
    id zoomin = [CCScaleTo actionWithDuration:0.2f scale:1.0f];
    [bg runAction:zoomin];
    
    [self addChild:bg ];
    [self schedule:@selector(accident) interval:0.1 repeat:2 delay:0.2f];
    [self schedule:@selector(removeAccident) interval:0.1 repeat:1 delay:0.3f];
}
-(void)showGameover{
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bgsound.mp3"];
    CGSize size = [[CCDirector sharedDirector]winSize];
    bg2 = [CCSprite spriteWithFile:@"7gameOver.png"];
    //bg2.scale = 0.2f;
    bg2.position = ccp(size.width/2, size.height/2);
    btmain = [CCSprite spriteWithFile:@"button_mainmenu.png"];
    btmain.position = ccp(250,50);
    btplay = [CCSprite spriteWithFile:@"button_Play.png"];
    btplay.position = ccp(100,30);
    scoreLabel = [CCLabelTTF labelWithString:@"" dimensions:CGSizeMake(120, 40) hAlignment:UITextAlignmentCenter fontName:@"Marker Felt" fontSize:25];
    scoreLabel.position = ccp(213,285);
    [scoreLabel setColor:ccRED];
    [self addChild:scoreLabel z:3];
    
    M =[[ManageScore alloc]init];
    [scoreLabel setString:[M readDataForKey:@"score"]];
    [self addChild:bg2 z:2];
    [self addChild:btmain z:3];
    [self addChild:btplay z:3];
    self.isTouchEnabled = YES;
    
}
-(void)accident{
    motorArray = [NSArray arrayWithObjects:@"acsident1.png",@"acsident2.png",@"acsident3.png", nil];
    motor = [CCSprite spriteWithFile:[motorArray objectAtIndex:i]];
    if (i==0){
        motor.position = ccp(120,230);
    }else if(i==1){
        motor.position = ccp(180,240);
    }else if(i==2){
        motor.position = ccp(190,250);
    }
    
    i++;
    NSLog(@"%d",i);
    [self addChild:motor z:1 tag:1];
}
-(void) removeAccident{
    [self removeChildByTag:1 cleanup:YES];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector]convertToGL:location];
    
    if(CGRectContainsPoint([btmain boundingBox], location)){
        [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
        [self scheduleOnce:@selector(mainmenu) delay:0];
    }else if(CGRectContainsPoint([btplay boundingBox], location)){
        [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
        [self scheduleOnce:@selector(play) delay:0];
    }
}
-(void)mainmenu{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[SPMenuScene scene]]];
}
-(void)play{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[PlaygameScene scene]]];
}

@end

