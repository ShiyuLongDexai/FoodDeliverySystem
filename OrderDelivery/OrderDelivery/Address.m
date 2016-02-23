//
//  Address.m
//  OrderDelivery
//
//  Created by long long on 15/4/26.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "Address.h"

@implementation Address
@synthesize street,city,state,zipcode, identity;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"street" : @"street",
             @"city" : @"city",
             @"identity" : @"id",
             @"state" : @"state",
              @"zipcode" : @"zipcode"
            
             };
}
@end
