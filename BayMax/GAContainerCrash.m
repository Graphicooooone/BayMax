//
//  GAContainerCrash.m
//  Genius_IM
//
//  Created by Graphic-one on 17/2/8.
//  Copyright © 2017年 Graphic-one. All rights reserved.
//

#import "BayMaxCenter.h"
#import "GAContainerCrash.h"

#define kMagicKey_H_A       @"X19OU1BsYWNlaG9sZGVyQXJyYXk="
#define kMagicKey_A_I__     @"X19OU0FycmF5SQ=="
#define kMagicKey_A_M__     @"X19OU0FycmF5TQ=="

#define kMagicKey_H_D       @"X19OU1BsYWNlaG9sZGVyRGljdGlvbmFyeQ=="
#define kMagicKey_D_I       @"TlNEaWN0aW9uYXJ5"
#define kMagicKey_D_M       @"TlNNdXRhYmxlRGljdGlvbmFyeQ=="
#define kMagicKey_D_M__     @"X19OU0RpY3Rpb25hcnlN"

#define kMagicKey_H_S       @"X19OU1BsYWNlaG9sZGVyU2V0"
#define kMagicKey_S_I       @"TlNTZXQ="
#define kMagicKey_S_M__     @"X19OU1NldE0="
#define kMagicKey_S_M       @"TlNNdXRhYmxlU2V0"

NSString* const BayMaxArrayStatus       = @"ArrayProtect";
NSString* const BayMaxDictionaryStatus  = @"DictionaryProtect";
NSString* const BayMaxSetStatus         = @"SetProtect";

#pragma mark - array
@interface NSArray (BayMax) @end

@implementation NSArray (BayMax)

+ (void)_changeNSArrayProtect{
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_H_A)), @selector(initWithObjects:count:), self, @selector(bayMax_initWithObjects:count:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_A_I__)), @selector(objectAtIndex:), self, @selector(bayMax_objectAtIndex:));
    MethodSwizzling(self, @selector(arrayByAddingObject:), self, @selector(bayMax_arrayByAddingObject:));
    MethodSwizzling(self, @selector(componentsJoinedByString:), self, @selector(bayMax_componentsJoinedByString:));
    MethodSwizzling(self, @selector(firstObjectCommonWithArray:), self, @selector(bayMax_firstObjectCommonWithArray:));
    MethodSwizzling(self, @selector(indexOfObject:inRange:), self, @selector(bayMax_indexOfObject:inRange:));
    MethodSwizzling(self, @selector(indexOfObjectIdenticalTo:inRange:), self, @selector(bayMax_indexOfObjectIdenticalTo:inRange:));
    MethodSwizzling(self, @selector(isEqualToArray:), self, @selector(bayMax_isEqualToArray:));
}

- (instancetype)bayMax_initWithObjects:(const id _Nonnull [_Nullable])objects count:(NSUInteger)cnt
{
    @try {
        return [self bayMax_initWithObjects:objects count:cnt];
    } @catch (NSException *exception) {
        NSLog(@"name : %@ \n  reason : %@\n  userInfo : %@ \n ",exception.name , exception.reason , exception.userInfo);
        return nil;
    }
}

- (id)bayMax_objectAtIndex:(NSUInteger)index{
    GA_AssertParamIsNSNotFound(index, nil);
    GA_EntityAssert(((index) > (self.count - 1)), nil);
    GA_AssertParamIsNil(self, nil);
    GA_AssertParamIsNSNull(self,nil);
    return [self bayMax_objectAtIndex:index];
}

- (NSArray* )bayMax_arrayByAddingObject:(id)anObject{
    GA_AssertParamIsNil(anObject, self);
    return [self bayMax_arrayByAddingObject:anObject];
}

- (NSString *)bayMax_componentsJoinedByString:(NSString *)separator{
    GA_EntityAssert((![[separator class] isSubclassOfClass:[NSString class]]), ([self bayMax_componentsJoinedByString:@""]));
    return [self bayMax_componentsJoinedByString:separator];
}

- (id)bayMax_firstObjectCommonWithArray:(NSArray *)otherArray{
    GA_EntityAssert((![[otherArray class] isSubclassOfClass:[NSArray class]]), ([self bayMax_firstObjectCommonWithArray:nil]));
    return [self bayMax_firstObjectCommonWithArray:otherArray];
}

