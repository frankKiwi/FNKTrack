//
//  FNKTrackDataConfig+FNKTrackHelper.m
//  FNKRuntimeTrack_Example
//
//  Created by LWW on 2021/3/30.
//  Copyright © 2021 LWW. All rights reserved.
//

#import "FNKTrackDataConfig+FNKTrackHelper.h"
#import <FNKTrackDataConfig.h>
#import <NSDictionary+ContainKey.h>
@implementation FNKTrackDataConfig (FNKTrackHelper)
/***  按钮点击 */

+ (BOOL)getControlParams:(id)targetName andAction:(SEL)action{
    NSDictionary*data = [FNKTrackDataConfig shareInstance].trackData;
    if (targetName==nil) {
        return NO;
    }
    NSString *className = NSStringFromClass([targetName class]);
    NSString*selectorName = NSStringFromSelector(action);
    if (selectorName == nil) {
        return NO;
    }
    if ([data containsObjectForKey:@"ControlEvents"]) {
        NSDictionary *param = data[@"ControlEvents"][className][selectorName];
        if (param.count > 0) {
            NSMutableDictionary*uploadData = [NSMutableDictionary dictionaryWithDictionary:param];
//            if ([DataManager sharedDataManager].userInfo.isLogin) {
//                uploadData[@"isLogin"]=@"是";
//            }
            NSString*eventId = uploadData[@"name"];
//            [MobClick event:eventId attributes:uploadData];
//            if ([uploadData containsObjectForKey:@"track"]) {
//                 [[FNKTrackDataConfig shareInstance].GameTrackData setDictionary:uploadData];;
//            }
            return YES;
        }
        return NO;
    }
    
    return NO;
}
/***  collectionview点击 */

+ (BOOL)getCollectionviewParams:(id)targetName{
    NSDictionary*data = [FNKTrackDataConfig shareInstance].trackData;
    if (targetName==nil) {
        return NO;
    }
    NSString *className = NSStringFromClass([targetName class]);
   
    if ([data containsObjectForKey:@"CollectionView"]) {
        
        NSDictionary *param = data[@"CollectionView"][className][@"eventParam"];

        if (param.count > 0) {
            NSMutableDictionary*uploadData = [NSMutableDictionary dictionaryWithDictionary:param];
            
            NSString*eventId = uploadData[@"name"];
            if ([uploadData containsObjectForKey:@"track"]) {
               
                 [[FNKTrackDataConfig shareInstance].GameTrackData setDictionary:uploadData];;
            }
//            [MobClick event:eventId attributes:uploadData];
            return YES;
        }
        return NO;
    }
    
    return NO;
}
/***  类统计 */

+ (BOOL)getViewControllerParams:(id)className{
    NSDictionary*data = [FNKTrackDataConfig shareInstance].trackData;
    if (className==nil) {
        return NO;
    }
    NSString *classKey = NSStringFromClass([className class]);
    if ([data containsObjectForKey:@"ViewController"]) {
        NSDictionary *param = data[@"ViewController"][classKey][classKey];
        
        if (param.count > 0) {
            NSMutableDictionary*uploadData = [NSMutableDictionary dictionaryWithDictionary:param];
//            if ([DataManager sharedDataManager].userInfo.isLogin) {
//                uploadData[@"isLogin"]=@"是";
//            }
            NSString*eventId = uploadData[@"name"];
//            [MobClick event:eventId attributes:uploadData];
            return YES;
        }
        return NO;
    }
    
    return NO;
}
/***  统计下载数 */

+ (void)uploadGameDetailDownLoadData{
//    kPreventRepeatClickTime(1);
//    if ([FNKTrackDataConfig shareInstance].GameTrackData.count > 0) {
//         [MobClick event:@"gameDownLoad" attributes:[FNKTrackDataConfig shareInstance].GameTrackData];
////        NSDictionary *dic = [FNKTrackDataConfig shareInstance].GameTrackData;
//        [MobClick event:[FNKTrackDataConfig shareInstance].GameTrackData[@"trackFinish"] attributes:[FNKTrackDataConfig shareInstance].GameTrackData];
////        [[FNKTrackDataConfig shareInstance].GameTrackData removeAllObjects];
//    }
}
/***  重置删除统计下载数 */

