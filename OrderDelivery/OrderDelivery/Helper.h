//
//  Helper.h
//  OrderDelivery
//
//  Created by long long on 15/4/26.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject
+(NSArray *)getJson: (NSString *) realUrl;
+(NSDictionary *)getJsonDic: (NSString *) realUrl;
+(NSDictionary *) sendJson:(NSDictionary *)dataSend url:(NSString *) realUrl andCallback:(void (^)(NSDictionary *))callback; 
@end