- (NSUInteger)bayMax_indexOfObject:(id)anObject inRange:(NSRange)range{
    GA_EntityAssert((range.length + range.location > self.count), (NSNotFound));
    return [self bayMax_indexOfObject:anObject inRange:range];
}

- (NSUInteger)bayMax_indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range{
    GA_EntityAssert((range.length + range.location > self.count), (NSNotFound));
    return [self bayMax_indexOfObjectIdenticalTo:anObject inRange:range];
}

- (BOOL)bayMax_isEqualToArray:(NSArray *)otherArray{
    GA_EntityAssert((![[otherArray class] isSubclassOfClass:[NSArray class]]), NO);
    return [self bayMax_isEqualToArray:otherArray];
}

@end


@interface NSMutableArray (BayMax) @end

@implementation NSMutableArray (BayMax)

+ (void)_changeNSMutableArrayProtect{
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_A_M__)), @selector(objectAtIndex:), self, @selector(bayMax_objectAtIndex_M:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_A_M__)), @selector(addObject:), self, @selector(bayMax_addObject:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_A_M__)), @selector(insertObject:atIndex:), self, @selector(bayMax_insertObject:atIndex:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_A_M__)), @selector(removeObjectsInRange:), self, @selector(bayMax_removeObjectsInRange:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_A_M__)), @selector(replaceObjectAtIndex:withObject:), self, @selector(bayMax_replaceObjectAtIndex:withObject:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_A_M__)), @selector(exchangeObjectAtIndex:withObjectAtIndex:), self, @selector(bayMax_exchangeObjectAtIndex:withObjectAtIndex:));
    MethodSwizzling(self, @selector(setArray:), self, @selector(bayMax_setArray:));
    MethodSwizzling(self, @selector(addObjectsFromArray:), self, @selector(bayMax_addObjectsFromArray:));
    MethodSwizzling(self, @selector(removeObject:inRange:), self, @selector(bayMax_removeObject:inRange:));
    MethodSwizzling(self, @selector(removeObjectIdenticalTo:inRange:), self, @selector(bayMax_removeObjectIdenticalTo:inRange:));
    MethodSwizzling(self, @selector(removeObjectsInArray:), self, @selector(bayMax_removeObjectsInArray:));
    MethodSwizzling(self, @selector(replaceObjectsInRange:withObjectsFromArray:range:), self, @selector(bayMax_replaceObjectsInRange:withObjectsFromArray:range:));
    MethodSwizzling(self, @selector(replaceObjectsInRange:withObjectsFromArray:), self, @selector(bayMax_replaceObjectsInRange:withObjectsFromArray:));
    MethodSwizzling(self, @selector(replaceObjectsAtIndexes:withObjects:), self, @selector(bayMax_replaceObjectsAtIndexes:withObjects:));
    MethodSwizzling(self, @selector(insertObjects:atIndexes:), self, @selector(bayMax_insertObjects:atIndexes:));
    MethodSwizzling(self, @selector(removeObjectsAtIndexes:), self, @selector(bayMax_removeObjectsAtIndexes:));
}

- (void)bayMax_setArray:(NSArray *)otherArray{
    GA_EntityAssert((![[otherArray class] isSubclassOfClass:[NSArray class]]), );
    [self bayMax_setArray:otherArray];
}

- (void)bayMax_addObject:(id)anObject{
    GA_AssertParamIsNil(anObject, );
    [self bayMax_addObject:anObject];
}

- (void)bayMax_addObjectsFromArray:(NSArray *)otherArray{
    GA_EntityAssert((![[otherArray class] isSubclassOfClass:[NSArray class]]), );
    [self bayMax_addObjectsFromArray:otherArray];
}

- (void)bayMax_insertObject:(id)anObject atIndex:(NSUInteger)index{
    GA_AssertParamIsNil(anObject, );
    GA_EntityAssert((index > self.count), );
    [self bayMax_insertObject:anObject atIndex:index];
}

- (void)bayMax_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes{
    GA_EntityAssert((![[objects class] isSubclassOfClass:[NSArray class]]), );
    GA_EntityAssert((objects.count != indexes.count), );
    GA_EntityAssert((indexes.firstIndex > self.count || indexes.lastIndex > self.count), );
    [self bayMax_insertObjects:objects atIndexes:indexes];
}

