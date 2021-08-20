//
//  FNKTrackDataConfig+FNKTrackHelper.h
//  FNKRuntimeTrack_Example
//
//  Created by LWW on 2021/3/30.
//  Copyright © 2021 LWW. All rights reserved.
//


#import <FNKTrackDataConfig.h>

NS_ASSUME_NONNULL_BEGIN

@interface FNKTrackDataConfig (FNKTrackHelper)
/***  为按钮点击事件添加统计 */

+ (BOOL)getControlParams:(id)targetName andAction:(SEL)action;

/***  统计类的进入 */

+ (BOOL)getViewControllerParams:(id)className;

/***  统计collectionview的点击 */

+ (BOOL)getCollectionviewParams:(id)targetName;

/***  游戏详情下载点击 */

+ (void)uploadGameDetailDownLoadData;

/***  重置删除统计下载数 */

+ (BOOL)resetDownloadParams:(id)className;

/***  统计单独按钮点击数 */

+ (void)uploadHomeTapCountsTag:(NSString*)tagName;

/***  统计专题点击数 */

+ (void)uploadRecommendDynamic:(NSString*)dynamicName isDefine:(BOOL)isDefine;

/***  统计新游页近期新游和今日首发下载 */

+ (void)uploadNewGameData:(NSString*)gameName;
/***  统计单独按钮带参数点击数 */

+ (void)uploadHomeTapCountsTag:(NSString*)tagName andTargetName:(NSString*)tagSourceName;

@end

NS_ASSUME_NONNULL_END
