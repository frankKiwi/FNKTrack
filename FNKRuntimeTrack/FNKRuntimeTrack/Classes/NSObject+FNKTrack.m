//
//  NSObject+FNKTrack.m
//  FNKTrack
//
//  Created by lanfudong on 2020/2/27.
//

#import "NSObject+FNKTrack.h"
#import <objc/runtime.h>

@implementation NSObject (FNKTrack)

+ (BOOL)fud_swizzleInstanceMethodSEL:(SEL)originalSEL withSEL:(SEL)targetSEL {
    Method originalMethod = class_getInstanceMethod([self class], originalSEL);
    if (!originalMethod) {
        return NO;
    }
    Method targetMethod = class_getInstanceMethod([self class], targetSEL);
    if (!targetMethod) {
        return NO;
    }
    
    BOOL success = class_addMethod([self class], originalSEL, method_getImplementation(targetMethod), method_getTypeEncoding(targetMethod));
    if (success) {
        class_replaceMethod([self class], targetSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, targetMethod);
    }
    
    return YES;
}

+ (BOOL)fud_swizzleClassMethodSEL:(SEL)originalSEL withSEL:(SEL)targetSEL {
    Class metaClass = object_getClass(self);
    Method originalMethod = class_getClassMethod(metaClass, originalSEL);
    if (!originalMethod) {
        return NO;
    }
    Method targetMethod = class_getClassMethod(metaClass, targetSEL);
    if (!targetMethod) {
        return NO;
    }
    
    BOOL success = class_addMethod(metaClass, originalSEL, method_getImplementation(targetMethod), method_getTypeEncoding(targetMethod));
    if (success) {
        class_replaceMethod(metaClass, targetSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, targetMethod);
    }
    
    return YES;
}

@end
