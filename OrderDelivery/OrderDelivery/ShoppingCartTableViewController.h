//
//  ShoppingCartTableViewController.h
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodOrder.h"
#import "MenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "OrderItem.h"

@interface ShoppingCartTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *cartTable;
@property (nonatomic, retain) FoodOrder* cart;
@end
