//
//  RestaurantList.m
//  OrderDelivery
//
//  Created by long long on 15/4/26.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "RestaurantList.h"
#import "Restaurant.h"

@implementation RestaurantList
@synthesize restaurants;
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"restaurants" : @""
             };
}

- (id) init {
    self = [super init];
    if(self){
        restaurants = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (NSValueTransformer *)friendsJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:Restaurant.class];
}


@end
