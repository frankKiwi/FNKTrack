//
//  NSDictionary+ContainKey.m
//  FNKRuntimeTrack
//
//  Created by LWW on 2021/3/30.
//

#import "NSDictionary+ContainKey.h"



@implementation NSDictionary(ContainKey)

- (BOOL)containsObjectForKey:(id)key {
    if (!key) return NO;
    return self[key] != nil;
}

@end
