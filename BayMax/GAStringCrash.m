//
//  GAStringCrash.m
//  Genius_IM
//
//  Created by Graphic-one on 17/2/21.
//  Copyright © 2017年 Graphic-one. All rights reserved.
//

#import "GAStringCrash.h"

#define kMagicKey_P_H_S     @"TlNQbGFjZWhvbGRlclN0cmluZw=="
#define kMagicKey_CF_S__    @"X19OU0NGU3RyaW5n"
#define kMagicKey_S         @"TlNTdHJpbmc="
#define kMagickey_CF_C_S__  @"X19OU0NGQ29uc3RhbnRTdHJpbmc="

NSString* const BayMaxStringStatus = @"StringProtect";

#pragma mark - string
@interface NSString (BayMax) @end

@implementation NSString (BayMax)

+ (void)_changeNSStringProtect{
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_CF_S__)), @selector(characterAtIndex:), self, @selector(bayMax_characterAtIndex:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(substringFromIndex:), self, @selector(bayMax_substringFromIndex:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(substringToIndex:), self, @selector(bayMax_substringToIndex:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_CF_S__)), @selector(substringWithRange:), self, @selector(bayMax_substringWithRange:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(compare:options:range:), self, @selector(bayMax_compare:options:range:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(localizedCompare:), self, @selector(bayMax_localizedCompare:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(localizedCaseInsensitiveCompare:), self, @selector(bayMax_localizedCaseInsensitiveCompare:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(localizedStandardCompare:), self, @selector(bayMax_localizedStandardCompare:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_CF_S__)), @selector(hasPrefix:), self, @selector(bayMax_hasPrefix:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_CF_S__)), @selector(hasSuffix:), self, @selector(bayMax_hasSuffix:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(commonPrefixWithString:options:), self, @selector(bayMax_commonPrefixWithString:options:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagickey_CF_C_S__)), @selector(getCharacters:range:), self, @selector(bayMax_getCharacters:range:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(containsString:), self, @selector(bayMax_containsString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(localizedCaseInsensitiveContainsString:), self, @selector(bayMax_localizedCaseInsensitiveContainsString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(localizedStandardContainsString:), self, @selector(bayMax_localizedStandardContainsString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(localizedStandardRangeOfString:), self, @selector(bayMax_localizedStandardRangeOfString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(rangeOfString:options:range:locale:), self, @selector(bayMax_rangeOfString:options:range:locale:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(rangeOfCharacterFromSet:options:range:), self, @selector(bayMax_rangeOfCharacterFromSet:options:range:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(rangeOfComposedCharacterSequenceAtIndex:), self, @selector(bayMax_rangeOfComposedCharacterSequenceAtIndex:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(stringByAppendingString:), self, @selector(bayMax_stringByAppendingString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(uppercaseStringWithLocale:), self, @selector(bayMax_uppercaseStringWithLocale:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(lowercaseStringWithLocale:), self, @selector(bayMax_lowercaseStringWithLocale:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(capitalizedStringWithLocale:), self, @selector(bayMax_capitalizedStringWithLocale:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(stringByTrimmingCharactersInSet:), self, @selector(bayMax_stringByTrimmingCharactersInSet:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_S)), @selector(stringByReplacingOccurrencesOfString:withString:options:range:), self, @selector(bayMax_stringByReplacingOccurrencesOfString:withString:options:range:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_P_H_S)), @selector(initWithString:), self, @selector(bayMax_initWithString:));
}

- (unichar)bayMax_characterAtIndex:(NSUInteger)index{
    GA_EntityAssert((index > (self.length - 1)), [@"x" bayMax_characterAtIndex:0]);
    return [self bayMax_characterAtIndex:index];
}

- (NSString *)bayMax_substringFromIndex:(NSUInteger)from{
    GA_EntityAssert((from > (self.length - 1)), @"");
    return [self bayMax_substringFromIndex:from];
}

- (NSString *)bayMax_substringToIndex:(NSUInteger)to{
    GA_EntityAssert((to > (self.length - 1)), @"");
    return [self bayMax_substringToIndex:to];
}

- (NSString *)bayMax_substringWithRange:(NSRange)range{
    GA_EntityAssert((range.location + range.length > self.length), @"");
    return [self bayMax_substringWithRange:range];
}

- (void)bayMax_getCharacters:(unichar *)buffer range:(NSRange)range{
    GA_EntityAssert((range.location + range.length > self.length), );
    [self bayMax_getCharacters:buffer range:range];
}

- (NSComparisonResult)bayMax_compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare{
    GA_EntityAssert((![[string class] isSubclassOfClass:[NSString class]]), NSNotFound);
    GA_EntityAssert((rangeOfReceiverToCompare.location + rangeOfReceiverToCompare.length > self.length), NSNotFound);
    return [self bayMax_compare:string options:mask range:rangeOfReceiverToCompare];
}

- (NSComparisonResult)bayMax_localizedCompare:(NSString *)string{
    GA_EntityAssert((![[string class] isSubclassOfClass:[NSString class]]), NSNotFound);
    return [self bayMax_localizedCompare:string];
}

- (NSComparisonResult)bayMax_localizedCaseInsensitiveCompare:(NSString *)string{
    GA_EntityAssert((![[string class] isSubclassOfClass:[NSString class]]), NSNotFound);
    return [self bayMax_localizedCaseInsensitiveCompare:string];
}

- (NSComparisonResult)bayMax_localizedStandardCompare:(NSString *)string{
    GA_EntityAssert((![[string class] isSubclassOfClass:[NSString class]]), NSNotFound);
    return [self bayMax_localizedStandardCompare:string];
}

- (BOOL)bayMax_hasPrefix:(NSString *)str{
    GA_EntityAssert((![[str class] isSubclassOfClass:[NSString class]]), NO);
    return [self bayMax_hasPrefix:str];
}

- (BOOL)bayMax_hasSuffix:(NSString *)str{
    GA_EntityAssert((![[str class] isSubclassOfClass:[NSString class]]), NO);
    return [self bayMax_hasSuffix:str];
}

- (NSString *)bayMax_commonPrefixWithString:(NSString *)str options:(NSStringCompareOptions)mask{
    GA_EntityAssert((![[str class] isSubclassOfClass:[NSString class]]), @"");
    return [self bayMax_commonPrefixWithString:str options:mask];
}

- (BOOL)bayMax_containsString:(NSString *)str{
    GA_EntityAssert((![[str class] isSubclassOfClass:[NSString class]]), NO);
    return [self bayMax_containsString:str];
}

- (BOOL)bayMax_localizedCaseInsensitiveContainsString:(NSString *)str{
    GA_EntityAssert((![[str class] isSubclassOfClass:[NSString class]]), NO);
    return [self bayMax_localizedCaseInsensitiveContainsString:str];
}

- (BOOL)bayMax_localizedStandardContainsString:(NSString *)str{
    GA_EntityAssert((![[str class] isSubclassOfClass:[NSString class]]), NO);
    return [self bayMax_localizedStandardContainsString:str];
}

- (NSRange)bayMax_localizedStandardRangeOfString:(NSString *)str{
    GA_EntityAssert((![[str class] isSubclassOfClass:[NSString class]]), NSMakeRange(NSNotFound, NSNotFound));
    return [self bayMax_localizedStandardRangeOfString:str];
}

- (NSRange)bayMax_rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(nullable NSLocale *)locale{
    GA_EntityAssert((![[searchString class] isSubclassOfClass:[NSString class]]), NSMakeRange(0, 0));
    GA_EntityAssert((rangeOfReceiverToSearch.location + rangeOfReceiverToSearch.length > self.length), NSMakeRange(0, 0));
    return [self bayMax_rangeOfString:searchString options:mask range:rangeOfReceiverToSearch locale:locale];
}

- (NSRange)bayMax_rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch{
    GA_AssertParamIsNil(searchSet, NSMakeRange(0, 0));
    GA_EntityAssert((![[searchSet class] isSubclassOfClass:[NSCharacterSet class]]), NSMakeRange(0, 0));
    GA_EntityAssert((rangeOfReceiverToSearch.location + rangeOfReceiverToSearch.length > self.length), NSMakeRange(0, 0));
    return [self bayMax_rangeOfCharacterFromSet:searchSet options:mask range:rangeOfReceiverToSearch];
}

- (NSRange)bayMax_rangeOfComposedCharacterSequenceAtIndex:(NSUInteger)index{
    GA_EntityAssert((index > (self.length - 1)), NSMakeRange(0, 0));
    return [self bayMax_rangeOfComposedCharacterSequenceAtIndex:index];
}

- (NSRange)bayMax_rangeOfComposedCharacterSequencesForRange:(NSRange)range{
    GA_EntityAssert((range.location + range.length > self.length) , NSMakeRange(0, 0));
    return [self bayMax_rangeOfComposedCharacterSequencesForRange:range];
}

- (NSString *)bayMax_stringByAppendingString:(NSString *)aString{
    GA_AssertParamIsNil(aString, self);
    GA_AssertParamIsNSNull(aString, self);
    return [self bayMax_stringByAppendingString:aString];
}

- (NSString *)bayMax_uppercaseStringWithLocale:(nullable NSLocale *)locale{
    GA_EntityAssert((![[locale class] isSubclassOfClass:[NSLocale class]]), [self bayMax_uppercaseStringWithLocale:nil]);
    return [self bayMax_uppercaseStringWithLocale:locale];
}

- (NSString *)bayMax_lowercaseStringWithLocale:(nullable NSLocale *)locale{
    GA_EntityAssert((![[locale class] isSubclassOfClass:[NSLocale class]]), [self bayMax_lowercaseStringWithLocale:nil]);
    return [self bayMax_lowercaseStringWithLocale:locale];
}

- (NSString *)bayMax_capitalizedStringWithLocale:(nullable NSLocale *)locale{
    GA_EntityAssert((![[locale class] isSubclassOfClass:[NSLocale class]]), [self bayMax_capitalizedStringWithLocale:nil]);
    return [self bayMax_capitalizedStringWithLocale:locale];
}

- (NSString *)bayMax_stringByTrimmingCharactersInSet:(NSCharacterSet *)set{
    GA_EntityAssert((![[set class] isSubclassOfClass:[NSCharacterSet class]]), self);
    return [self bayMax_stringByTrimmingCharactersInSet:set];
}

- (NSString *)bayMax_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange{
    GA_EntityAssert((searchRange.location + searchRange.length > self.length), self);
    GA_AssertParamIsNil(target, self);
    GA_AssertParamIsNil(replacement, self);
    GA_EntityAssert((![[target class] isSubclassOfClass:[NSString class]]), self);
    GA_EntityAssert((![[replacement class] isSubclassOfClass:[NSString class]]), self);
    return [self bayMax_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
}

- (instancetype)bayMax_initWithString:(NSString *)aString{
    GA_EntityAssert((![[aString class] isSubclassOfClass:[NSString class]]), nil);
    return [self bayMax_initWithString:aString];
}

@end


@interface NSMutableString (BayMax) @end

@implementation NSMutableString (BayMax)

+ (void)_changeNSMutableStringProtect{
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_CF_S__)), @selector(replaceCharactersInRange:withString:), self, @selector(bayMax_replaceCharactersInRange:withString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_CF_S__)), @selector(insertString:atIndex:), self, @selector(bayMax_insertString:atIndex:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_CF_S__)), @selector(deleteCharactersInRange:), self, @selector(bayMax_deleteCharactersInRange:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_CF_S__)), @selector(appendString:), self, @selector(bayMax_appendString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_CF_S__)), @selector(setString:), self, @selector(bayMax_setString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_CF_S__)), @selector(replaceOccurrencesOfString:withString:options:range:), self, @selector(bayMax_replaceOccurrencesOfString:withString:options:range:));
}

- (void)bayMax_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString{
    GA_EntityAssert((range.location + range.length > self.length), );
    return [self bayMax_replaceCharactersInRange:range withString:aString];
}

- (void)bayMax_insertString:(NSString *)aString atIndex:(NSUInteger)loc{
    GA_EntityAssert((loc > (self.length - 1)), );
    GA_EntityAssert((![[aString class] isSubclassOfClass:[NSString class]]), );
    return [self bayMax_insertString:aString atIndex:loc];
}

- (void)bayMax_deleteCharactersInRange:(NSRange)range{
    GA_EntityAssert((range.location + range.length > self.length), );
    return [self bayMax_deleteCharactersInRange:range];
}

- (void)bayMax_appendString:(NSString *)aString{
    GA_EntityAssert((![[aString class] isSubclassOfClass:[NSString class]]), );
    return [self bayMax_appendString:aString];
}

- (void)bayMax_setString:(NSString *)aString{
    GA_EntityAssert((![[aString class] isSubclassOfClass:[NSString class]]), );
    return [self bayMax_setString:aString];
}

- (NSUInteger)bayMax_replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange{
    GA_EntityAssert((searchRange.location + searchRange.length > self.length), 0);
    return [self bayMax_replaceOccurrencesOfString:target withString:replacement options:options range:searchRange];
}

@end


#define kMagicKey_URE_A     @"TlNSTEVBcnJheQ==" //NSRLEArray
#define kMagicKey_URE_M_A   @"TlNNdXRhYmxlUkxFQXJyYXk="//NSMutableRLEArray
#define kMagicKey_ATT_S     @"TlNBdHRyaWJ1dGVkU3RyaW5n"//NSAttributedString
#define kMagicKey_ATT_S_M   @"TlNNdXRhYmxlQXR0cmlidXRlZFN0cmluZw=="//NSMutableAttributedString
#define kMagicKey_C_ATT_S   @"TlNDb25jcmV0ZUF0dHJpYnV0ZWRTdHJpbmc="//NSConcreteAttributedString
#define kMagicKey_C_ATT_S_M @"TlNDb25jcmV0ZU11dGFibGVBdHRyaWJ1dGVkU3RyaW5n"//NSConcreteMutableAttributedString

#pragma mark - attributeString
@interface NSAttributedString (BayMax) @end

@implementation NSAttributedString (BayMax)

+ (void)_changeNSAttributedStringProtect{
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S)), @selector(attributesAtIndex:effectiveRange:), self, @selector(bayMax_attributesAtIndex:effectiveRange:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S)), @selector(initWithString:attributes:), self, @selector(bayMax_initWithString:attributes:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S)), @selector(initWithString:), self, @selector(bayMax_initWithString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S)), @selector(initWithAttributedString:), self, @selector(bayMax_initWithAttributedString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S_M)), @selector(attribute:atIndex:longestEffectiveRange:inRange:), self, @selector(bayMax_attribute:atIndex:longestEffectiveRange:inRange:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_ATT_S)), @selector(attributedSubstringFromRange:), self, @selector(bayMax_attributedSubstringFromRange:));
}

