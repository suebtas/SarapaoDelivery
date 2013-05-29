//
//  SPPlaygameLayer.m
//  game
//
//  Created by timut on 2/17/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "SPPlaygameLayer.h"
#import "SimpleAudioEngine.h"
#import <time.h>

@implementation SPPlaygameLayer

-(id)init{
    if( (self=[super init]) ) {
        [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
        isTouchEnabled_=YES;
        
        checkhome = NO;
        i=0;
        numB=30;
        cpoint = 0;
        score = 0;
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"motor_default.plist"];
		motor = [CCSprite spriteWithSpriteFrameName:@"left1.png"];
        motor.position = ccp(180,100);
        CCSpriteBatchNode *batchNode = [CCSpriteBatchNode batchNodeWithFile:@"motor_default.png"];
		[batchNode addChild:motor];
		[self addChild:batchNode z:1];
        
        
        
        
       
        
        
        
        CCSprite *displayScore = [CCSprite spriteWithFile:@"score.png"];
        displayScore.position = ccp(255,450);
        displayScore.opacity = 350.0;
        [self addChild:displayScore z:2];
        
        scoreLabel = [CCLabelTTF labelWithString:@"" dimensions:CGSizeMake(120, 40) hAlignment:UITextAlignmentRight fontName:@"Marker Felt" fontSize:16];
        scoreLabel.position = ccp(223,438);
        [scoreLabel setColor:ccWHITE];
        [self addChild:scoreLabel z:2];
        
        levelLabel = [CCLabelTTF labelWithString:@"" dimensions:CGSizeMake(120, 40) hAlignment:UITextAlignmentRight fontName:@"Marker Felt" fontSize:16];
        levelLabel.position = ccp(214,420);
        [levelLabel setColor:ccWHITE];
        [self addChild:levelLabel z:2];
        
        
        buttonpause = [CCSprite spriteWithFile:@"button_pause.png"];
        buttonpause.position = ccp(280,30);
        buttonpause.scale = 0.8;
        [self addChild:buttonpause z:2];
        
        
        r =[Road alloc];
        
        
        
        
        
        rScroll = [r ShowRoad];
        
        [rScroll runAction:[CCSequence actions:[CCMoveBy actionWithDuration:1.7 position:ccp(0,-481)],nil]];
        [self addChild:rScroll];
        [self schedule:@selector(scroll)];
        [self schedule:@selector(hit)];
        [self schedule:@selector(runscore)];
        [self schedule:@selector(checkLevel)];
        [self soundAccelerate];
    }
    return self;
}
-(void)soundAccelerate{
    [[SimpleAudioEngine sharedEngine] playEffect:@"Accelerate.mp3"];
    [self scheduleOnce:@selector(soundMotor) delay:0.5];
    
}
-(void)soundMotor{
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"speed.mp3"];
}
-(void)soundidle{
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"idle.mp3"];
}
-(void)soundbrake{
    [[SimpleAudioEngine sharedEngine] playEffect:@"brake.mp3"];
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
}
-(void)runscore{
    score++;
    [scoreLabel setString:[NSString stringWithFormat:@"%d",score]];
    
}
-(void)sarapaoMove{
    [self unschedule:@selector(runscore)];
    numSara = 0;
    [self schedule:@selector(sarapaoAction) interval:0.1 repeat:9 delay:0.2f];
    [self schedule:@selector(removeSarapao) interval:0.1 repeat:9 delay:0.3f];
    [self scheduleOnce:@selector(rungame) delay:3.0f];
    [[SimpleAudioEngine sharedEngine] playEffect:@"move.mp3"];
    
    
    scplusLabel = [CCLabelTTF labelWithString:@"+50" dimensions:CGSizeMake(50, 40) hAlignment:UITextAlignmentRight fontName:@"Marker Felt" fontSize:30];
    scplusLabel.position = ccp(30,170);
    [scplusLabel setColor:ccRED];
    scplusLabel.opacity = 1.0;
    [self addChild:scplusLabel z:2];
    [scplusLabel runAction:[CCSequence actions:[CCFadeTo actionWithDuration:0.5 opacity:1000], nil]];
    [scplusLabel runAction:[CCSequence actions:[CCMoveBy actionWithDuration:0.5 position:ccp(0,30)], nil]];
    [[SimpleAudioEngine sharedEngine] playEffect:@"score.mp3"];
}
-(void)rungame{
    score = score+50;
    [scoreLabel setString:[NSString stringWithFormat:@"%d",score]];
    [homeSarapao runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCMoveBy actionWithDuration:1.8 position:ccp(0,-500)], nil]];
    [self schedule:@selector(scroll)];
    [self schedule:@selector(checkLevel)];
    [self schedule:@selector(runscore)];
    self.isTouchEnabled = YES;
    [scplusLabel runAction:[CCSequence actions:[CCFadeTo actionWithDuration:0.5 opacity:0], nil]];
    [scplusLabel runAction:[CCSequence actions:[CCMoveBy actionWithDuration:0.5 position:ccp(0,-30)], nil]];
    
    
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    [self soundAccelerate];
}
-(void)sarapaoAction{
    sarapaoArray = [NSArray arrayWithObjects:@"sharapho1.png",@"sharapho2.png",@"sharapho3.png",@"sharapho4.png",@"sharapho5.png",@"sharapho5.png",@"sharapho4.png",@"sharapho3.png",@"sharapho2.png",@"sharapho1.png", nil];
    sarapao = [CCSprite spriteWithFile:[sarapaoArray objectAtIndex:numSara]];
    if (numSara==0){
        sarapao.position = ccp(180,100);
    }else if(numSara==1){
        sarapao.position = ccp(160,110);
    }else if(numSara==2){
        sarapao.position = ccp(140,120);
    }else if(numSara==3){
        sarapao.position = ccp(120,130);
    }else if(numSara==4){
        sarapao.position = ccp(110,140);
    }else if(numSara==5){
        sarapao.position = ccp(100,140);
    }else if(numSara==6){
        sarapao.position = ccp(90,130);
    }else if(numSara==7){
        sarapao.position = ccp(80,120);
    }else if(numSara==8){
        sarapao.position = ccp(70,110);
    }else if(numSara==9){
        sarapao.position = ccp(60,100);
    }
    numSara++;
    [self addChild:sarapao z:2 tag:100];
}
-(void)removeSarapao{
    [self removeChildByTag:100 cleanup:YES];
}
-(void)checkLevel
{
    if(score == 1000){
        [self scheduleOnce:@selector(soundbrake) delay:2];
        [self scheduleOnce:@selector(soundidle) delay:2.5];
        
        self.isTouchEnabled = NO;
        [self unschedule:@selector(objecthome)];
        [self unschedule:@selector(checkLevel)];
        [self unschedule:@selector(addobjectBarrier)];
        homeSarapao = [CCSprite spriteWithFile:@"home10.png"];
        homeSarapao.position = ccp(35,600);
        [self addChild:homeSarapao z:1];
        [homeSarapao runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCMoveBy actionWithDuration:1.8 position:ccp(0,-500)], nil]];
		if(cpoint == -1){
            [self scheduleOnce:@selector(turnright2) delay:1.5f];
        }else if (cpoint == 1){
            [self scheduleOnce:@selector(turnleft2) delay:1.5f];
        }
        
        
        [self scheduleOnce:@selector(sarapaoMove) delay:2.5];
        [self unschedule:@selector(scroll)];
    }else if(score == 2000){
        [self scheduleOnce:@selector(soundbrake) delay:2];
        [self scheduleOnce:@selector(soundidle) delay:2.5];
        
        self.isTouchEnabled = NO;
        [self unschedule:@selector(objecthome)];
        [self unschedule:@selector(checkLevel)];
        [self unschedule:@selector(addobjectBarrier)];
        homeSarapao = [CCSprite spriteWithFile:@"home10.png"];
        homeSarapao.position = ccp(35,600);
        [self addChild:homeSarapao z:1];
		if(cpoint == -1){
            [self scheduleOnce:@selector(turnright2) delay:1];
        }else if (cpoint == 1){
            [self scheduleOnce:@selector(turnleft2) delay:1];
        }
        [homeSarapao runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCMoveBy actionWithDuration:1.8 position:ccp(0,-500)], nil]];
        
        [self scheduleOnce:@selector(sarapaoMove) delay:2.5];
        [self unschedule:@selector(scroll)];
    }else if(score == 3000){
        [self scheduleOnce:@selector(soundbrake) delay:2];
        [self scheduleOnce:@selector(soundidle) delay:2.5];
        
        self.isTouchEnabled = NO;
        [self unschedule:@selector(objecthome)];
        [self unschedule:@selector(checkLevel)];
        [self unschedule:@selector(addobjectBarrier)];
        homeSarapao = [CCSprite spriteWithFile:@"home10.png"];
        homeSarapao.position = ccp(35,600);
        [self addChild:homeSarapao z:1];
		if(cpoint == -1){
            [self scheduleOnce:@selector(turnright2) delay:1];
        }else if (cpoint == 1){
            [self scheduleOnce:@selector(turnleft2) delay:1];
        }
        [homeSarapao runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCMoveBy actionWithDuration:1.8 position:ccp(0,-500)], nil]];
        
        [self scheduleOnce:@selector(sarapaoMove) delay:2.5];
        [self unschedule:@selector(scroll)];
    }else if(score == 4000){
        [self scheduleOnce:@selector(soundbrake) delay:2];
        [self scheduleOnce:@selector(soundidle) delay:2.5];
        
        self.isTouchEnabled = NO;
        [self unschedule:@selector(objecthome)];
        [self unschedule:@selector(checkLevel)];
        [self unschedule:@selector(addobjectBarrier)];
        homeSarapao = [CCSprite spriteWithFile:@"home10.png"];
        homeSarapao.position = ccp(35,600);
        [self addChild:homeSarapao z:1];
		if(cpoint == -1){
            [self scheduleOnce:@selector(turnright2) delay:1];
        }else if (cpoint == 1){
            [self scheduleOnce:@selector(turnleft2) delay:1];
        }
        [homeSarapao runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCMoveBy actionWithDuration:1.8 position:ccp(0,-500)], nil]];
        
        [self scheduleOnce:@selector(sarapaoMove) delay:2.5];
        [self unschedule:@selector(scroll)];
    }else if(score == 5000){
        [self scheduleOnce:@selector(soundbrake) delay:2];
        [self scheduleOnce:@selector(soundidle) delay:2.5];
        
        self.isTouchEnabled = NO;
        [self unschedule:@selector(objecthome)];
        [self unschedule:@selector(checkLevel)];
        [self unschedule:@selector(addobjectBarrier)];
        homeSarapao = [CCSprite spriteWithFile:@"home10.png"];
        homeSarapao.position = ccp(35,600);
        [self addChild:homeSarapao z:1];
		if(cpoint == -1){
            [self scheduleOnce:@selector(turnright2) delay:1];
        }else if (cpoint == 1){
            [self scheduleOnce:@selector(turnleft2) delay:1];
        }
        [homeSarapao runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCMoveBy actionWithDuration:1.8 position:ccp(0,-500)], nil]];
        
        [self scheduleOnce:@selector(sarapaoMove) delay:2.5];
        [self unschedule:@selector(scroll)];
    }else if(score == 6000){
        [self scheduleOnce:@selector(soundbrake) delay:2];
        [self scheduleOnce:@selector(soundidle) delay:2.5];
        
        self.isTouchEnabled = NO;
        [self unschedule:@selector(objecthome)];
        [self unschedule:@selector(checkLevel)];
        [self unschedule:@selector(addobjectBarrier)];
        homeSarapao = [CCSprite spriteWithFile:@"home10.png"];
        homeSarapao.position = ccp(35,600);
        [self addChild:homeSarapao z:1];
		if(cpoint == -1){
            [self scheduleOnce:@selector(turnright2) delay:1];
        }else if (cpoint == 1){
            [self scheduleOnce:@selector(turnleft2) delay:1];
        }
        [homeSarapao runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCMoveBy actionWithDuration:1.8 position:ccp(0,-500)], nil]];
        
        [self scheduleOnce:@selector(sarapaoMove) delay:2.5];
        [self unschedule:@selector(scroll)];
    }else if(score == 7000){
        [self scheduleOnce:@selector(soundbrake) delay:2];
        [self scheduleOnce:@selector(soundidle) delay:2.5];
        
        self.isTouchEnabled = NO;
        [self unschedule:@selector(objecthome)];
        [self unschedule:@selector(checkLevel)];
        [self unschedule:@selector(addobjectBarrier)];
        homeSarapao = [CCSprite spriteWithFile:@"home10.png"];
        homeSarapao.position = ccp(35,600);
        [self addChild:homeSarapao z:1];
		if(cpoint == -1){
            [self scheduleOnce:@selector(turnright2) delay:1];
        }else if (cpoint == 1){
            [self scheduleOnce:@selector(turnleft2) delay:1];
        }
        [homeSarapao runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCMoveBy actionWithDuration:1.8 position:ccp(0,-500)], nil]];
        
        [self scheduleOnce:@selector(sarapaoMove) delay:2.5];
        [self unschedule:@selector(scroll)];
    }else if(score == 8000){
        [self scheduleOnce:@selector(soundbrake) delay:2];
        [self scheduleOnce:@selector(soundidle) delay:2.5];
        
        self.isTouchEnabled = NO;
        [self unschedule:@selector(objecthome)];
        [self unschedule:@selector(checkLevel)];
        [self unschedule:@selector(addobjectBarrier)];
        homeSarapao = [CCSprite spriteWithFile:@"home10.png"];
        homeSarapao.position = ccp(35,600);
        [self addChild:homeSarapao z:1];
		if(cpoint == -1){
            [self scheduleOnce:@selector(turnright2) delay:1];
        }else if (cpoint == 1){
            [self scheduleOnce:@selector(turnleft2) delay:1];
        }
        [homeSarapao runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCMoveBy actionWithDuration:1.8 position:ccp(0,-500)], nil]];
        
        [self scheduleOnce:@selector(sarapaoMove) delay:2.5];
        [self unschedule:@selector(scroll)];
    }else if(score == 9000){
        [self scheduleOnce:@selector(soundbrake) delay:2];
        [self scheduleOnce:@selector(soundidle) delay:2.5];
        
        self.isTouchEnabled = NO;
        [self unschedule:@selector(objecthome)];
        [self unschedule:@selector(checkLevel)];
        [self unschedule:@selector(addobjectBarrier)];
        homeSarapao = [CCSprite spriteWithFile:@"home10.png"];
        homeSarapao.position = ccp(35,600);
        [self addChild:homeSarapao z:1];
		if(cpoint == -1){
            [self scheduleOnce:@selector(turnright2) delay:1];
        }else if (cpoint == 1){
            [self scheduleOnce:@selector(turnleft2) delay:1];
        }
        [homeSarapao runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCMoveBy actionWithDuration:1.8 position:ccp(0,-500)], nil]];
        
        [self scheduleOnce:@selector(sarapaoMove) delay:2.5];
        [self unschedule:@selector(scroll)];
    }else if(score < 1000){
        [levelLabel setString:@"1"];
        [self schedule:@selector(objecthome)interval:0.7 ];
        [self schedule:@selector(addobjectBarrier) interval:1.7];
    }else if (score < 2000){
        [levelLabel setString:@"2"];
        [self schedule:@selector(objecthome)interval:0.7 ];
        [self schedule:@selector(addobjectBarrier) interval:1.5];
    }else if (score < 3000){
        [levelLabel setString:@"3"];
        [self schedule:@selector(objecthome)interval:0.7 ];
        [self schedule:@selector(addobjectBarrier) interval:1.3];
    }else if (score < 4000){
        [levelLabel setString:@"4"];
        [self schedule:@selector(objecthome)interval:0.7 ];
        [self schedule:@selector(addobjectBarrier) interval:1.2];
    }else if (score < 5000){
        [levelLabel setString:@"5"];
        [self schedule:@selector(objecthome)interval:0.7 ];
        [self schedule:@selector(addobjectBarrier) interval:1.0];
    }else if (score < 6000){
        [levelLabel setString:@"6"];
        [self schedule:@selector(objecthome)interval:0.7 ];
        [self schedule:@selector(addobjectBarrier) interval:0.9];
    }else if (score < 7000){
        [levelLabel setString:@"7"];
        [self schedule:@selector(objecthome)interval:0.7 ];
        [self schedule:@selector(addobjectBarrier) interval:0.8];
    }else if (score < 8000){
        [levelLabel setString:@"8"];
        [self schedule:@selector(objecthome)interval:0.7 ];
        [self schedule:@selector(addobjectBarrier) interval:0.7];
    }else if (score < 9000){
        [levelLabel setString:@"9"];
        [self schedule:@selector(objecthome)interval:0.7 ];
        [self schedule:@selector(addobjectBarrier) interval:0.6];
    }else if (score > 9000){
        [levelLabel setString:@"10"];
        [self schedule:@selector(objecthome)interval:0.7 ];
        [self schedule:@selector(addobjectBarrier) interval:0.5];
    }
}

