//
//  BayMaxCenter.h
//  Genius_IM
//
//  Created by Graphic-one on 17/2/15.
//  Copyright © 2017年 Graphic-one. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, BayMaxDefenseType){
    BayMaxDefenseTypeArr            =  1 << 0,
    BayMaxDefenseTypeDic            =  1 << 1,
    BayMaxDefenseTypeSet            =  1 << 2,
    BayMaxDefenseTypeStr            =  1 << 3,
    BayMaxDefenseTypeKVO            =  1 << 4,
    BayMaxDefenseTypeMsg            =  1 << 5,
    BayMaxDefenseTypePointer        =  1 << 6,
    
    BayMaxDefenseTypeAll            = NSUIntegerMax,
};

/** BayMax defense system at the center of the hub .  and only when you need inside the code changes or get defensive strategy will be used. */

/** 
 *  Note: all the dynamic change of protection setting When will the next time the runloop restart to take effect
 */

__attribute__((objc_subclassing_restricted))

@interface BayMaxCenter : NSObject

+ (instancetype)BayMaxCenterSystem;

- (BOOL)updateDefenseStrategy:(BayMaxDefenseType)defenseType status:(BOOL)isOpen;

@property (nonatomic,assign,readonly,getter=isOpenArrDefense) BOOL arrStatus;
@property (nonatomic,assign,readonly,getter=isOpenDicDefense) BOOL dicStatus;
@property (nonatomic,assign,readonly,getter=isOpenSetDefense) BOOL setStatus;
@property (nonatomic,assign,readonly,getter=isOpenStrDefense) BOOL strStatus;
@property (nonatomic,assign,readonly,getter=isOpenKVODefense) BOOL kvoStatus;
@property (nonatomic,assign,readonly,getter=isOpenMsgSentDefense) BOOL msgSentStatus;
@property (nonatomic,assign,readonly,getter=isOpenNullPointerDefense) BOOL nullPointerStatus;

- (BOOL)openAllProtect;
- (BOOL)closeAllProtect;

@end

