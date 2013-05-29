//
//  SPHightscoreLayer.m
//  game
//
//  Created by timut on 3/7/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "SPHightscoreLayer.h"
#import "SimpleAudioEngine.h"

@implementation SPHightscoreLayer 
-(id)init{
    if( (self=[super init]) ) {
        self.isTouchEnabled = YES;
        [self showHightscore];
        
    }
    return self;
}


-(void)showHightscore{
    CGSize size = [[CCDirector sharedDirector]winSize];
    bg = [CCSprite spriteWithFile:@"6hightscore.png"];
    bg.position = ccp(size.width/2, size.height/2);
    btmain = [CCSprite spriteWithFile:@"button_mainmenu.png"];
    btmain.position = ccp(250, 60);
    btleader = [CCSprite spriteWithFile:@"button_leader.png"];
    btleader.position = ccp(100,30);
    
    scoreLabel = [CCLabelTTF labelWithString:@"" dimensions:CGSizeMake(120, 40) hAlignment:UITextAlignmentCenter fontName:@"Marker Felt" fontSize:25];
    scoreLabel.position = ccp(170,250);
    [scoreLabel setColor:ccRED];
    [self addChild:scoreLabel z:1];
    
    m =[ManageScore alloc];
    [scoreLabel setString:[m readDataForKey:@"highscore"]];
    
    [self addChild:bg z:0];
    [self addChild:btmain z:1];
    [self addChild:btleader z:1];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector]convertToGL:location];
    
    if(CGRectContainsPoint([btmain boundingBox], location)){
        [[SimpleAudioEngine sharedEngine] playEffect:@"button.mp3"];
        [self scheduleOnce:@selector(mainmenu) delay:0];
    }else if (CGRectContainsPoint([btleader boundingBox], location)){
        [self showLeaderboard];
        
        
    }
    
}

-(void) showLeaderboard
{
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if (leaderboardController != nil)
    {
        leaderboardController.leaderboardDelegate = self;
        leaderboardController.category = @"th.ac.mut.it.SarapaoDelivery.leaderboard.escape";
        leaderboardController.timeScope = GKLeaderboardTimeScopeAllTime;
        
        app = (AppController*)[UIApplication sharedApplication].delegate;
        [app.navController presentViewController: leaderboardController animated: YES completion:nil];
    }
}

- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    NSLog(@"done is pressed");
    [app.navController dismissModalViewControllerAnimated: YES];
    [viewController release];
}

-(void)mainmenu{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[SPMenuScene scene]]];
}
@end
