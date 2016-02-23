//
//  RestaurantReview.h
//  OrderDelivery
//
//  Created by long long on 15/4/28.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Restaurant.h"
#import "Customer.h"
#import <Mantle/Mantle.h>

@interface RestaurantReview : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString  *content;
@property (nonatomic, strong) NSNumber *rating, *identity;
@property Restaurant *restaurant;
@property Customer *customer;
@property (nonatomic, strong) NSDate *date;

@end
