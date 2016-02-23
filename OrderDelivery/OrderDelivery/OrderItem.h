//
//  OrderItem.h
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "Dish.h"
#import "FoodOrder.h"

@interface OrderItem : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *quantity, *identity;
//@property FoodOrder *foodOrder;
@property Dish *dish;

@end
