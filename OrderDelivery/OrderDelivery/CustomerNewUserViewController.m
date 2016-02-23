//
//  CustomerNewUserViewController.m
//  OrderDelivery
//
//  Created by long long on 15/4/27.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "CustomerNewUserViewController.h"
#import "User.h"
#import "Address.h"
#import "Restaurant.h"
#import "Customer.h"

@interface CustomerNewUserViewController ()

@end

@implementation CustomerNewUserViewController
@synthesize email, password1, password2, name, role, street, city, state, zip;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)saveUser:(id) sender{
    User *user = [[User alloc]init];
    if(!self.email.text||[self.email.text length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"user name cannot be empty!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    } else {
    user.username = self.email.text;
    }
    if(![self.password1.text isEqualToString:self.password2.text]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"re-entered password should be the same as the password!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    } else if(!self.password1.text||[self.password1.text length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"password cannot be empty!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    } else {
        user.password = self.password1.text;
    }
    
    Address *address = [[Address alloc]init];
    address.street = self.street.text;
    address.city = self.city.text;
    address.state = self.state.text;
    if(!self.zip.text||[self.zip.text length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"zipcode cannot be empty!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    address.zipcode = self.zip.text;
    
    NSDictionary *dict;
    if(role.selectedSegmentIndex == 0){
        Customer *customer = [[Customer alloc]init];
        customer.user = user;
        customer.address = address;
        customer.name = self.name.text;
        user.role = @"c";
        dict = [MTLJSONAdapter JSONDictionaryFromModel:customer error:nil];
    } else {
        Restaurant *restaurant = [[Restaurant alloc]init];
        restaurant.user = user;
        restaurant.address = address;
        restaurant.name = self.name.text;
        user.role = @"r";
        dict = [MTLJSONAdapter JSONDictionaryFromModel:restaurant error:nil];
    }
//send request with json
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
    NSError *serr;
    if (serr)
    {
        NSLog(@"Error generating json data for send dictionary...");
        NSLog(@"Error (%@), error: %@", dict, serr);
        return;
    }
    
    NSLog(@"Successfully generated JSON for send dictionary");
    NSLog(@"now sending this dictionary...\n%@\n\n\n", dict);
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/finalProject/newuser/restaurant"];
//#define appService [NSURL \
//URLWithString:@"http://localhost:8080/finalProject/newuser/restaurant"]
    if([user.role isEqualToString:@"c"]){
        url = [NSURL URLWithString:@"http://localhost:8080/finalProject/newuser/customer"];
//#define appService [NSURL \
//URLWithString:@"http://localhost:8080/finalProject/newuser/customer"]
    }
    // Create request object
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
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
         if(!responseDict || ![[responseDict valueForKey:@"status"] isEqualToString:@"ok"]){
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"duplicated username!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
             [alert show];
             return;
         }
         // LOOK at that output on your console to learn how to parse it.
         // to get individual values example blah = responseDict[@"fieldName"];
         [self.navigationController popViewControllerAnimated:YES];
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"create success!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
         [alert show];
     }];
    

    
    
//        [self.navigationController popViewControllerAnimated:YES];
    }


@end
