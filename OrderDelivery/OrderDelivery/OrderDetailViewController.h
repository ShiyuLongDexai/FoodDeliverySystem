//
//  OrderDetailViewController.h
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodOrder.h"

@interface OrderDetailViewController : UIViewController

@property (weak, nonatomic) FoodOrder *foodOrder;
@property (weak, nonatomic) IBOutlet UITableView *orderDetailTable;
@property (weak, nonatomic) IBOutlet UILabel *foodTotal;
@property (weak, nonatomic) IBOutlet UILabel *taxtips;
@property (weak, nonatomic) IBOutlet UILabel *total;

@end
