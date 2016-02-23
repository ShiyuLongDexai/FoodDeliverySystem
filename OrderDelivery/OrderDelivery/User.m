//
//  User.m
//  OrderDelivery
//
//  Created by long long on 15/4/24.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "User.h"

@implementation User
@synthesize username=_username,password=_password,role=_role;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"username" : @"username",
             @"password" : @"password",
             @"role" : @"role"
             };
}


@end
