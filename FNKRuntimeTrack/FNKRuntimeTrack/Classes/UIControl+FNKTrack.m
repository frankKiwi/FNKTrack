//
//  UIControl+FNKTrack.m
//  FNKTrack
//
//  Created by lanfudong on 2020/2/27.
//

#import "UIControl+FNKTrack.h"
#import "NSObject+FNKTrack.h"
#import "FNKTrackDataConfig.h"

@implementation UIControl (FNKTrack)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self fud_swizzleInstanceMethodSEL:@selector(sendAction:to:forEvent:) withSEL:@selector(fud_sendAction:to:forEvent:)];
    });
}

- (void)fud_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [self fud_sendAction:action to:target forEvent:event];
    if ([FNKTrackDataConfig getControlParams:target andAction:action]) {
         NSLog(@"FNKTrack: [%@_%@]_%@_sendAction", [target class], NSStringFromSelector(action), NSStringFromClass([self class])?:@"defaultControl");
    }
    
}

@end
