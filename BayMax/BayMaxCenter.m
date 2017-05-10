//
//  BayMaxCenter.m
//  Genius_IM
//
//  Created by Graphic-one on 17/2/15.
//  Copyright © 2017年 Graphic-one. All rights reserved.
//

#import "BayMaxCenter.h"

#import "GAContainerCrash.h"
#import "GAStringCrash.h"
#import "GAMsgForwardCrash.h"

#pragma mark - Category Primers
@interface GAContainerCrash ()
+ (void)_changeArrayProtect;
+ (void)_changeDictionaryProtect;
+ (void)_changeSetProtect;
@end

@interface GAStringCrash ()
+ (void)_changeStringProtect;
@end

@interface GAMsgForwardCrash ()
+ (void)_changeKVOProtect;
+ (void)_changeMsgSentProtect;
+ (void)_changeNullPointerProtect;
@end

#define GABayMax_Lock dispatch_semaphore_wait([[BayMaxCenter BayMaxCenterSystem] valueForKey:@"_lock"], DISPATCH_TIME_FOREVER)
#define GABayMax_UnLock dispatch_semaphore_signal([[BayMaxCenter BayMaxCenterSystem] valueForKey:@"_lock"])

NSString* const BayMaxProtectStatus = @"BayMaxProtectStatus";

__attribute__((constructor))
static void BayMaxStarProtect(void){
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary* bayMaxStatus = @{
                                       BayMaxArrayStatus        : @(NO),
                                       BayMaxDictionaryStatus   : @(NO),
                                       BayMaxSetStatus          : @(NO),
                                       BayMaxStringStatus       : @(NO),
                                       BayMaxKVOStatus          : @(NO),
                                       BayMaxMsgSentStatus      : @(NO),
                                       BayMaxNullPointerStatus  : @(NO),
                                       };
        [[NSUserDefaults standardUserDefaults] setObject:bayMaxStatus forKey:BayMaxProtectStatus];
        [[NSUserDefaults standardUserDefaults] synchronize];

        if ([BayMaxCenter BayMaxCenterSystem].isOpenArrDefense) {
            GABayMax_Lock;
            [GAContainerCrash _changeArrayProtect];
            GABayMax_UnLock;
        }
        
        if ([BayMaxCenter BayMaxCenterSystem].isOpenDicDefense) {
            GABayMax_Lock;
            [GAContainerCrash _changeDictionaryProtect];
            GABayMax_UnLock;
        }
        
        if ([BayMaxCenter BayMaxCenterSystem].isOpenSetDefense) {
            GABayMax_Lock;
            [GAContainerCrash _changeSetProtect];
            GABayMax_UnLock;
        }
        
        if ([BayMaxCenter BayMaxCenterSystem].isOpenStrDefense) {
            GABayMax_Lock;
            [GAStringCrash _changeStringProtect];
            GABayMax_UnLock;
        }
        
        if ([BayMaxCenter BayMaxCenterSystem].isOpenKVODefense) {
            GABayMax_Lock;
            [GAMsgForwardCrash _changeKVOProtect];
            GABayMax_UnLock;
        }
        
        if ([BayMaxCenter BayMaxCenterSystem].isOpenMsgSentDefense) {
            GABayMax_Lock;
            [GAMsgForwardCrash _changeMsgSentProtect];
            GABayMax_UnLock;
        }
        
        if ([BayMaxCenter BayMaxCenterSystem].isOpenNullPointerDefense) {
            GABayMax_Lock;
            [GAMsgForwardCrash _changeNullPointerProtect];
            GABayMax_UnLock;
        }
    });
}



#pragma mark - BayMaxCenter
@interface BayMaxCenter ()
{
    dispatch_semaphore_t _lock;
    NSDictionary* _curSettingInfo;
}
@end

@implementation BayMaxCenter

#pragma mark - Public

+ (instancetype)BayMaxCenterSystem{
    static BayMaxCenter* _BayMaxCenterSystem;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _BayMaxCenterSystem = [BayMaxCenter new];
        _BayMaxCenterSystem -> _curSettingInfo = [_BayMaxCenterSystem _curProtectSetting];
        _BayMaxCenterSystem -> _lock = dispatch_semaphore_create(1);
    });
    return _BayMaxCenterSystem;
}

- (BOOL)updateDefenseStrategy:(BayMaxDefenseType)defenseType status:(BOOL)isOpen{
    NSArray* keys = [self _switchKeyWithEnum:defenseType];
    if (keys == (id)kCFNull) return [self _allSetting:isOpen];
    
    NSMutableDictionary* mDic = [BayMaxCenter BayMaxCenterSystem]->_curSettingInfo.mutableCopy;
    [mDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([keys containsObject:key]) {
            mDic[key] = @(isOpen);
        }
    }];
    [BayMaxCenter BayMaxCenterSystem]->_curSettingInfo = mDic.copy;
    return [self _update2ProtectSetting];
}

- (BOOL)openAllProtect{
    return [self _allSetting:YES];
}

- (BOOL)closeAllProtect{
    return [self _allSetting:NO];
}

