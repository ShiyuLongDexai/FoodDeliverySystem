//
//  Dish.h
//  OrderDelivery
//
//  Created by long long on 15/4/28.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "Restaurant.h"

@interface Dish : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString  *name, *disc, *category, *coverPhoto;
@property (nonatomic, strong) NSNumber *price, *identity;
@property Restaurant *res;
@property (nonatomic, strong) NSDate *date;

@end