- (NSAttributedString *)bayMax_attributedSubstringFromRange:(NSRange)range{
    GA_EntityAssert((range.location + range.length > self.length), self);
    return [self bayMax_attributedSubstringFromRange:range];
}

- (NSDictionary<NSString *, id> *)bayMax_attributesAtIndex:(NSUInteger)location effectiveRange:(nullable NSRangePointer)range{
//    NSRange curRange = *range;
//    GA_EntityAssert((curRange.location + curRange.length > self.length), nil);
    GA_EntityAssert((location > (self.length - 1)), nil);
    return [self bayMax_attributesAtIndex:location effectiveRange:range];
}

- (instancetype)bayMax_initWithString:(NSString *)str{
    GA_EntityAssert((![[str class] isSubclassOfClass:[NSString class]]), nil);
    return [self bayMax_initWithString:str];
}

- (instancetype)bayMax_initWithAttributedString:(NSAttributedString *)attrStr{
    GA_EntityAssert((![[attrStr class] isSubclassOfClass:[NSAttributedString class]]), nil);
    return [self bayMax_initWithAttributedString:attrStr];
}

- (instancetype)bayMax_initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs{
    GA_EntityAssert((![[str class] isSubclassOfClass:[NSString class]]), nil);
    GA_EntityAssert((![[attrs class] isSubclassOfClass:[NSDictionary class]]), nil);
    return [self bayMax_initWithString:str attributes:attrs];
}

