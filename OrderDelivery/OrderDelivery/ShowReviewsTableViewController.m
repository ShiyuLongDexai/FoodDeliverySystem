//
//  ShowReviewsTableViewController.m
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "ShowReviewsTableViewController.h"
#import "Helper.h"
#import "UIViewController+ECSlidingViewController.h"
#import "MenuViewController.h"
#import <Mantle/MTLJSONAdapter.h>
#import "RestaurantReview.h"
#import "EditReviewTableViewController.h"

@interface ShowReviewsTableViewController ()

@end

@implementation ShowReviewsTableViewController
@synthesize rrTable;
- (void)viewDidLoad {
    [super viewDidLoad];
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    NSString *cusId = cusmenuVC.customer.identity;
    //init reviews
    NSArray *array = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getCusReviews/%@/", cusId]];
    self.resReviews = [MTLJSONAdapter modelsOfClass:[RestaurantReview class] fromJSONArray:array error:NULL];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    NSString *cusId = cusmenuVC.customer.identity;
    //init reviews
    NSArray *array = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getCusReviews/%@/", cusId]];
    self.resReviews = [MTLJSONAdapter modelsOfClass:[RestaurantReview class] fromJSONArray:array error:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.resReviews count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    if([self.resReviews count] > 0 && [self.resReviews count] > indexPath.row){
        RestaurantReview *resReview = (RestaurantReview *)[self.resReviews objectAtIndex:indexPath.row];
        
        //set text label
        cell.textLabel.text = [NSString stringWithFormat:@"%@,   rating: %@", resReview.content, [resReview.rating stringValue]];
        //get date
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        NSString *stringFromDate = [formatter stringFromDate:resReview.date];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Restaurant: %@, date: %@", resReview.restaurant.name, stringFromDate];
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RestaurantReview *rr = [[RestaurantReview alloc]init];
    rr = (RestaurantReview *)[self.resReviews objectAtIndex:indexPath.row];
    
    EditReviewTableViewController *editReviewVC = [self.storyboard instantiateViewControllerWithIdentifier:@"editReviewVC"];
    editReviewVC.restaurantReview = rr;
    [self.navigationController pushViewController:editReviewVC animated:YES];
    
}

-(IBAction)refresh:(id) sender{
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    NSString *cusId = cusmenuVC.customer.identity;
    //init reviews
    NSArray *array = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getCusReviews/%@/", cusId]];
    self.resReviews = [MTLJSONAdapter modelsOfClass:[RestaurantReview class] fromJSONArray:array error:NULL];
    [self.rrTable reloadData];
}
@end