-(void)scroll
{
    if(rScroll.position.y < 0)
    {
        rScroll.position=ccp(160,480);
        [rScroll runAction:[CCSequence actions:[CCMoveBy actionWithDuration:1.7 position:ccp(0,-481)],nil]];
    }
}
-(void)checkpoint{
    check = NO;
}

-(void) objecthome {
    
    homeArray = [r ShowHome];
    NSUInteger randomindex = (NSUInteger)floor (arc4random()%[homeArray count]);
    NSString *homestring = [homeArray objectAtIndex:randomindex];
    home = [CCSprite spriteWithFile:homestring];
    home.position = ccp(35,600);
    
    
    if(i < 15)
    {
        i++;
        [self addChild:home z:1 tag:i];
        NSLog(@"home%d",i);
    }else if (i == 15 && checkhome == YES)
    {
        i++;
        [self addChild:home z:1 tag:i];
        for (int c=16; c <=30; c++)
        {
            [self removeChildByTag:c cleanup:YES];
        }
        NSLog(@"home%d",i);
    }
    
    else if (i == 15)
    {
        i++;
        [self addChild:home z:1 tag:i ];
        NSLog(@"home%d",i);
    }else if(i < 30){
        i++;
        [self addChild:home z:1 tag:i];
        NSLog(@"home%d",i);
    }
    else if (i == 30)
    {
        for (int c=1; c <=15; c++)
        {
            [self removeChildByTag:c cleanup:YES];
        }
        i=0;
        checkhome = YES;
    }
    [home runAction:[CCSequence actions:[CCMoveBy actionWithDuration:2 position:ccp(0,-700)], nil]];
}
-(void) addobjectBarrier{
    barrierArray = [r ShowBarrier];
    NSUInteger randomindexB = (NSUInteger)floor (arc4random()%[barrierArray count]);
    pstBar = [NSArray arrayWithObjects:@"105",@"180",@"250", nil];
    NSUInteger randomposition = (NSUInteger)floor (arc4random()%[pstBar count]);
    barrier = [CCSprite spriteWithFile:[barrierArray objectAtIndex:randomindexB]];
    barrier.position = ccp([[pstBar objectAtIndex:randomposition]intValue],600);
    barrier.scaleX = 0.8;
    barrier.scaleY = 0.8;
    
    
    
    if(numB < 45)
    {
        numB++;
        [self addChild:barrier z:1 tag:numB];
    }else if (numB == 45 && checkbar == YES)
    {
        numB++;
        [self addChild:barrier z:1 tag:numB];
        for (int c=46; c <=60; c++)
        {
            [self removeChildByTag:c cleanup:YES];
        }
    }
    
    else if (numB == 45)
    {
        numB++;
        [self addChild:barrier z:1 tag:numB];
    }else if(numB < 60){
        numB++;
        [self addChild:barrier z:1 tag:numB];
    }
    else if (numB == 60)
    {
        for (int c=31; c <=45; c++)
        {
            [self removeChildByTag:c cleanup:YES];
        }
        numB=30;
        checkbar = YES;
    }
    
    movebarrier = [CCMoveBy actionWithDuration:2 position:ccp(0,-700)];
    [barrier runAction:movebarrier];
    NSLog(@"B%d",numB);
    
}
-(void)hit
{
    float distance = 0; 
    for(int t = 31;t <= 60;t++){
        CCSprite *cbar = (CCSprite *)[self getChildByTag:t];
        distance = hypotf(cbar.position.x - motor.position.x, cbar.position.y - motor.position.y);
        if(distance < 40){
                [self saveScore];
                [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
                [[SimpleAudioEngine sharedEngine] playEffect:@"Accident.mp3"];
                [[CCDirector sharedDirector] replaceScene:[AccidentScene scene]];
                NSLog(@"hit%f",distance);
        }
    }
   
}
-(void)saveScore{
    
    M =[ManageScore alloc];
    scoreold = [[M readDataForKey:@"highscore"]intValue];
    if (scoreold > score){
        [M saveData:[NSString stringWithFormat:@"%d",score] forKey:@"score"];
    }else if (score > scoreold){
        [M saveData:[NSString stringWithFormat:@"%d",score] forKey:@"score"];
        [M saveData:[NSString stringWithFormat:@"%d",score] forKey:@"highscore"];
    }
    GKScore *scoreGC = [[[GKScore alloc]initWithCategory:@"th.ac.mut.it.SarapaoDelivery.leaderboard.escape"] autorelease];
    scoreGC.value = score;
    [scoreGC reportScoreWithCompletionHandler:^(NSError *error) {
        if (error != nil)
        {
            NSLog(@"Submitting a highscore failed!!!");
        }
        else {
            NSLog(@"Submitting highcore Succeeded!!!");
        }
    }];
}


-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector]convertToGL:location];
    
    slt1 = [NSString stringWithFormat:@"%f",location.x];
    nlt1 = [slt1 intValue];
    NSLog(@"%d",nlt1);
    
    
    if(CGRectContainsPoint([buttonpause boundingBox], location)){
        [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
        NSLog(@"test");
        [self pauselayer];
    }
}