- (id)bayMax_attribute:(NSString *)attrName atIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit{
    GA_EntityAssert((location > (self.length - 1)), nil);
    return [self bayMax_attribute:attrName atIndex:location longestEffectiveRange:range inRange:rangeLimit];
}


@end


@interface NSMutableAttributedString (BayMax) @end

@implementation NSMutableAttributedString (BayMax)

+ (void)_changeNSMutableAttributedStringProtect{
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S_M)), @selector(replaceCharactersInRange:withString:), self, @selector(bayMax_replaceCharactersInRange:withString:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S_M)), @selector(setAttributes:range:), self, @selector(bayMax_setAttributes:range:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S_M)), @selector(addAttribute:value:range:), self, @selector(bayMax_addAttribute:value:range:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S_M)), @selector(addAttributes:range:), self, @selector(bayMax_addAttributes:range:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S_M)), @selector(removeAttribute:range:), self, @selector(bayMax_removeAttribute:range:));
    MethodSwizzling(NSClassFromString(GA_MapperStr(kMagicKey_C_ATT_S_M)), @selector(replaceCharactersInRange:withAttributedString:), self, @selector(bayMax_replaceCharactersInRange:withAttributedString:));
}

- (void)bayMax_replaceCharactersInRange:(NSRange)range withString:(NSString *)str{
    GA_EntityAssert((range.location + range.length > self.length), );
    [self bayMax_replaceCharactersInRange:range withString:str];
}

