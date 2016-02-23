//
//  EditReviewTableViewController.h
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantReview.h"
#import "ASStarRatingView.h"
#import "Restaurant.h"
#import "Customer.h"
#import "UIViewController+ECSlidingViewController.h"
#import "MenuViewController.h"
#import <Mantle/MTLJSONAdapter.h>
#import "Helper.h"

@interface EditReviewTableViewController : UITableViewController

@property (weak, nonatomic) RestaurantReview *restaurantReview;
@property (weak, nonatomic) IBOutlet ASStarRatingView *starRating;
@property (weak, nonatomic) IBOutlet UITextView *comment;
@property (weak, nonatomic) IBOutlet UIButton *delete;

@end
