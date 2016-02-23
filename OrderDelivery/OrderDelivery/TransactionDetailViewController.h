//
//  TransactionDetailViewController.h
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"


@interface TransactionDetailViewController : UITableViewController

@property (nonatomic, retain) FoodOrder* cart;
@property (weak, nonatomic) IBOutlet UILabel *foodTotal;
@property (weak, nonatomic) IBOutlet UILabel *tax;
@property (weak, nonatomic) IBOutlet UILabel *deliveryFee;
@property (weak, nonatomic) IBOutlet UITextField *tips;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UITextField *message;
@property (nonatomic) double originalTotalAmount;

@end
