//
//  EditReviewTableViewController.m
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "EditReviewTableViewController.h"

@interface EditReviewTableViewController ()

@end

@implementation EditReviewTableViewController
@synthesize restaurantReview;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.starRating.maxRating = 5;
    self.starRating.rating = [self.restaurantReview.rating floatValue]/2;
    self.comment.text = self.restaurantReview.content;
    
    [[self.comment layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.comment layer] setBorderWidth:2.3];
    [[self.comment layer] setCornerRadius:15];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)saveUpdate:(id) sender{

    self.restaurantReview.rating = [NSNumber numberWithFloat: self.starRating.rating*2];
    self.restaurantReview.content = self.comment.text;
    self.restaurantReview.date = [NSDate date];
    
    //send request
    NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:self.restaurantReview error:nil];
    [Helper sendJson:dict url:@"http://localhost:8080/finalProject/customer/updateReview" andCallback:^(NSDictionary * result){
        if (![result valueForKey:@"status"]||[[result valueForKey:@"status"] isEqual:[NSNull null]]||[[result valueForKey:@"status"] isEqualToString:@""]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"review update failed!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }else if ([[result valueForKey:@"status"] isEqualToString:@"ok"]){
            [self.navigationController popViewControllerAnimated:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess!" message:@"review update success." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}

-(IBAction)delete:(id) sender{
    
    //send request
    NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:self.restaurantReview error:nil];
    [Helper sendJson:dict url:@"http://localhost:8080/finalProject/customer/deleteReview" andCallback:^(NSDictionary * result){
        if (![result valueForKey:@"status"]||[[result valueForKey:@"status"] isEqual:[NSNull null]]||[[result valueForKey:@"status"] isEqualToString:@""]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"delete Review failed!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }else if ([[result valueForKey:@"status"] isEqualToString:@"ok"]){
            [self.navigationController popViewControllerAnimated:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess!" message:@"Review delete sccuess." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}

@end
