//
//  OrderTableViewController.h
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+ECSlidingViewController.h"
#import "MenuViewController.h"

@interface OrderTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (retain) NSArray *currentOrders;
@property (strong, nonatomic) IBOutlet UITableView *orderTable;
@property (retain) NSArray *historyOrders;
@end
