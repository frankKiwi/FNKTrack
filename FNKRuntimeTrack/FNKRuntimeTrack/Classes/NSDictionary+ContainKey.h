//
//  NSDictionary+ContainKey.h
//  FNKRuntimeTrack
//
//  Created by LWW on 2021/3/30.
//



#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (ContainKey)
- (BOOL)containsObjectForKey:(id)key;

@end

NS_ASSUME_NONNULL_END
