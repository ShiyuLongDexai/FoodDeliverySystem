//
//  ViewController.m
//  OrderDelivery
//
//  Created by long long on 15/4/23.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "ViewController.h"
#import "Helper.h"
#import <Mantle/MTLJSONAdapter.h>
#import "User.h"
#import "Restaurant.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize Id,info;

- (IBAction)fetchGreeting;
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/finalProject/test1/topRestaurants"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             self.Id.text = [greeting objectForKey:@"username"];
             self.info.text = [greeting objectForKey:@"role"];
         }
     }];
}

- (void)simpleJsonParsing
{

    
    NSArray *array = [Helper getJson:@"http://localhost:8080/finalProject/test1/topRestaurants"];
    NSArray *rl = [MTLJSONAdapter modelsOfClass:[Restaurant class] fromJSONArray:array error:NULL];
    Restaurant *r = rl[1];
    self.Id.text = r.name;
    self.info.text = r.user.role;
    //    for (NSMutableDictionary *dic in [Helper getJson:@"http://localhost:8080/finalProject/test1/topRestaurants"])
//    {
//        NSString *string = dic[@"id"];
//        if (string)
//        {
//            NSString *name = (NSString*) [dic valueForKey:@"name"];
//            NSString *discription = (NSString*) [dic valueForKey:@"discription"];
//
//            if(![name isKindOfClass:[NSNull class]]){
//            self.Id.text = name;
//            }
//            if(![discription isKindOfClass:[NSNull class]]){
//                self.info.text = discription;
//            }
//        }
//        else
//        {
//            NSLog(@"Error in url response");
//        }
//    }
    
}

-(void)sendTestJsonCommand
{
    NSError *serr;
    User *user = [[User alloc]init];
    user.username = @"aa";
    user.password = @"bb";
    user.role = @"cc";
    Restaurant *r = [[Restaurant alloc]init];
    r.identity = [NSNumber numberWithInt:5];
    r.name = @"hehe";
    r.user = user;
    Address *a = [[Address alloc]init];
    r.address = a;
    Restaurant *r1=r.copy;
    NSMutableArray *rl = [[NSMutableArray alloc]init];
    [rl addObject:r];
    [rl addObject:r1];
    NSArray *dict = [MTLJSONAdapter JSONArrayFromModels:rl error:nil];
//    NSMutableDictionary *dict = @{
//                                 
//                                  @"name":@"4_5_7"
//                                  @"password":@"4",
//                                  @"role":@"Some Title",
//                                  
//                                  
//                                  }.mutableCopy;
    
    
    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&serr];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
    
    
    if (serr)
    {
        NSLog(@"Error generating json data for send dictionary...");
        NSLog(@"Error (%@), error: %@", dict, serr);
        return;
    }
    
    NSLog(@"Successfully generated JSON for send dictionary");
    NSLog(@"now sending this dictionary...\n%@\n\n\n", dict);

    
#define appService [NSURL \
 URLWithString:@"http://localhost:8080/finalProject/testreceive3"]
    
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
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *r, NSData *data, NSError *error)
     {
         
         if (!data)
         {
             NSLog(@"No data returned from server, error ocurred: %@", error);
//             NSString *userErrorText = [NSString stringWithFormat: @"Error communicating with server: %@", error.localizedDescription];
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
         
         // LOOK at that output on your console to learn how to parse it.
         // to get individual values example blah = responseDict[@"fieldName"];
     }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self simpleJsonParsing];
    [self sendTestJsonCommand];
//    [self fetchGreeting];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
