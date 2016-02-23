//
//  CheckOutTableViewController.h
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"

@interface CheckOutTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *cardNo;
@property (weak, nonatomic) IBOutlet UITextField *nameOnCard;
@property (weak, nonatomic) IBOutlet UITextField *expirationDate;
@property (weak, nonatomic) IBOutlet UITextField *csc;
@property (weak, nonatomic) IBOutlet UITextField *street;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zip;

@end
