//
//  Address.h
//  OrderDelivery
//
//  Created by long long on 15/4/26.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Address : MTLModel<MTLJSONSerializing>
@property NSString *street, *city, *state, *zipcode, *identity;
@end
