//
//  ResMenuTableViewController.h
//  OrderDelivery
//
//  Created by long long on 15/4/28.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResMenuTableViewController : UITableViewController
@property (strong,nonatomic) NSString *username;
- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue;
@end