- (void)bayMax_removeObjectsInRange:(NSRange)range{
    GA_EntityAssert((range.length + range.location > self.count), );
    [self bayMax_removeObjectsInRange:range];
}

- (void)bayMax_removeObject:(id)anObject inRange:(NSRange)range{
    GA_EntityAssert((range.length + range.location > self.count), );
    [self bayMax_removeObject:anObject inRange:range];
}

- (void)bayMax_removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range{
    GA_EntityAssert((range.length + range.location > self.count), );
    [self bayMax_removeObjectIdenticalTo:anObject inRange:range];
}

- (void)bayMax_removeObjectsInArray:(NSArray *)otherArray{
    GA_EntityAssert((![[otherArray class] isSubclassOfClass:[NSArray class]]), );
    [self bayMax_removeObjectsInArray:otherArray];
}

- (void)bayMax_removeObjectsAtIndexes:(NSIndexSet *)indexes{
    GA_EntityAssert((indexes.count > self.count), );
    GA_EntityAssert((indexes.firstIndex > (self.count - 1) || indexes.lastIndex > (self.count - 1)), );
    [self bayMax_removeObjectsAtIndexes:indexes];
}

- (void)bayMax_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    GA_AssertParamIsNil(anObject, );
    GA_EntityAssert((index > (self.count - 1)), );
    [self bayMax_replaceObjectAtIndex:index withObject:anObject];
}

- (void)bayMax_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange{
    GA_EntityAssert((range.length + range.location > self.count), );
    GA_EntityAssert((![[otherArray class] isSubclassOfClass:[NSArray class]]), );
    GA_EntityAssert((otherRange.length + otherRange.location > otherArray.count), );
    [self bayMax_replaceObjectsInRange:range withObjectsFromArray:otherArray range:otherRange];
}

- (void)bayMax_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray{
    GA_EntityAssert((range.length + range.location > self.count), );
    GA_EntityAssert((![[otherArray class] isSubclassOfClass:[NSArray class]]), );
    [self bayMax_replaceObjectsInRange:range withObjectsFromArray:otherArray];
}

- (void)bayMax_replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects{
    GA_EntityAssert((![[objects class] isSubclassOfClass:[NSArray class]]), );
    GA_EntityAssert((indexes.count != objects.count), );
    GA_EntityAssert((indexes.firstIndex > (self.count - 1) || indexes.lastIndex > (self.count - 1)), );
    [self bayMax_replaceObjectsAtIndexes:indexes withObjects:objects];
}

- (void)bayMax_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2{
    GA_EntityAssert(((idx1 > (self.count - 1) || (idx2 > (self.count - 1)))), );
    return [self bayMax_exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}

- (id)bayMax_objectAtIndex_M:(NSUInteger)index{
    GA_AssertParamIsNSNotFound(index, nil);
    GA_EntityAssert(((index) > (self.count - 1)), nil);
    GA_AssertParamIsNil(self, nil);
    GA_AssertParamIsNSNull(self,nil);
    return [self bayMax_objectAtIndex_M:index];
}


@end


#pragma mark - dictionary
@interface NSDictionary (BayMax) @end

@implementation NSDictionary (BayMax)

+ (void)_changeNSDictionaryProtect{
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_H_D)), @selector(initWithObjects:forKeys:count:), self, @selector(bayMax_initWithObjects:forKeys:count:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_H_D)), @selector(initWithContentsOfFile:), self, @selector(bayMax_initWithContentsOfFile:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_H_D)), @selector(initWithContentsOfURL:), self, @selector(bayMax_initWithContentsOfURL:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_D_I)), @selector(isEqualToDictionary:), self, @selector(bayMax_isEqualToDictionary:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_D_I)), @selector(objectsForKeys:notFoundMarker:), self, @selector(bayMax_objectsForKeys:notFoundMarker:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_D_I)), @selector(initWithDictionary:copyItems:), self, @selector(bayMax_initWithDictionary:copyItems:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_D_I)), @selector(initWithObjects:forKeys:), self, @selector(bayMax_initWithObjects:forKeys:));
}

- (instancetype)bayMax_initWithObjects:(const id _Nonnull [_Nullable])objects forKeys:(const id _Nonnull [_Nullable])keys count:(NSUInteger)cnt{
    @try {
        return [self bayMax_initWithObjects:objects forKeys:keys count:cnt];
    } @catch (NSException *exception) {
        NSLog(@"name : %@ \n  reason : %@\n  userInfo : %@ \n ",exception.name , exception.reason , exception.userInfo);
        return nil;
    }
}