-(void)pauselayer{
    [[SimpleAudioEngine sharedEngine]pauseBackgroundMusic];
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"bgsound.mp3"];
    [[CCDirector sharedDirector] pause];
    pauseLayer=[[CCLayer alloc] init];
    bgpause = [CCSprite spriteWithFile:@"pause.png"];
    bgpause.position = ccp(160,240);
    [pauseLayer addChild:bgpause z:0];
    [self addChild:pauseLayer z:3];
    CCMenuItem *resume = [CCMenuItemImage itemWithNormalImage:@"button_resume.png" selectedImage:@"button_resume.png" target:self selector:@selector(resumeGame)];
    CCMenuItem *restart = [CCMenuItemImage itemWithNormalImage:@"button_restart.png" selectedImage:@"button_restart.png" target:self selector:@selector(restartgame)];
    CCMenuItem *backmenu = [CCMenuItemImage itemWithNormalImage:@"button_mainmenu.png" selectedImage:@"button_mainmenu.png" target:self selector:@selector(mainmenu)];
    CCMenu *pauseMenu = [CCMenu menuWithItems:resume,restart,backmenu, nil];
    [pauseMenu alignItemsVertically];
    pauseMenu.position = ccp(210,300);
    [pauseLayer addChild:pauseMenu z:10];
}

