//
//  FNKTrackDataConfig.h
//  HuoGameBox
//
//  Created by LWW on 2020/11/10.
//  Copyright © 2020 huosdk. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface FNKTrackDataConfig : NSObject

@property (nonatomic,copy)NSString *trackFileName;

@property (nonatomic, copy) NSDictionary *trackData;

+ (instancetype)shareInstance;

- (void)configPlist:(NSString *)fileName;

@property (nonatomic,strong) NSMutableDictionary*GameTrackData;

/***  按钮点击 */
+ (BOOL)getControlParams:(id)targetName andAction:(SEL)action;
/***  类统计 */

+ (BOOL)getViewControllerParams:(id)className;

/***  collectionview点击 */

+ (BOOL)getCollectionviewParams:(id)targetName;

/***  充值删除统计下载数 */

+ (BOOL)resetDownloadParams:(id)className;

@end

NS_ASSUME_NONNULL_END
