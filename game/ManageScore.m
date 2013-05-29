//
//  ManageScore.m
//  SarapaoDelivery
//
//  Created by timut on 4/29/56 BE.
//  Copyright 2556 __MyCompanyName__. All rights reserved.
//

#import "ManageScore.h"


@implementation ManageScore

-(void)createPlistFile{
	NSDictionary *plistDict = [NSDictionary dictionaryWithObjectsAndKeys:@"0",@"score",@"0",@"highscore",
                               nil];
	[plistDict writeToFile:plistFile atomically:NO];
}


-(void)openPlistFile{
	NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	if ([path count] >0) {
		plistFile = [[path objectAtIndex:0] stringByAppendingPathComponent:@"SarapaoData.plist"];
		
		NSDictionary *plistDict = [[NSDictionary alloc] initWithContentsOfFile:plistFile ];
		if ([plistDict count] <= 0) {
			// create the file
			[self createPlistFile];
		}
		
		[plistDict release];
		plistDict = nil;
	}
}

-(NSString*)readDataForKey:(NSString *)key{
	// first check if the file was created
	[self openPlistFile];
	
	NSDictionary *plistDict = [[NSDictionary alloc] initWithContentsOfFile:plistFile ];
	NSString *value;
	value = [[[NSString alloc] initWithString:[plistDict objectForKey:key]]autorelease];
	
	[plistDict release];
	plistDict = nil;
	return value;
}


-(void)saveData:(NSString*)value forKey:(NSString*)key{
	[self openPlistFile];
	// going to user mutable dictionary so can edit the content
	NSMutableDictionary *plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistFile ];
	[plistDict removeObjectForKey: key];
	[plistDict setObject:value forKey:key];
	[plistDict writeToFile:plistFile atomically:NO];
	[plistDict release];
	plistDict = nil;
}


@end
