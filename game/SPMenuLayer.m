//
//  SPMenu.m
//  game
//
//  Created by timut on 2/14/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "SPMenuLayer.h"
#import "SimpleAudioEngine.h"

@implementation SPMenuLayer

-(id)init{
    if( (self=[super init]) ) {
        checkmenu = 0;
        self.isTouchEnabled = YES;
        [self showMenu];
        
        
    }
    return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector]convertToGL:location];
    if(checkmenu == 0){
        if(CGRectContainsPoint([btplay boundingBox], location)){
            checkmenu++;
            [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
            [self scheduleOnce:@selector(play) delay:0];
        }else if (CGRectContainsPoint([bthow boundingBox], location)){
    
            [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
            [self scheduleOnce:@selector(how) delay:0];
        }else if (CGRectContainsPoint([bthight boundingBox], location)){
            
            [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
            [self scheduleOnce:@selector(hight) delay:0];
            
        }else if (CGRectContainsPoint([btabout boundingBox], location)){
            
            [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
            [self scheduleOnce:@selector(aboutUs) delay:0];
        }
    }else{
        if(CGRectContainsPoint([btstart boundingBox], location)){
            [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[PlaygameScene scene]]];
        }
    }
}
-(id)showMenu{
    CGSize size = [[CCDirector sharedDirector]winSize];
    
    bg = [CCSprite spriteWithFile:@"2mainmenu.png"];
    bg.position = ccp(size.width/2, size.height/2);
    
    
    btplay = [CCSprite spriteWithFile:@"button1.png"];
    btplay.position = ccp(100 ,220);
   
    
    bthow= [CCSprite spriteWithFile:@"button2.png"];
    bthow.position = ccp(100 ,180);
    
    
    bthight = [CCSprite spriteWithFile:@"button4.png"];
    bthight.position = ccp(100 ,140);
    
    
    btabout = [CCSprite spriteWithFile:@"button3.png"];
    btabout.position = ccp(100 ,100);
    
    
    
    
    [self addChild:bg z:0 tag:1];
    [self addChild:btplay z:1 tag:2];
    [self addChild:bthow z:1 tag:3];
    [self addChild:bthight z:1 tag:4];
    [self addChild:btabout z:1 tag:5];
    NSLog(@"%f",size.width);
    
    return self;
}

-(void)play{
    for(int i = 1; i < 6;i++){
        [self removeChildByTag:i cleanup:YES];
    }
    CGSize size2 = [[CCDirector sharedDirector]winSize];
    bgstart =[CCSprite spriteWithFile:@"3start_game.png"];
    bgstart.position = ccp(size2.width/2, size2.height/2);
    
    id zoom =[CCScaleTo actionWithDuration:0.2 scale:1.0f];
    [bgstart runAction:zoom];
    btstart = [CCSprite spriteWithFile:@"button_start.png"];
    btstart.position = ccp(size2.width/2, 50);
    
    id zoombt =[CCScaleTo actionWithDuration:0.2 scale:1.0f];
    
    [btstart runAction:zoombt];
    
    [self addChild:bgstart z:0];
    [self addChild:btstart z:1];
    
}

-(void)how{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HowtoplayScene scene]]];
}

-(void)hight{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[SPHightscoreScene scene]]];
}
-(void)aboutUs{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[AboutScene scene]]];
}


@end
