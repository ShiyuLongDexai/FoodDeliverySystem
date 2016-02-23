//
//  Helper.m
//  OrderDelivery
//
//  Created by long long on 15/4/26.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "Helper.h"

@implementation Helper
+(NSArray *)getJson: (NSString *) realUrl{
    NSHTTPURLResponse *response = nil;
    NSString *jsonUrlString = realUrl;
    NSURL *url = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //-- Get request and response though URL
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    //-- JSON Parsing
    NSArray *result = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
//    NSLog(@"Result = %@",result);
    return result;
}

+(NSDictionary *)getJsonDic: (NSString *) realUrl{
    NSHTTPURLResponse *response = nil;
    NSString *jsonUrlString = realUrl;
    NSURL *url = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //-- Get request and response though URL
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    //-- JSON Parsing
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    //    NSLog(@"Result = %@",result);
    return result;
}

+(NSDictionary *) sendJson:(NSDictionary *)dataSend url:(NSString *) realUrl andCallback:(void (^)(NSDictionary *))callback{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataSend options:0 error:NULL];
    
    NSError *serr;
    if (serr)
    {
        NSLog(@"Error generating json data for send dictionary...");
        NSLog(@"Error (%@), error: %@", dataSend, serr);
        return nil;
    }
    
    NSLog(@"Successfully generated JSON for send dictionary");
    NSLog(@"now sending this dictionary...\n%@\n\n\n", dataSend);
    
    
#define appService [NSURL \
URLWithString:realUrl]
    
    // Create request object
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:appService];
    
    // Set method, body & content-type
    request.HTTPMethod = @"POST";
    request.HTTPBody = jsonData;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setValue:
     [NSString stringWithFormat:@"%lu",
      (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    
    // you would almost certainly use MBProgressHUD at this point
    // to display some sort of spinner or similar action on the UX
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
    completionHandler:
     ^(NSURLResponse *r, NSData *data, NSError *error){
         if (!data)
         {
             NSLog(@"No data returned from server, error ocurred: %@", error);
             return;
         }
         
         NSLog(@"got the NSData fine. here it is...\n%@\n", data);
         NSLog(@"next step, deserialising");
         
         NSError *deserr;
         NSDictionary *responseDict = [NSJSONSerialization
                                       JSONObjectWithData:data
                                       options:kNilOptions
                                       error:&deserr];
         NSLog(@"so, here's the responseDict\n\n\n%@\n\n\n", responseDict);
         
         callback((NSDictionary*) responseDict);
     }];
    return nil;
}
     
@end
