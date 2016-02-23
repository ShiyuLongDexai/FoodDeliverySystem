//
//  MenuViewController.h
//  OrderDelivery
//
//  Created by long long on 15/4/27.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "FoodOrder.h"
#import "Customer.h"

@interface MenuViewController : UITableViewController
@property (strong,nonatomic) NSString *username;
@property (retain,nonatomic) Customer *customer;
@property (nonatomic, retain) FoodOrder* cart;
- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue;
@end
