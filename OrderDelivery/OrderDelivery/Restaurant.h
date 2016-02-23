//
//  Restaurant.h
//  OrderDelivery
//
//  Created by long long on 15/4/24.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Address.h"
#import <Mantle/Mantle.h>

@interface Restaurant : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString  *name, *discription, *restaurantType, *coverPhoto, *deliverZipcode;
@property (nonatomic, strong) NSNumber *reviewsNo, *avgRating, *identity;
@property User *user;
@property Address *address;

@end