+ (BOOL)resetDownloadParams:(id)className{
    NSDictionary*data = [FNKTrackDataConfig shareInstance].trackData;
    if (className==nil) {
        return NO;
    }
    NSString *classKey = NSStringFromClass([className class]);
    if ([data containsObjectForKey:@"ViewController"]) {
        NSDictionary *param = data[@"ViewController"][classKey][classKey];
        if (param.count > 0) {
            if ([FNKTrackDataConfig shareInstance].GameTrackData.count > 0) {
                [[FNKTrackDataConfig shareInstance].GameTrackData removeAllObjects];
                return YES;
            }
            return NO;
        }
        return NO ;
    }
    
    return NO ;
    
}
/***  统计单独按钮点击数 */

+ (void)uploadHomeTapCountsTag:(NSString*)tagName{
//    kPreventRepeatClickTime(1);
//    NSDictionary*tags  = [FNKTrackDataConfig shareInstance].trackData[@"TrackTrace"];
//    if (tags.count>0) {
//         [MobClick event:[FNKTrackDataConfig shareInstance].trackData[@"TrackTrace"][tagName] attributes:@{tagName:tagName}];
//    }
}

/***  统计单独按钮带参数点击数 */

+ (void)uploadHomeTapCountsTag:(NSString*)tagName andTargetName:(NSString*)tagSourceName{
//    kPreventRepeatClickTime(1);
//    NSDictionary*tags  = [FNKTrackDataConfig shareInstance].trackData[@"TrackParamTrace"];
//    if (tags.count>0) {
//         [MobClick event:[FNKTrackDataConfig shareInstance].trackData[@"TrackParamTrace"][tagName] attributes:@{@"source":tagSourceName}];
//    }
}
/***  统计专题点击数 */

+ (void)uploadRecommendDynamic:(NSString*)dynamicName isDefine:(BOOL)isDefine{
//    kPreventRepeatClickTime(1);
//    NSDictionary*data  = [FNKTrackDataConfig shareInstance].trackData[@"DynamicTrack"];
//    if (isDefine) {
//         if ([data containsObjectForKey:@"自定义专题"]) {
//             NSDictionary *param = data[@"自定义专题"];
//             if (param.count > 0) {
//                 NSMutableDictionary*uploadData = [NSMutableDictionary dictionaryWithDictionary:param];
//                 if ([DataManager sharedDataManager].userInfo.isLogin) {
//                     uploadData[@"isLogin"]=@"是";
//                 }
//                 NSString*eventId = uploadData[@"name"];
//                 [uploadData setObject:dynamicName forKey:@"dynamicName"];
//                 if ([uploadData containsObjectForKey:@"track"]) {
//                      [[FNKTrackDataConfig shareInstance].GameTrackData setDictionary:uploadData];;
//                 }
//                 [MobClick event:eventId attributes:uploadData];
//             }
//         }
//    }else{
//        if ([data containsObjectForKey:dynamicName]) {
//            NSDictionary *param = data[dynamicName];
//            if (param.count > 0) {
//                NSMutableDictionary*uploadData = [NSMutableDictionary dictionaryWithDictionary:param];
//                if ([DataManager sharedDataManager].userInfo.isLogin) {
//                    uploadData[@"isLogin"]=@"是";
//                }
//                NSString*eventId = uploadData[@"name"];
//                if ([uploadData containsObjectForKey:@"track"]) {
//                     [[FNKTrackDataConfig shareInstance].GameTrackData setDictionary:uploadData];
//                }
//                [MobClick event:eventId attributes:uploadData];
//            }
//        }
//    }
   
}

/***  统计新游页近期新游和今日首发下载 */

+ (void)uploadNewGameData:(NSString*)gameName{
//    kPreventRepeatClickTime(1);
//    NSDictionary*data  = [FNKTrackDataConfig shareInstance].trackData[@"NewGameAnalysis"];
//    if ([data containsObjectForKey:gameName]) {
//        NSDictionary *param = data[gameName];
//        if (param.count > 0) {
//            NSMutableDictionary*uploadData = [NSMutableDictionary dictionaryWithDictionary:param];
//            if ([DataManager sharedDataManager].userInfo.isLogin) {
//                uploadData[@"isLogin"]=@"是";
//            }
//            NSString*eventId = uploadData[@"name"];
//            if ([uploadData containsObjectForKey:@"track"]) {
//                 [[FNKTrackDataConfig shareInstance].GameTrackData setDictionary:uploadData];
//            }
//            [MobClick event:eventId attributes:uploadData];
//        }
//    }
    
}
@end
