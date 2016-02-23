//
//  CustomerSettingTableViewController.m
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "CustomerSettingTableViewController.h"
#import "Helper.h"
#import "CustomerConstant.h"

@interface CustomerSettingTableViewController ()

@end

@implementation CustomerSettingTableViewController
@synthesize email, password1, password2, name, street, city, state, zip;
- (void)viewDidLoad {
    [super viewDidLoad];
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    Customer *c = cusmenuVC.customer;
    self.customer= c;
    email.text = c.user.username;
    password1.text = c.user.password;
    password2.text = c.user.password;
    name.text = c.name;
    street.text = c.address.street;
    state.text = c.address.state;
    city.text = c.address.city;
    zip.text = c.address.zipcode;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)saveUser:(id) sender{
    if(!self.email.text||[self.email.text length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"user name cannot be empty!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    } else {
        self.customer.user.username = self.email.text;
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
        self.customer.user.password = self.password1.text;
    }
    
    self.customer.address.street = self.street.text;
    self.customer.address.city = self.city.text;
    self.customer.address.state = self.state.text;
    if(!self.zip.text||[self.zip.text length]==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"zipcode cannot be empty!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    self.customer.address.zipcode = self.zip.text;

        self.customer.name = self.name.text;
        NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:self.customer error:nil];
       //send request with json
    [Helper sendJson:dict url:@"http://localhost:8080/finalProject/customer/updateCustomer" andCallback:^(NSDictionary * result){
        if (![result valueForKey:@"status"]||[[result valueForKey:@"status"] isEqual:[NSNull null]]||[[result valueForKey:@"status"] isEqualToString:@""]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"update failed!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }else if ([[result valueForKey:@"status"] isEqualToString:@"ok"]){
            MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
            cusmenuVC.customer = self.customer;
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"update success!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }
    }];
    
}


@end
