//
//  CreditCard.h
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>


@interface CreditCard : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString  *cardNo, *name, *expirationDate, *vin;
@property (nonatomic, strong) NSNumber *identity;


@end
