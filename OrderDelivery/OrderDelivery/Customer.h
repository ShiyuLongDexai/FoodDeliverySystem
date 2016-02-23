//
//  Customer.h
//  OrderDelivery
//
//  Created by long long on 15/4/27.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "User.h"
#import "Address.h"

@interface Customer : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString  *name, *identity;

@property User *user;
@property Address *address;

@end