- (void)bayMax_setAttributes:(nullable NSDictionary<NSString *, id> *)attrs range:(NSRange)range{
    GA_EntityAssert((range.location + range.length > self.length), );
    [self bayMax_setAttributes:attrs range:range];
}

- (void)bayMax_addAttribute:(NSString *)name value:(id)value range:(NSRange)range{
    GA_EntityAssert((range.location + range.length > self.length), );
    [self bayMax_addAttribute:name value:value range:range];
}

- (void)bayMax_addAttributes:(NSDictionary<NSString *, id> *)attrs range:(NSRange)range{
    GA_AssertParamIsNil(attrs, );
    GA_EntityAssert((range.location + range.length > self.length), );
    [self bayMax_setAttributes:attrs range:range];
}

- (void)bayMax_removeAttribute:(NSString *)name range:(NSRange)range{
    GA_EntityAssert((range.location + range.length > self.length), );
    [self bayMax_removeAttribute:name range:range];
}

- (void)bayMax_replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString{
    GA_EntityAssert((range.length + range.location > self.length), );
    GA_EntityAssert((![[attrString class] isSubclassOfClass:[NSAttributedString class]]), );
    [self bayMax_replaceCharactersInRange:range withAttributedString:attrString];
}

@end



#pragma mark - GAStringCrash
@implementation GAStringCrash
+ (void)_changeStringProtect{
    [NSString _changeNSStringProtect];
    [NSMutableString _changeNSMutableStringProtect];
    [NSAttributedString _changeNSAttributedStringProtect];
    [NSMutableAttributedString _changeNSMutableAttributedStringProtect];
    
    updateProtectStatus(BayMaxStringStatus);
}
@end