- (instancetype)bayMax_initWithDictionary:(NSDictionary<id, id> *)otherDictionary copyItems:(BOOL)flag{
    GA_EntityAssert((![[otherDictionary class] isSubclassOfClass:[NSDictionary class]]), nil);
    return [self bayMax_initWithDictionary:otherDictionary copyItems:flag];
}

- (instancetype)bayMax_initWithObjects:(NSArray<id> *)objects forKeys:(NSArray<id <NSCopying>> *)keys{
    GA_EntityAssert((![[objects class] isSubclassOfClass:[NSArray class]]), nil);
    GA_EntityAssert((![[keys class] isSubclassOfClass:[NSArray class]]), nil);
    GA_EntityAssert((objects.count != keys.count), nil);
    return [self bayMax_initWithObjects:objects forKeys:keys];
}

- (nullable NSDictionary<id, id> *)bayMax_initWithContentsOfFile:(NSString *)path{
    GA_EntityAssert((![[path class] isSubclassOfClass:[NSString class]]), nil);
    return [self bayMax_initWithContentsOfFile:path];
}

- (nullable NSDictionary<id, id> *)bayMax_initWithContentsOfURL:(NSURL *)url{
    GA_EntityAssert((![[url class] isSubclassOfClass:[NSURL class]]), nil);
    return [self bayMax_initWithContentsOfURL:url];
}

- (BOOL)bayMax_isEqualToDictionary:(NSDictionary<id, id> *)otherDictionary{
    GA_EntityAssert((![otherDictionary.class isSubclassOfClass:[NSDictionary class]]), NO);
    return [self bayMax_isEqualToDictionary:otherDictionary];
}

- (NSArray<id> *)bayMax_objectsForKeys:(NSArray<id> *)keys notFoundMarker:(id)marker{
    GA_EntityAssert((![keys.class isSubclassOfClass:[NSArray class]]), nil);
    GA_AssertParamIsNil(marker, nil);
    return [self bayMax_objectsForKeys:keys notFoundMarker:marker];
}

@end


@interface NSMutableDictionary (BayMax) @end

@implementation NSMutableDictionary (BayMax)

+ (void)_changeNSMutableDictionaryProtect{
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_H_D)), @selector(initWithCapacity:), self, @selector(bayMax_initWithCapacity:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_D_M__)), @selector(removeObjectForKey:), self, @selector(bayMax_removeObjectForKey:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_D_M__)), @selector(setObject:forKey:), self, @selector(bayMax_setObject:forKey:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_D_M)), @selector(addEntriesFromDictionary:), self, @selector(bayMax_addEntriesFromDictionary:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_D_M)), @selector(removeObjectsForKeys:), self, @selector(bayMax_removeObjectsForKeys:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_D_M)), @selector(setDictionary:), self, @selector(bayMax_setDictionary:));
}

- (instancetype)bayMax_initWithCapacity:(NSUInteger)numItems{
    GA_AssertParamIsNSNotFound(numItems, nil);
    return [self bayMax_initWithCapacity:numItems];
}

- (void)bayMax_removeObjectForKey:(id)aKey{
    GA_AssertParamIsNil(aKey, );
    [self bayMax_removeObjectForKey:aKey];
}

- (void)bayMax_removeObjectsForKeys:(NSArray<id> *)keyArray{
    GA_EntityAssert((![[keyArray class] isSubclassOfClass:[NSArray class]]), );
    [self bayMax_removeObjectsForKeys:keyArray];
}

- (void)bayMax_setObject:(id)anObject forKey:(id <NSCopying>)aKey{
    GA_AssertParamIsNil(anObject, );
    GA_AssertParamIsNil(aKey, );
    [self bayMax_setObject:anObject forKey:aKey];
}

- (void)bayMax_setDictionary:(NSDictionary<id, id> *)otherDictionary{
    GA_EntityAssert((![[otherDictionary class] isSubclassOfClass:[NSDictionary class]]), );
    [self bayMax_setDictionary:otherDictionary];
}