/** get property status ... */
- (BOOL)isOpenArrDefense{
    return [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxArrayStatus] boolValue];
}
- (BOOL)isOpenDicDefense{
    return [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxDictionaryStatus] boolValue];
}
- (BOOL)isOpenSetDefense{
    return [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxSetStatus] boolValue];
}
- (BOOL)isOpenStrDefense{
    return [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxStringStatus] boolValue];
}
- (BOOL)isOpenKVODefense{
    return [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxKVOStatus] boolValue];
}
- (BOOL)isOpenMsgSentDefense{
    return [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxMsgSentStatus] boolValue];
}
- (BOOL)isOpenNullPointerDefense{
    return [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxNullPointerStatus] boolValue];
}

#pragma mark - Private

- (BOOL)_allSetting:(BOOL)isAllOpen{
    NSMutableDictionary* mDic = [BayMaxCenter BayMaxCenterSystem]->_curSettingInfo.mutableCopy;
    [mDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        mDic[key] = @(isAllOpen);
    }];
    [BayMaxCenter BayMaxCenterSystem]->_curSettingInfo = mDic.copy;
    return [self _update2ProtectSetting];
}

- (NSDictionary* )_curProtectSetting{
    NSString* path = [BayMaxCenter _GAProtectSettingPath];
    NSDictionary* curDic = [NSDictionary dictionaryWithContentsOfFile:path];
#ifdef DEBUG
    curDic = curDic[@"Debug"];
#else
    curDic = curDic[@"Release"];
#endif
    return curDic;
}

- (BOOL)_update2ProtectSetting{
    if (![BayMaxCenter BayMaxCenterSystem]->_curSettingInfo || [BayMaxCenter BayMaxCenterSystem]->_curSettingInfo == (id)kCFNull) return NO;
    
    /** dynamic update **/
    NSDictionary* bayMaxStatus = [[NSUserDefaults standardUserDefaults] objectForKey:BayMaxProtectStatus];
    if ([bayMaxStatus[BayMaxArrayStatus] boolValue] != [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxArrayStatus] boolValue]) {
        GABayMax_Lock;
        [GAContainerCrash _changeArrayProtect];
        GABayMax_UnLock;
    }
    if ([bayMaxStatus[BayMaxDictionaryStatus] boolValue] != [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxDictionaryStatus] boolValue]) {
        GABayMax_Lock;
        [GAContainerCrash _changeDictionaryProtect];
        GABayMax_UnLock;
    }
    if ([bayMaxStatus[BayMaxSetStatus] boolValue] != [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxSetStatus] boolValue]) {
        GABayMax_Lock;
        [GAContainerCrash _changeSetProtect];
        GABayMax_UnLock;
    }
    if ([bayMaxStatus[BayMaxStringStatus] boolValue] != [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxStringStatus] boolValue]) {
        GABayMax_Lock;
        [GAStringCrash _changeStringProtect];
        GABayMax_UnLock;
    }
    if ([bayMaxStatus[BayMaxKVOStatus] boolValue] != [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxKVOStatus] boolValue]) {
        GABayMax_Lock;
        [GAMsgForwardCrash _changeKVOProtect];
        GABayMax_UnLock;
    }
    if ([bayMaxStatus[BayMaxMsgSentStatus] boolValue] != [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxMsgSentStatus] boolValue]) {
        GABayMax_Lock;
        [GAMsgForwardCrash _changeMsgSentProtect];
        GABayMax_UnLock;
    }
    if ([bayMaxStatus[BayMaxNullPointerStatus] boolValue] != [[BayMaxCenter BayMaxCenterSystem]->_curSettingInfo[BayMaxNullPointerStatus] boolValue]) {
        GABayMax_Lock;
        [GAMsgForwardCrash _changeNullPointerProtect];
        GABayMax_UnLock;
    }
    /** dynamic update **/
    
    NSString* path = [BayMaxCenter _GAProtectSettingPath];
    NSMutableDictionary* mCurDic = [NSDictionary dictionaryWithContentsOfFile:path].mutableCopy;
#ifdef DEBUG
    mCurDic[@"Debug"] = [BayMaxCenter BayMaxCenterSystem]->_curSettingInfo;
#else
    mCurDic[@"Release"] = [BayMaxCenter BayMaxCenterSystem]->_curSettingInfo;
#endif
    return [mCurDic.copy writeToFile:path atomically:YES];
}

- (NSArray<NSString* >* )_switchKeyWithEnum:(BayMaxDefenseType)defenseType{
    if (defenseType & BayMaxDefenseTypeAll) return (id)kCFNull;
    
    NSMutableArray<NSString* >* mArr = @[].mutableCopy;
    if (defenseType & BayMaxDefenseTypeArr) {
        [mArr addObject:BayMaxArrayStatus];
    }
    if (defenseType & BayMaxDefenseTypeDic) {
        [mArr addObject:BayMaxDictionaryStatus];
    }
    if (defenseType & BayMaxDefenseTypeSet) {
        [mArr addObject:BayMaxSetStatus];
    }
    if (defenseType & BayMaxDefenseTypeStr) {
        [mArr addObject:BayMaxStringStatus];
    }
    if (defenseType & BayMaxDefenseTypeKVO) {
        [mArr addObject:BayMaxKVOStatus];
    }
    if (defenseType & BayMaxDefenseTypeMsg) {
        [mArr addObject:BayMaxMsgSentStatus];
    }
    if (defenseType & BayMaxDefenseTypePointer) {
        [mArr addObject:BayMaxNullPointerStatus];
    }
    return mArr.copy;
}

#pragma mark - lazy load
+ (NSString* )_GAProtectSettingPath{
    return [[NSBundle mainBundle] pathForResource:@"GA_ProtectSetting" ofType:@"plist"];
}

@end
