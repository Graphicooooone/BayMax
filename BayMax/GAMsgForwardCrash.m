//
//  GAMsgForwardCrash.m
//  Genius_IM
//
//  Created by Graphic-one on 17/2/10.
//  Copyright © 2017年 Graphic-one. All rights reserved.
//

#import "BayMaxCenter.h"
#import "GAMsgForwardCrash.h"

NSString* const BayMaxKVOStatus         = @"KVOProtect";
NSString* const BayMaxMsgSentStatus     = @"MsgSentProtect";
NSString* const BayMaxNullPointerStatus = @"NullPointerProtect";

@implementation GAMsgForwardCrash
+ (void)_changeKVOProtect{

    updateProtectStatus(BayMaxKVOStatus);
}
+ (void)_changeMsgSentProtect{

    updateProtectStatus(BayMaxMsgSentStatus);
}
+ (void)_changeNullPointerProtect{

    updateProtectStatus(BayMaxNullPointerStatus);
}
@end