- (void)bayMax_addEntriesFromDictionary:(NSDictionary<id, id> *)otherDictionary{
    GA_EntityAssert((![[otherDictionary class] isSubclassOfClass:[NSDictionary class]]), );
    [self bayMax_addEntriesFromDictionary:otherDictionary];
}

@end


#pragma mark - set
@interface NSSet (BayMax) @end

@implementation NSSet (BayMax)

+ (void)_changeNSSetProtect{
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_H_S)), @selector(initWithObjects:count:), self, @selector(bayMax_initWithObjects:count:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_I)), @selector(initWithSet:copyItems:), self, @selector(bayMax_initWithSet:copyItems:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_I)), @selector(initWithArray:), self, @selector(bayMax_initWithArray:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_I)), @selector(isEqualToSet:), self, @selector(bayMax_isEqualToSet:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_I)), @selector(intersectsSet:), self, @selector(bayMax_intersectsSet:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_I)), @selector(isSubsetOfSet:), self, @selector(bayMax_isSubsetOfSet:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_I)), @selector(setByAddingObject:), self, @selector(bayMax_setByAddingObject:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_I)), @selector(setByAddingObjectsFromSet:), self, @selector(bayMax_setByAddingObjectsFromSet:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_I)), @selector(setByAddingObjectsFromArray:), self, @selector(bayMax_setByAddingObjectsFromArray:));
}

- (instancetype)bayMax_initWithObjects:(const id _Nonnull [_Nullable])objects count:(NSUInteger)cnt{
    @try {
        return [self bayMax_initWithObjects:objects count:cnt];
    } @catch (NSException *exception) {
        NSLog(@"name : %@ \n  reason : %@\n  userInfo : %@ \n ",exception.name , exception.reason , exception.userInfo);
        return nil;
    }
}

- (instancetype)bayMax_initWithSet:(NSSet<id> *)set copyItems:(BOOL)flag{
    GA_EntityAssert((![[set class] isSubclassOfClass:[NSSet class]]), nil);
    return [self bayMax_initWithSet:set copyItems:flag];
}

- (instancetype)bayMax_initWithArray:(NSArray<id> *)array{
    GA_EntityAssert((![[array class] isSubclassOfClass:[NSArray class]]), nil);
    return [self bayMax_initWithArray:array];
}

- (BOOL)bayMax_isEqualToSet:(NSSet<id> *)otherSet{
    GA_EntityAssert((![[otherSet class] isSubclassOfClass:[NSSet class]]), NO);
    return [self bayMax_isEqualToSet:otherSet];
}

- (BOOL)bayMax_intersectsSet:(NSSet<id> *)otherSet{
    GA_EntityAssert((![[otherSet class] isSubclassOfClass:[NSSet class]]), NO);
    return [self bayMax_intersectsSet:otherSet];
}

- (BOOL)bayMax_isSubsetOfSet:(NSSet<id> *)otherSet{
    GA_EntityAssert((![[otherSet class] isSubclassOfClass:[NSSet class]]), NO);
    return [self bayMax_isSubsetOfSet:otherSet];
}

- (NSSet<id> *)bayMax_setByAddingObject:(id)anObject{
    GA_AssertParamIsNil(anObject, self);
    return [self bayMax_setByAddingObject:anObject];
}

- (NSSet<id> *)bayMax_setByAddingObjectsFromSet:(NSSet<id> *)other{
    GA_EntityAssert((![[other class] isSubclassOfClass:[NSSet class]]), self);
    return [self bayMax_setByAddingObjectsFromSet:other];
}

- (NSSet<id> *)bayMax_setByAddingObjectsFromArray:(NSArray<id> *)other{
    GA_EntityAssert((![[other class] isSubclassOfClass:[NSArray class]]), self);
    return [self bayMax_setByAddingObjectsFromArray:other];
}

@end


@interface NSMutableSet (BayMax) @end

@implementation NSMutableSet (BayMax)

+ (void)_changeNSMutableSetProtect{
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_M__)), @selector(addObject:), self, @selector(bayMax_addObject:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_M__)), @selector(removeObject:), self, @selector(bayMax_removeObject:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_H_S)), @selector(initWithCapacity:), self, @selector(bayMax_initWithCapacity:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_M)), @selector(addObjectsFromArray:), self, @selector(bayMax_addObjectsFromArray:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_M)), @selector(intersectSet:), self, @selector(bayMax_intersectSet:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_M)), @selector(minusSet:), self, @selector(bayMax_minusSet:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_M)), @selector(unionSet:), self, @selector(bayMax_unionSet:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S_M)), @selector(setSet:), self, @selector(bayMax_setSet:));
}

