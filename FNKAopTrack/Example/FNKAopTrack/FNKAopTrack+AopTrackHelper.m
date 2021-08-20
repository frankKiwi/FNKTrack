//
//  FNKAopTrack+AopTrackHelper.m
//  FNKAopTrack_Example
//
//  Created by LWW on 2021/3/30.
//  Copyright © 2021 LWW. All rights reserved.
//

#import "FNKAopTrack+AopTrackHelper.h"
#import <FNKAopAspects.h>


@implementation FNKAopTrack (AopTrackHelper)
+ (void)FNKhandlePV:(id<FNKAopAspectInfo>)data status:(FNKAopPVSTATUS)status{
    
    NSString *vcName = NSStringFromClass([[data instance] class]);
    NSDictionary *dic = [FNKAopTrack shareInstance].configureData[@"PV"][vcName];
    if (status ==FNKAopPV_ENTER) {
            NSLog(@"enter data:%@",dic);
    }else{
           NSLog(@"leave data:%@",dic);
    }
}

+ (void)FNKHandleEvent:(id<FNKAopAspectInfo>)data EventID:(NSString *)eventId{
        NSLog(@"eventId:%@",eventId);
}

@end
