//
//  Road.m
//  game
//
//  Created by timut on 2/26/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "Road.h"


@implementation Road
//CCSprite *Road1;
-(id)ShowRoad
{
    Road1 = [CCSprite spriteWithFile:@"road.png"];
    Road1.position=ccp(160,480);
    return Road1;
}
-(NSMutableArray *)ShowHome
{
    NSMutableArray *home = [NSArray arrayWithObjects:@"home1.png",@"home3.png",@"home4.png",@"home5.png",@"home6.png",@"home7.png",@"home8.png",@"home9.png",@"tree1.png",@"tree2.png",nil];
    return home;
}
-(NSMutableArray *)ShowBarrier
{
    NSMutableArray *barrier = [NSArray arrayWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"car1.png",@"car2.png",nil];
    return barrier;
}
@end
