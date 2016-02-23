//
//  RestaurantList.h
//  OrderDelivery
//
//  Created by long long on 15/4/26.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface RestaurantList : MTLModel<MTLJSONSerializing>
@property NSMutableArray *restaurants;


@end