- (void)bayMax_addObject:(id)object{
    GA_AssertParamIsNil(object, );
    return [self bayMax_addObject:object];
}

- (void)bayMax_removeObject:(id)object{
    GA_AssertParamIsNil(object, );
    return [self bayMax_removeObject:object];
}

- (instancetype)bayMax_initWithCapacity:(NSUInteger)numItems{
    GA_AssertParamIsNSNotFound(numItems, nil);
    return [self bayMax_initWithCapacity:numItems];
}

- (void)bayMax_addObjectsFromArray:(NSArray<id> *)array{
    GA_EntityAssert((![[array class] isSubclassOfClass:[NSArray class]]), );
    return [self bayMax_addObjectsFromArray:array];
}

- (void)bayMax_intersectSet:(NSSet<id> *)otherSet{
    GA_EntityAssert((![[otherSet class] isSubclassOfClass:[NSSet class]]), );
    [self bayMax_intersectSet:otherSet];
}

- (void)bayMax_minusSet:(NSSet<id> *)otherSet{
    GA_EntityAssert((![[otherSet class] isSubclassOfClass:[NSSet class]]), );
    [self bayMax_minusSet:otherSet];
}

- (void)bayMax_unionSet:(NSSet<id> *)otherSet{
    GA_EntityAssert((![[otherSet class] isSubclassOfClass:[NSSet class]]), );
    [self bayMax_unionSet:otherSet];
}

- (void)bayMax_setSet:(NSSet<id> *)otherSet{
    GA_EntityAssert((![[otherSet class] isSubclassOfClass:[NSSet class]]), );
    [self bayMax_setSet:otherSet];
}

@end


#pragma mark - GAContainerCrash
@implementation GAContainerCrash
+ (void)_changeArrayProtect{
    [NSArray _changeNSArrayProtect];
    [NSMutableArray _changeNSMutableArrayProtect];
    
    updateProtectStatus(BayMaxArrayStatus);
}
+ (void)_changeDictionaryProtect{
    [NSDictionary _changeNSDictionaryProtect];
    [NSMutableDictionary _changeNSMutableDictionaryProtect];
    
    updateProtectStatus(BayMaxDictionaryStatus);
}
+ (void)_changeSetProtect{
    [NSSet _changeNSSetProtect];
    [NSMutableSet _changeNSMutableSetProtect];
    
    updateProtectStatus(BayMaxSetStatus);
}
@end


