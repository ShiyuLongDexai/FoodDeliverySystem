//
//  LoginViewController.m
//  OrderDelivery
//
//  Created by long long on 15/4/27.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "LoginViewController.h"
#import "CusHomeTableViewController.h"
#import "ResHomeTableViewController.h"
#import "ECSlidingViewController.h"
#import "User.h"
#import "Helper.h"
#import "MenuViewController.h"
#import "ResMenuTableViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize email,password,role,login,newuser;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.email setDelegate:self];
    [self.password setDelegate:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    return YES;
}

-(IBAction)login:(id) sender{
    User *user = [[User alloc]init];
    user.username = self.email.text;
    user.password = self.password.text;
    NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:user error:nil];
    [Helper sendJson:dict url:@"http://localhost:8080/finalProject/json/login" andCallback:^(NSDictionary * result){
    
    if (![result valueForKey:@"errorMessage"]||[[result valueForKey:@"errorMessage"] isEqual:[NSNull null]]||[[result valueForKey:@"errorMessage"] isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"not valid username and password!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }else if ([[result valueForKey:@"errorMessage"] isEqualToString:@"c"]){
        //Launch customer home
        UIStoryboard *mainStoryboard = self.storyboard;
        ECSlidingViewController *viewController = (ECSlidingViewController *)[mainStoryboard
        instantiateViewControllerWithIdentifier: @"cushome"];
        MenuViewController *cusmenuVC = (MenuViewController *)viewController.underLeftViewController;
        cusmenuVC.username = user.username;
        NSDictionary *dic = [Helper getJsonDic:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getCustomer/%@/", user.username]];
        
        cusmenuVC.customer = [MTLJSONAdapter modelOfClass:[Customer class] fromJSONDictionary:dic error:nil];
        [self presentViewController:viewController animated:YES completion:nil];

    }
    else {
        //Launch Res home
        UIStoryboard *mainStoryboard = self.storyboard;
        ECSlidingViewController *viewController = (ECSlidingViewController*)[mainStoryboard
        instantiateViewControllerWithIdentifier: @"reshome"];
        ResMenuTableViewController *resmenuVC = (ResMenuTableViewController *)viewController.underLeftViewController;
        resmenuVC.username = user.username;
        [self presentViewController:viewController animated:YES completion:nil];

    }
        }];
}

-(IBAction)forgetPassword:(id) sender{
    
    //send request
    if(!self.email.text||self.email.text.length == 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error!" message:@"please enter the email" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/forgetPassword/%@/", self.email.text]];
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess!" message:@"Email already sent to email" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    

}


@end
