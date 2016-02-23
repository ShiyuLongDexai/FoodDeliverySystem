//
//  CreditCard.m
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "CreditCard.h"

@implementation CreditCard
@synthesize cardNo,name,vin,expirationDate,identity;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identity" : @"id",
             @"expirationDate" : @"expirationDate",
             @"vin" : @"vin",
             @"name" : @"name",
             @"cardNo" : @"cardNo"
             };
}

@end
