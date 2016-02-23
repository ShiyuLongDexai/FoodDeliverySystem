//
//  RestaurantReview.m
//  OrderDelivery
//
//  Created by long long on 15/4/28.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "RestaurantReview.h"
#import "MTLValueTransformer.h"

@implementation RestaurantReview
@synthesize content, rating, identity, customer, restaurant, date;
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identity" : @"id",
             @"customer" : @"customer",
             @"restaurant" : @"restaurant",
             @"date" : @"date",
             @"content" : @"content",
             @"rating" : @"rating",
             
             
             
             };
}

+ (NSValueTransformer *)restaurantJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Restaurant class]];
}

+ (NSValueTransformer *)customerJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Customer class]];
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

+ (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *_formatter;
    
    if (!_formatter) {
        _formatter = [NSDateFormatter new];
        _formatter.dateFormat = @"yy-MM-dd HH:mm:ss";
    }
    return _formatter;
}
@end
