//
//  UIScrollView+FNKTrack.m
//  FNKTrack
//
//  Created by lanfudong on 2020/2/29.
//

#import "UIScrollView+FNKTrack.h"
#import "NSObject+FNKTrack.h"
#import <objc/runtime.h>
#import "FNKTrackDataConfig.h"

@implementation UIScrollView (FNKTrack)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self fud_swizzleInstanceMethodSEL:@selector(setDelegate:) withSEL:@selector(fud_setDelegate:)];
    });
}

- (void)fud_setDelegate:(id)delegate {
    [self fud_setDelegate:delegate];
    
    Class delegateClass = [delegate class];
    SEL oldSEL = NULL, newSEL = NULL;
    if ([self isKindOfClass:[UITableView class]]) {
        oldSEL = @selector(tableView:didSelectRowAtIndexPath:);
        newSEL = @selector(fud_tableView:didSelectRowAtIndexPath:);
    } else if ([self isKindOfClass:[UICollectionView class]]) {
        oldSEL = @selector(collectionView:didSelectItemAtIndexPath:);
        newSEL = @selector(fud_collectionView:didSelectItemAtIndexPath:);
    }
    if (!oldSEL || !newSEL) return;
    
    if ([delegate respondsToSelector:oldSEL]) {
        Method newMethod = class_getInstanceMethod([self class], newSEL);
        BOOL success = class_addMethod(delegateClass, newSEL, class_getMethodImplementation([self class], newSEL), method_getTypeEncoding(newMethod));
        if (success) {
            [delegateClass fud_swizzleInstanceMethodSEL:oldSEL withSEL:newSEL];
        }
    }
}

- (void)fud_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    id delegate = tableView.delegate;
    NSLog(@"FNKTrack: [%@_didSelectCell_%@_atIndexPath_(%ld,%ld)_onDelegate_%@", [self class], [cell class], (long)indexPath.section, (long)indexPath.row, [delegate class]);
    [self fud_tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (void)fud_collectionView:(UICollectionView *)collection didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collection cellForItemAtIndexPath:indexPath];
    id delegate = collection.delegate;
        
    [self fud_collectionView:collection didSelectItemAtIndexPath:indexPath];
    if ([FNKTrackDataConfig getCollectionviewParams:delegate]) {
         NSLog(@"FNKTrack: [%@_didSelectItem_%@_atIndexPath_(%ld,%ld)_onDelegate_%@", [self class], [cell class], (long)indexPath.section, (long)indexPath.row, [delegate class]);
    }
}

@end