-(void)resumeGame{
    [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
    [self scheduleOnce:@selector(soundMotor) delay:0.5];
    [self removeChild:pauseLayer cleanup:YES];
    [[CCDirector sharedDirector] resume];
}
-(void)restartgame{
    [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
    [self removeChild:pauseLayer cleanup:YES];
    [[CCDirector sharedDirector] resume];
    [[CCDirector sharedDirector] replaceScene:[PlaygameScene scene]];
}
-(void)mainmenu{
    [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
    [self removeChild:pauseLayer cleanup:YES];
    [[CCDirector sharedDirector] resume];
    [[CCDirector sharedDirector] replaceScene:[SPMenuScene scene]];
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch2 = [touches anyObject];
    CGPoint location2 = [touch2 locationInView:[touch2 view]];
    location2 = [[CCDirector sharedDirector]convertToGL:location2];
    
    slt2 = [NSString stringWithFormat:@"%f",location2.x];
    nlt2 = [slt2 intValue];
    NSLog(@"%d",nlt2);
    
    if(nlt1 > nlt2 && cpoint == 0 && check==NO){
        [self turnleft];
    }else if(nlt1 < nlt2 && cpoint == 0 && check==NO){
        [self turnright];
    }else if(nlt1 < nlt2 && cpoint == -1 && check==NO){
        [self turnright2];
    }else if(nlt1 > nlt2 && cpoint == 1 && check==NO){
        [self turnleft2];
    }
}
-(void)turnright
{
    check = YES;
    animFrames = [NSMutableArray array];
    for(int numframe = 1; numframe < 6; numframe++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"right%d.png",numframe]];
        [animFrames addObject:frame];
    }
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.05f ];
    id right1 = [CCAnimate actionWithAnimation:animation];
    id right2 =[CCMoveBy actionWithDuration:0.5 position:ccp(70,0)];
    [motor runAction:[CCSequence actions:right1,[right1 reverse],nil]];
    [motor runAction:[CCSequence actions:right2, nil]];
    [self scheduleOnce:@selector(checkpoint) delay:0.5];
    
    
    cpoint = cpoint+1;
    NSLog(@"%d",cpoint);
}
-(void)turnright2
{
    check = YES;
    animFrames = [NSMutableArray array];
    for(int numframe = 1; numframe < 6; numframe++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"right%d.png",numframe]];
        [animFrames addObject:frame];
    }
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.05f ];
    id right1 = [CCAnimate actionWithAnimation:animation];
    id right2 =[CCMoveBy actionWithDuration:0.5 position:ccp(75,0)];
    [motor runAction:[CCSequence actions:right1,[right1 reverse],nil]];
    [motor runAction:[CCSequence actions:right2, nil]];
    [self scheduleOnce:@selector(checkpoint) delay:0.5];
    
    cpoint = cpoint+1;
    NSLog(@"%d",cpoint);
}
-(void)turnleft
{
    check = YES;
    animFrames = [NSMutableArray array];
    for(int numframe = 1; numframe < 6; numframe++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"left%d.png",numframe]];
        [animFrames addObject:frame];
    }
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.05f ];
    id left1 = [CCAnimate actionWithAnimation:animation];
    id left2 =[CCMoveBy actionWithDuration:0.5 position:ccp(-75,0)];
    [motor runAction:[CCSequence actions:left2, nil]];
    [motor runAction:[CCSequence actions:left1,[left1 reverse],nil]];
    [self scheduleOnce:@selector(checkpoint) delay:0.5];
    cpoint = cpoint-1;
    NSLog(@"%d",cpoint);
}
-(void)turnleft2
{
    check = YES;
    animFrames = [NSMutableArray array];
    for(int numframe = 1; numframe < 6; numframe++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"left%d.png",numframe]];
        [animFrames addObject:frame];
    }
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.05f ];
    id left1 = [CCAnimate actionWithAnimation:animation];
    id left2 =[CCMoveBy actionWithDuration:0.5 position:ccp(-70,0)];
    [motor runAction:[CCSequence actions:left1,[left1 reverse],nil]];
    [motor runAction:[CCSequence actions:left2, nil]];
    [self scheduleOnce:@selector(checkpoint) delay:0.5];
    

    cpoint = cpoint-1;
    NSLog(@"%d",cpoint);
}
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
