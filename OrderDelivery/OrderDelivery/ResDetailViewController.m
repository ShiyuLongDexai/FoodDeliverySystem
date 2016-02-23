//
//  ResDetailViewController.m
//  OrderDelivery
//
//  Created by long long on 15/4/28.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "ResDetailViewController.h"
#import "Helper.h"
#import <Mantle/MTLJSONAdapter.h>
#import "AddReviewTableViewController.h"

@interface ResDetailViewController ()

@end

@implementation ResDetailViewController
@synthesize name, address,restaurant, rating, type, resReviews, starRating;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = restaurant.name;
    
    self.rating.text = [restaurant.avgRating stringValue];
    self.starRating.canEdit = NO;
    self.starRating.maxRating = 5;
    self.starRating.rating = [self.rating.text floatValue]/2;
    
    self.type.text = [NSString stringWithFormat:@"%@ Restaurant", restaurant.restaurantType];
    self.address.text = [NSString stringWithFormat:@"%@, %@, %@, %@", restaurant.address.street, restaurant.address.city, restaurant.address.state, restaurant.address.zipcode];
    
    NSString *realUrl = [NSString stringWithFormat:@"http://localhost:8080/finalProject/restaurantes/%@/photo", [restaurant.identity stringValue]];
    NSURL *url = [NSURL URLWithString:
                  realUrl];
    UIImage *theImage = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
    CGSize size=CGSizeMake(80, 80);//set the width and height
    UIImage *resizedImage= [self resizeImage:theImage imageSize:size];
    self.image.layer.masksToBounds = YES;
    self.image.layer.cornerRadius = 15.0;
    self.image.contentMode = UIViewContentModeScaleAspectFit;
    self.image.clipsToBounds = YES;
    self.image.image = resizedImage;
    
    //init reviews
    NSArray *array = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getReviews/%@/", [self.restaurant.identity stringValue]]];
    self.resReviews = [MTLJSONAdapter modelsOfClass:[RestaurantReview class] fromJSONArray:array error:NULL];
    [self.rrTable reloadData];
    // Do any additional setup after loading the view.
    
    //init image view
//    self.image.layer.masksToBounds = YES;
//    self.image.layer.cornerRadius = 15.0;
//    self.image.contentMode = UIViewContentModeScaleAspectFit;
//    self.image.clipsToBounds = YES;
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    self.name.text = restaurant.name;
    
    self.rating.text = [restaurant.avgRating stringValue];
    self.starRating.canEdit = NO;
    self.starRating.maxRating = 5;
    self.starRating.rating = [self.rating.text floatValue]/2;
    
    self.type.text = [NSString stringWithFormat:@"%@ Restaurant", restaurant.restaurantType];
    self.address.text = [NSString stringWithFormat:@"%@, %@, %@, %@", restaurant.address.street, restaurant.address.city, restaurant.address.state, restaurant.address.zipcode];
    
    NSString *realUrl = [NSString stringWithFormat:@"http://localhost:8080/finalProject/restaurantes/%@/photo", [restaurant.identity stringValue]];
    NSURL *url = [NSURL URLWithString:
                  realUrl];
    UIImage *theImage = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
    CGSize size=CGSizeMake(80, 80);//set the width and height
    UIImage *resizedImage= [self resizeImage:theImage imageSize:size];
    self.image.layer.masksToBounds = YES;
    self.image.layer.cornerRadius = 15.0;
    self.image.contentMode = UIViewContentModeScaleAspectFit;
    self.image.clipsToBounds = YES;
    self.image.image = resizedImage;
    
    //init reviews
    NSArray *array = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getReviews/%@/", [self.restaurant.identity stringValue]]];
    self.resReviews = [MTLJSONAdapter modelsOfClass:[RestaurantReview class] fromJSONArray:array error:NULL];
    [self.rrTable reloadData];
}

-(UIImage*)resizeImage:(UIImage *)image imageSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    //here is the scaled image which has been changed to the size specified
    UIGraphicsEndImageContext();
    return newImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"toMenu"]){
        RestaurantOrderMenuTableViewController *romVC = segue.destinationViewController;
        romVC.restaurant = self.restaurant;
    }
    if([segue.identifier isEqualToString:@"addReview"]){
        AddReviewTableViewController *addReviewVC = segue.destinationViewController;
        addReviewVC.restaurant = self.restaurant;
    }
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
        cell.textLabel.text = [NSString stringWithFormat:@"%@, rating: %@", resReview.content, [resReview.rating stringValue]];
        //get date
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        NSString *stringFromDate = [formatter stringFromDate:resReview.date];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"user: %@, date: %@", resReview.customer.name, stringFromDate];
        
//        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 60;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
////{
////    Restaurant *restaurant = (Restaurant *)[self.searchResult objectAtIndex:indexPath.row];
////    ResDetailViewController *resdeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"resdeVC"];
////    resdeVC.restaurant = restaurant;
////    [self.navigationController pushViewController:resdeVC animated:YES];
//}

@end
