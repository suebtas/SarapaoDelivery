//
//  SPMenu.h
//  game
//
//  Created by timut on 2/14/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCHelper.h"
#import "cocos2d.h"
#import "HowtoplayScene.h"
#import "AboutScene.h"
#import "PlaygameScene.h"
#import "SPHightscoreScene.h"
#import "AppDelegate.h"


@interface SPMenuLayer : CCLayer  
{
    CCSprite *bg;
    CCSprite *btplay;
    CCSprite *bthow;
    CCSprite *bthight;
    CCSprite *btabout;
    CCSprite *bgstart;
    CCSprite *btstart;
    int checkmenu;
    AppController *app;
    

}

@end
