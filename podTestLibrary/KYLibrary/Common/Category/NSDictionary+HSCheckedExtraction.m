//
//  NSDictionary+HSCheckedExtraction.m
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

#import "NSDictionary+HSCheckedExtraction.h"

@implementation NSDictionary (HSCheckedExtraction)

- (NSNumber*)numberForKey:(id)aKey {
	return [self objectForKey:aKey ofClass:[NSNumber class] allowingNull:NO];
}

- (NSString*)stringForKey:(id)aKey
{
	return [self objectForKey:aKey ofClass:[NSString class] allowingNull:NO];
}

- (NSString*)nonEmptyStringForKey:(id)aKey
{
    NSString* str = [self stringForKey:aKey];
    return str.length > 0 ? str : nil;
}

- (NSArray*)arrayForKey:(id)aKey
{
    return [self objectForKey:aKey ofClass:[NSArray class] allowingNull:NO];
}

- (NSArray*)nonEmptyArrayForKey:(id)aKey
{
    NSArray* array = [self objectForKey:aKey ofClass:[NSArray class] allowingNull:NO];
    return array.count > 0 ? array : nil;
}

- (NSDictionary*)dictionaryForKey:(id)aKey
{
    return [self objectForKey:aKey ofClass:[NSDictionary class] allowingNull:NO];
}

- (NSDictionary*)nonEmptyDictionaryForKey:(id)aKey
{
    NSDictionary* dict = [self dictionaryForKey:aKey];
    return dict.count > 0 ? dict : nil;
}

- (id)objectForKey:(id)aKey ofClass:(Class)expectedClass allowingNull:(BOOL)allowNull
{
	id object = [self objectForKey:aKey];
	if(!object)
    {
		return nil;
	}
	
	if([(NSNull*)object isEqual:[NSNull null]])
    {
		return (allowNull) ? object : nil;
	}
	
	if(![object isKindOfClass:expectedClass])
    {
		return nil;
	}
	return object;
}

#pragma mark - Derived - 

- (NSURL*)urlForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    if([object isKindOfClass:[NSURL class]])
    {
        return object;
    }
    if([object isKindOfClass:[NSString class]])
    {
        return [NSURL URLWithString:(NSString*)object];
    }
    return nil;
}


@end
