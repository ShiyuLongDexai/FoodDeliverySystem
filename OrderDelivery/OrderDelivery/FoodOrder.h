//
//  FoodOrder.h
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "Customer.h"
#import "Address.h"
#import "CreditCard.h"

@interface FoodOrder : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString  *status, *payment, *resName;
@property (nonatomic, strong) NSNumber *totalPrice, *orderId;
@property Customer *customer;
@property Address *address;
@property CreditCard *creditCard;
@property (nonatomic, strong) NSMutableArray *orders;
@property (nonatomic, strong) NSDate *deliveryTime, *date;
@end
