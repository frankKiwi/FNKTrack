//
//  FNKTrackDataConfig.m
//  HuoGameBox
//
//  Created by LWW on 2020/11/10.
//  Copyright © 2020 huosdk. All rights reserved.
//

#import "FNKTrackDataConfig.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSDictionary+ContainKey.h"

@implementation FNKTrackDataConfig
+ (instancetype)shareInstance {
    static FNKTrackDataConfig *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
- (instancetype)init {
    if (self = [super init]) {
        self.GameTrackData = [NSMutableDictionary dictionary];
    }
    return self;
}
- (void)configPlist:(NSString *)fileName{
    self.trackData = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]];

}
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

+ (BOOL)getViewControllerParams:(id)className{
    NSDictionary*data = [FNKTrackDataConfig shareInstance].trackData;
    if (className==nil) {
        return NO;
    }
    NSString *classKey = NSStringFromClass([className class]);
//    if ([data containsObjectForKey:@"ViewController"]) {
//        NSDictionary *param = data[@"ViewController"][classKey][classKey];
//
//        if (param.count > 0) {
//            NSMutableDictionary*uploadData = [NSMutableDictionary dictionaryWithDictionary:param];
////            if ([DataManager sharedDataManager].userInfo.isLogin) {
////                uploadData[@"isLogin"]=@"是";
////            }
//            NSString*eventId = uploadData[@"name"];
////            [MobClick event:eventId attributes:uploadData];
//            return YES;
//        }
//        return NO;
//    }
    
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
/***  充值删除统计下载数 */

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
@end


