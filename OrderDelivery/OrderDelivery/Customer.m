//
//  Customer.m
//  OrderDelivery
//
//  Created by long long on 15/4/27.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "Customer.h"

@implementation Customer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identity" : @"id",
             @"user" : @"user",
             @"name" : @"name",
             @"address" : @"address",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[User class]];
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Address class]];
}

@end
