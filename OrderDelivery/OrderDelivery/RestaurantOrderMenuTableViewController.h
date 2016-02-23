//
//  RestaurantOrderMenuTableViewController.h
//  OrderDelivery
//
//  Created by long long on 15/4/28.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"

@interface RestaurantOrderMenuTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *menuTable;
@property (nonatomic, strong) Restaurant *restaurant;
@property (retain) NSArray *menu;

@property (retain) NSMutableArray *searchResult;
@property (retain) NSArray *sections;
@end
