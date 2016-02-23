//
//  CusHomeTableViewController.h
//  OrderDelivery
//
//  Created by long long on 15/4/27.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "ResDetailViewController.h"

@interface CusHomeTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *resTable;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (retain) NSArray *restaurants;
@property (retain) NSArray *restaurantsByType;
@property (retain) NSArray *restaurantsByName;
@property (retain) NSMutableArray *searchResult;
@end
