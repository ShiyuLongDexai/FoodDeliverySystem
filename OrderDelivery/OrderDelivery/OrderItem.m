//
//  OrderItem.m
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "OrderItem.h"

@implementation OrderItem
@synthesize identity,dish, quantity;
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identity" : @"id",
             @"dish" : @"dish",
             @"quantity" : @"quantity",
//             @"foodOrder" : @"foodOrder"
             };
}

+ (NSValueTransformer *)dishJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Dish class]];
}

//+ (NSValueTransformer *)foodOrderJSONTransformer {
//    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[FoodOrder class]];
//}
@end
