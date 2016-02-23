//
//  FoodOrder.m
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "FoodOrder.h"
#import "OrderItem.h"
#import "MTLValueTransformer.h"

@implementation FoodOrder
@synthesize status,payment,resName,totalPrice,orderId,customer,address,creditCard,orders,deliveryTime;

-(id)init{
    self = [super init];
    if(!orders){
        orders = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"status" : @"status",
             @"payment" : @"payment",
             @"resName" : @"resName",
             @"totalPrice" : @"totalPrice",
             @"orderId" : @"orderId",
             @"customer" : @"customer",
             @"address" : @"address",
             @"creditCard" : @"creditCard",
             @"orders" : @"orders",
             @"deliveryTime" : @"deliveryTime",
             @"date" : @"date"
             };
}

+ (NSValueTransformer *)customerJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Customer class]];
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Address class]];
}

+ (NSValueTransformer *)creditCardJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[CreditCard class]];
}

+ (NSValueTransformer *)ordersJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[OrderItem class]];
}

+ (NSValueTransformer *)deliveryTimeJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSNumber *num) {
        long time = (long)[num doubleValue]/1000;
        NSTimeInterval timeInterval = (NSTimeInterval)time;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        return date;
    } reverseBlock:^(NSDate *date) {
        long d = (long)[date timeIntervalSince1970];
        
        return [NSNumber numberWithLong: d*1000];
    }];
}

+ (NSValueTransformer *)dateJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSNumber *num) {
        long time = (long)[num doubleValue]/1000;
        NSTimeInterval timeInterval = (NSTimeInterval)time;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        return date;
    } reverseBlock:^(NSDate *date) {
        long d = (long)[date timeIntervalSince1970];
        
        return [NSNumber numberWithLong: d*1000];
    }];
}
@end
