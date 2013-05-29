//
//  SPHightscoreLayer.h
//  game
//
//  Created by timut on 3/7/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCHelper.h"
#import "cocos2d.h"
#import "SPMenuScene.h"
#import "ManageScore.h"
#import "AppDelegate.h"

@interface SPHightscoreLayer : CCLayer <GKLeaderboardViewControllerDelegate>{
    CCSprite *bg;
    CCSprite *btmain;
    CCSprite *btleader;
    CCLabelTTF *scoreLabel;
    ManageScore *m;
    AppController *app;
    UIViewController *controller;
}

@end