/** save code 
 
 //initWithObjects
 
///<带nil的初始化方法 ....
 
 MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_H_A)), @selector(initWithObjects:), self, @selector(bayMax_initWithObjects:));

 - (instancetype)bayMax_initWithObjects:(id)firstObj, ... {
     return nil;
 }
 
 //initWithObjects

 
 __NSPlaceholderArray
 
 MethodSwizzling(NSClassFromString(@"__NSPlaceholderArray"), @selector(initWithObjects:count:), self, @selector(bayMax_initWithObjects:count:));
 
 /// TODO : hock 成功关键
     如何将objects转成我可以操作的数组 然后去掉nil NULL的成员 生成一个新的objects再调用原方法 同时更新cnt ...
 
 - (instancetype)bayMax_initWithObjects:(const id _Nonnull [_Nullable])objects count:(NSUInteger)cnt
 {
     @try {
         return [self bayMax_initWithObjects:objects count:cnt];
     } @catch (NSException *exception) {
         NSLog(@"name : %@ \n  reason : %@\n  userInfo : %@ \n ",exception.name , exception.reason , exception.userInfo);
         return nil;
     } @finally {
     
     };
 
 
     NSString* str = (__bridge void* )(objects));
     NSLog(@"%p",nil);
     NSLog(@"%p",NULL);
     
     NSUInteger num = sizeof(*&objects);
     NSMutableArray* mArr = [NSMutableArray arrayWithCapacity:cnt];
     if(!objects[0]){
         num = sizeof(objects) / sizeof(objects[0]);
     }else{
         num = sizeof(objects) / sizeof(id);
     }
     for(NSUInteger i = 0 ; i < num; i++){
         if (!objects[i] || objects[i] == (id)kCFNull) continue;
     }
     
     for (NSUInteger i = 0; i < cnt; i++) {
     if (!objects[i] || objects[i] == (id)kCFNull) continue;
         [mArr addObject:objects[i]];
     }
     id objs[mArr.count];
     NSUInteger index = 0;
     for (id object in mArr) {
         objs[index] = object;
         index++;
     }
 }
 
 
NSArray
 

 SEL bayMax_SEL = @selector(bayMax_objectAtIndex:);
 SEL origin_SEL = @selector(objectAtIndex:);
 
 Method bayMax_Method = class_getInstanceMethod(self, bayMax_SEL);
 Method origin_Method = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), origin_SEL);
 
 BOOL isAdd = class_addMethod(self, origin_SEL, method_getImplementation(bayMax_Method), method_getTypeEncoding(bayMax_Method));
 if (isAdd) {
 class_replaceMethod(self, bayMax_SEL, method_getImplementation(origin_Method), method_getTypeEncoding(origin_Method));
 }else{
 method_exchangeImplementations(origin_Method, bayMax_Method);
 }
 
NSMuatbleArray
 
 SEL bayMax_SEL_M = @selector(bayMax_objectAtIndex_M:);
 SEL origin_SEL_M = @selector(objectAtIndex:);
 
 Method bayMax_Method_M = class_getInstanceMethod(self, bayMax_SEL_M);
 Method origin_Method_M = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), origin_SEL_M);
 
 BOOL isAdd = class_addMethod(self, bayMax_SEL_M, method_getImplementation(origin_Method_M), method_getTypeEncoding(origin_Method_M));
 if (isAdd) {
 class_replaceMethod(self, origin_SEL_M, method_getImplementation(bayMax_Method_M), method_getTypeEncoding(bayMax_Method_M));
 }else{
 method_exchangeImplementations(origin_Method_M, bayMax_Method_M);
 }
 
 
 #warning TODO : y ?
 ///< todo : 为什么不行
 BOOL isAdd = class_addMethod(self, origin_SEL_M, method_getImplementation(bayMax_Method_M), method_getTypeEncoding(bayMax_Method_M));
 if (isAdd) {
 class_replaceMethod(self, bayMax_SEL_M, method_getImplementation(origin_Method_M), method_getTypeEncoding(origin_Method_M));
 }else{
 method_exchangeImplementations(origin_Method_M, bayMax_Method_M);
 }
 
 
 
 NSDictnoary
 MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_H_D)), @selector(initWithObjectsAndKeys:), self, @selector(bayMax_initWithObjectsAndKeys:));
 
 - (instancetype)bayMax_initWithObjectsAndKeys:(id)firstObject, ... {
 if (firstObject) {
 NSMutableArray* arr = [NSMutableArray array];
 va_list ap ;
 id curObj;
 [arr addObject:firstObject];
 
 va_start(ap, firstObject);
 while ((curObj = va_arg(ap, id))) {
 NSLog(@"%@",curObj);
 [arr addObject:curObj];
 }
 va_end(ap);
 
 if (arr.count % 2 != 0){
 return nil;
 }else{
 NSString* str = [arr componentsJoinedByString:@","];
 return [self bayMax_initWithObjectsAndKeys:[arr componentsJoinedByString:@","]];
 }
 }else{
 return nil;
 }
 }
 
 MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_H_D)), @selector(sharedKeySetForKeys:), self, @selector(bayMax_sharedKeySetForKeys:));
 
 + (id)bayMax_sharedKeySetForKeys:(NSArray<id <NSCopying>> *)keys{
 GA_AssertParamIsNil(keys, nil);
 GA_EntityAssert((![[keys class] isSubclassOfClass:[NSArray class]]), nil);
 return [self bayMax_sharedKeySetForKeys:keys];
 }

 NSMutableDictionary
 MethodSwizzling(NSClassFromString(GA_MapperStr(kTempKey)), @selector(sharedKeySetForKeys:), self, @selector(bayMax_sharedKeySetForKeys:));

 + (id)bayMax_sharedKeySetForKeys:(NSArray<id <NSCopying>> *)keys{
 GA_AssertParamIsNil(keys, nil);
 GA_EntityAssert((![[keys class] isSubclassOfClass:[NSArray class]]), nil);
 return [self bayMax_sharedKeySetForKeys:keys];
 }
 
 */




