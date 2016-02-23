//
//  AddReviewTableViewController.h
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStarRatingView.h"
#import "Restaurant.h"
#import "Customer.h"
#import "UIViewController+ECSlidingViewController.h"
#import "MenuViewController.h"
#import <Mantle/MTLJSONAdapter.h>

@interface AddReviewTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet ASStarRatingView *starRating;

@property (weak, nonatomic) IBOutlet UITextView *disc;
@property (nonatomic, retain) Restaurant *restaurant;
@property (nonatomic, retain) Customer *customer;

@end
