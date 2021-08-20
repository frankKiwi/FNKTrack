//
//  FNKAopTrack.h
//  Pods
//
//  Created by LWW on 2021/3/30.
//

#import <Foundation/Foundation.h>
#import "FNKAopAspects.h"


NS_ASSUME_NONNULL_BEGIN

extern NSString const *FNKAopPVKey;
extern NSString const *FNKAopEventKey;
extern NSString const *FNKAopEventIDKey;
extern NSString const *FNKAopEventConfigKey;
extern NSString const *FNKAopSelectorStrKey;
extern NSString const *FNKAopTargetKey;
 
typedef NS_ENUM(NSInteger, FNKAopPVSTATUS){
    FNKAopPV_ENTER = 0,         //进入页面
    FNKAopPV_LEAVE              //离开页面
};
@interface FNKAopTrack : NSObject

@property (nonatomic,strong,readonly) NSDictionary *configureData;


/**
 生成单例的方法

 @return 单例对象
 */
+ (instancetype)shareInstance;

/**
 通过json配置文件导入配置信息
json配置文件或plist配置文件只导入一个就好了
 @param jsonFilePath json文件沙盒路径
 */
+ (void)configureDataWithJSONFile:(NSString *)jsonFilePath;

/**
 通过plist配置文件导入配置信息
json配置文件或plist配置文件只导入一个就好了
 @param plistFileName plist文件名字（不带后缀名）
 */
+ (void)configureDataWithPlistFile:(NSString *)plistFileName;

/**
 处理PV
这个方法需要开发者重载进行具体的操作
 @param data 页面信息
 @param status 进入或离开页面的状态
 */
+ (void)FNKhandlePV:(id<FNKAopAspectInfo>)data status:(FNKAopPVSTATUS)status;

/**
 处理事件
这个方法需要开发者重载进行具体的操作
 @param data 事件信息
 @param eventId 事件ID 可以是字符串类型，也是int类型
 */
+ (void)FNKHandleEvent:(id<FNKAopAspectInfo>)data EventID:(NSString *)eventId;
@end

NS_ASSUME_NONNULL_END
