//
//  AccidentLayer.h
//  game
//
//  Created by timut on 4/15/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ManageScore.h"
#import "SPMenuScene.h"
#import "PlaygameScene.h"
#import "SimpleAudioEngine.h"

@interface AccidentLayer : CCLayer {
    CCSprite *bg;
    NSMutableArray *motorArray;
    CCSprite *motor;
    int i;
    CCSprite *bg2;
    CCSprite *btmain;
    NSInteger score;
    CCLabelTTF *scoreLabel;
    ManageScore *M;
    NSString *scoreString;
    CCSprite *btplay;
}

@end
