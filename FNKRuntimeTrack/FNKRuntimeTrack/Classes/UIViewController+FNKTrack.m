//
//  UIViewController+FNKTrack.m
//  FNKTrack
//
//  Created by lanfudong on 2020/2/27.
//

#import "UIViewController+FNKTrack.h"
#import "NSObject+FNKTrack.h"
#import "FNKTrackDataConfig.h"

@implementation UIViewController (FNKTrack)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self fud_swizzleInstanceMethodSEL:@selector(viewDidLoad) withSEL:@selector(fud_viewDidLoad)];
        [self fud_swizzleInstanceMethodSEL:@selector(viewDidAppear:) withSEL:@selector(fud_viewDidAppear:)];
//        [self fud_swizzleInstanceMethodSEL:@selector(viewDidDisappear:) withSEL:@selector(fud_viewDidDisappear:)];
    });
}
- (void)fud_viewDidLoad{
    if ([FNKTrackDataConfig getViewControllerParams:self]) {
         NSLog(@"FNKTrack: [%@_fud_viewDidAppear:]", [self class]);
    }
}
- (void)fud_viewDidAppear:(BOOL)animated {
    [self fud_viewDidAppear:animated];
    if ([FNKTrackDataConfig resetDownloadParams:[self class]]) {
        NSLog(@"FNKTrack: [%@_fud_viewDidAppear:]", [self class]);
    }
}

- (void)fud_viewDidDisappear:(BOOL)animated {
    [self fud_viewDidDisappear:animated];
    
   NSLog(@"FNKTrack: [%@_fud_viewDidDisappear:", [self class]);
}

@end
