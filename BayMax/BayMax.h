//
//  BayMax.h
//  Genius_IM
//
//  Created by Graphic-one on 17/2/8.
//  Copyright © 2017年 Graphic-one. All rights reserved.
//

#ifndef BayMax_h
#define BayMax_h

#import <objc/message.h>

#define GA_MapperStr(str)\
[NSString stringWithUTF8String:GATheHomeOfMagic(str.UTF8String)]

static __inline__ __attribute__((always_inline)) const char * GATheHomeOfMagic(const char * tager){
    return [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:[NSString stringWithUTF8String:tager] options:NSDataBase64DecodingIgnoreUnknownCharacters] encoding:NSUTF8StringEncoding].UTF8String;
}

static __inline__ __attribute__((always_inline)) void MethodSwizzling(Class originCls , SEL originSEL , Class targetCls , SEL targetSEL)
{
    Method originMethod = class_getInstanceMethod(originCls, originSEL);
    Method targetMethod = class_getInstanceMethod(targetCls, targetSEL);
    
    BOOL isAdd = class_addMethod(targetCls, targetSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    if (isAdd) {
        class_replaceMethod(originCls, originSEL, method_getImplementation(targetMethod), method_getTypeEncoding(targetMethod));
    }else{
        method_exchangeImplementations(originMethod, targetMethod);
    }
}


#define GA_EntityAssert(bool,value)\
if((bool) == YES) return value;

#define GA_AssertParamIsNSNotFound(target,value)\
GA_EntityAssert((target) == NSNotFound,value)

#define GA_AssertParamIsNil(target,value)\
GA_EntityAssert((target) == nil,value)

#define GA_AssertParamIsNSNull(target,value)\
GA_EntityAssert((target) == ((id)kCFNull),value)


/** NSUerDefault key (value is Dic)*/
FOUNDATION_EXPORT NSString* const BayMaxProtectStatus;
/** dic using the keys */
FOUNDATION_EXTERN NSString* const BayMaxArrayStatus;
FOUNDATION_EXTERN NSString* const BayMaxDictionaryStatus;
FOUNDATION_EXTERN NSString* const BayMaxSetStatus;
FOUNDATION_EXTERN NSString* const BayMaxStringStatus;
FOUNDATION_EXTERN NSString* const BayMaxKVOStatus;
FOUNDATION_EXTERN NSString* const BayMaxMsgSentStatus;
FOUNDATION_EXTERN NSString* const BayMaxNullPointerStatus;


static __inline__ __attribute__((always_inline)) void updateProtectStatus(NSString* protectKey){
    NSMutableDictionary* mDic = [[[NSUserDefaults standardUserDefaults] objectForKey:BayMaxProtectStatus] mutableCopy];
    BOOL status = [mDic[protectKey] boolValue];
    [mDic setObject:@(!status) forKey:protectKey];
    [[NSUserDefaults standardUserDefaults] setObject:mDic.copy forKey:BayMaxProtectStatus];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#endif /* BayMax_h */
