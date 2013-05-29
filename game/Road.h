//
//  Road.h
//  game
//
//  Created by timut on 2/26/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Road : NSObject {
    CCSprite *Road1;
    //NSMutableArray *home;
}
//CCSprite *Road1;
-(id)ShowRoad;
-(id)ShowHome;
-(id)ShowBarrier;
@end
