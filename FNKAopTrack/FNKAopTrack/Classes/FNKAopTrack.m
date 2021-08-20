//
//  FNKAopTrack.m
//  Pods
//
//  Created by LWW on 2021/3/30.
//

#import "FNKAopTrack.h"
NSString const *FNKAopPVKey = @"PV";
NSString const *FNKAopEventKey = @"Events";
NSString const *FNKAopEventIDKey = @"EventID";
NSString const *FNKAopEventConfigKey = @"EventConfig";
NSString const *FNKAopSelectorStrKey = @"selectorStr";
NSString const *FNKAopTargetKey = @"target";

@interface FNKAopTrack()

@property (nonatomic,strong,readwrite) NSDictionary *configureData;

@end
@implementation FNKAopTrack
static FNKAopTrack *_traks =nil;
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _traks = [FNKAopTrack new];
    });
    return _traks;
}

+ (void)configureDataWithJSONFile:(NSString *)jsonFilePath{
    NSData *data = [NSData dataWithContentsOfFile:jsonFilePath];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    [FNKAopTrack shareInstance].configureData = dic;
    if ([FNKAopTrack shareInstance].configureData) {
        [self setUp];
    }
}

+ (void)configureDataWithPlistFile:(NSString *)plistFileName{
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"]];
    [FNKAopTrack shareInstance].configureData = dic;
    if ([FNKAopTrack shareInstance].configureData) {
        [self setUp];
    }
}

+ (void)setUp{
    [self configPV];
    [self configEvents];
}

#pragma mark  - - - - PVConfig - - - -

+ (void)configPV{
    for (NSString *vcName in [[FNKAopTrack shareInstance].configureData[FNKAopPVKey] allKeys]) {
        Class target = NSClassFromString(vcName);
        [target aspect_hookSelector:@selector(viewDidAppear:) withOptions:FNKAopAspectPositionAfter usingBlock:^(id data){
            [self FNKhandlePV:data status:FNKAopPV_ENTER];
        } error:nil];
        [target aspect_hookSelector:@selector(viewDidDisappear:) withOptions:FNKAopAspectPositionAfter usingBlock:^(id data){
            [self FNKhandlePV:data status:FNKAopPV_LEAVE];
        } error:nil];
    }
}

+ (void)FNKhandlePV:(id<FNKAopAspectInfo>)data status:(FNKAopPVSTATUS)status{}

#pragma mark - - - - EventConfig - - - -

+ (void)configEvents{
    NSArray *events =[FNKAopTrack shareInstance].configureData[FNKAopEventKey];
    for (NSDictionary *event in events) {
        NSString * EventID = event[FNKAopEventIDKey];
        NSDictionary *eventConfig = event[FNKAopEventConfigKey];
            NSString *selectorStr = eventConfig[FNKAopSelectorStrKey];
            NSString *targetClass = eventConfig[FNKAopTargetKey];
            Class target =NSClassFromString(targetClass);
            if ([selectorStr hasPrefix:@"+"]) {
                selectorStr = [selectorStr substringFromIndex:1];
                SEL selector = NSSelectorFromString(selectorStr);
                [target  aspect_hookClassSelector:selector withOptions:FNKAopAspectPositionAfter usingBlock:^(id<FNKAopAspectInfo> data){
                    [self FNKHandleEvent:data EventID:EventID];
                } error:nil];
            }else{
             SEL selector = NSSelectorFromString(selectorStr);
                [target aspect_hookSelector:selector withOptions:FNKAopAspectPositionAfter usingBlock:^(id<FNKAopAspectInfo> data){
                    [self FNKHandleEvent:data EventID:EventID];
                } error:nil];
            }
    }
}

+ (void)FNKHandleEvent:(id<FNKAopAspectInfo>)data EventID:(NSString *)eventId{}

@end

