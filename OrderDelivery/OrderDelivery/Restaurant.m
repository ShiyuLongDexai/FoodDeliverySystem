//
//  Restaurant.m
//  OrderDelivery
//
//  Created by long long on 15/4/24.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "Restaurant.h"
#import "Address.h"
#import "User.h"

@implementation Restaurant
@synthesize identity, name, discription, restaurantType, coverPhoto, deliverZipcode, reviewsNo, avgRating, user, address;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identity" : @"id",
             @"user" : @"user",
             @"name" : @"name",
             @"address" : @"address",
             @"discription" : @"discription",
             @"restaurantType" : @"restaurantType",
             @"coverPhoto" : @"coverPhoto",
             @"deliverZipcode" : @"deliverZipcode",
             @"reviewsNo" : @"reviewsNo",
             @"avgRating" : @"avgRating"
             
             
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[User class]];
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Address class]];
}
@end
