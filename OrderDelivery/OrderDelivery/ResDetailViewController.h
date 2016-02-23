//
//  ResDetailViewController.h
//  OrderDelivery
//
//  Created by long long on 15/4/28.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"
#import "RestaurantOrderMenuTableViewController.h"
#import "RestaurantReview.h"
#import "ASStarRatingView.h"

@interface ResDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *rating;

@property (nonatomic, retain) Restaurant *restaurant;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet ASStarRatingView *starRating;

@property (weak, nonatomic) IBOutlet UITableView *rrTable;
@property (retain) NSArray *resReviews;
@end
