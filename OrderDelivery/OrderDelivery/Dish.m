//
//  Dish.m
//  OrderDelivery
//
//  Created by long long on 15/4/28.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "Dish.h"

@implementation Dish
@synthesize  name, disc,category, price, identity, res, coverPhoto;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identity" : @"id",
             @"res" : @"res",
             @"price" : @"price",
             @"coverPhoto" : @"coverPhoto",
             @"category" : @"category",
             @"disc" : @"disc",
             @"name" : @"name"
             };
}

+ (NSValueTransformer *)resJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Restaurant class]];
}
@end
