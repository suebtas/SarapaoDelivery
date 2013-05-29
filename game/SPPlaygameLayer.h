//
//  SPPlaygameLayer.h
//  game
//
//  Created by timut on 2/17/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "cocos2d.h"
#import "Road.h"
#import "AccidentScene.h"
#import "PlaygameScene.h"
#import "SPMenuScene.h"
#import "ManageScore.h"

@interface SPPlaygameLayer : CCLayer {
    CCSprite *motor;
    CGFloat *num;
    NSString *slt1;
    NSString *slt2;
    int nlt1;
    int nlt2;
    int cpoint;
    Road *r;
    CCSprite *rScroll;
    NSMutableArray *animFrames;
    CCAnimation *animation;
    bool check;
    NSMutableArray *homeArray;
    NSInteger *randomIndex;
    CCSprite *home;
    int i;
    bool checkhome;
    bool checkbar;
    NSMutableArray *barrierArray;
    CCSprite *barrier;
    int numB;
    NSMutableArray *pstBar;
    CCAction *movebarrier;
    CCLabelTTF *scoreLabel;
    CCLabelTTF *levelLabel;
    CCSprite *buttonpause;
    CCLayer *pauseLayer;
    CCSprite *bgpause;
    int score;
    NSMutableArray *sarapaoArray;
    CCSprite *sarapao;
    CCSprite *homeSarapao;
    int numSara;
    CCLabelTTF *scplusLabel;
    ManageScore *M;
    int scoreold;
}

@end
