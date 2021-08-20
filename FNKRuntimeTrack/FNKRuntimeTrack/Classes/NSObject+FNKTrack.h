//
//  NSObject+FNKTrack.h
//  FNKTrack
//
//  Created by lanfudong on 2020/2/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FNKTrack)

+ (BOOL)fud_swizzleInstanceMethodSEL:(SEL)originalSEL withSEL:(SEL)targetSEL;
+ (BOOL)fud_swizzleClassMethodSEL:(SEL)originalSEL withSEL:(SEL)targetSEL;

@end

NS_ASSUME_NONNULL_END
