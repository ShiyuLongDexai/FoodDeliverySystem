//
//  User.h
//  OrderDelivery
//
//  Created by long long on 15/4/24.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface User :  MTLModel<MTLJSONSerializing>
@property NSString *username, *password, *role;
@end
