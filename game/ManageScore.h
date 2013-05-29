//
//  ManageScore.h
//  SarapaoDelivery
//
//  Created by timut on 4/29/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ManageScore : NSObject {
    NSString *plistFile;
}
//@property (nonatomic, retain) NSString *plistFile;
-(void)createPlistFile;
-(void)openPlistFile;
-(NSString*)readDataForKey:(NSString *)key;
-(void)saveData:(NSString*)value forKey:(NSString*)key;
@end
