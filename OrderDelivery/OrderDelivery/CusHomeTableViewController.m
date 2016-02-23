//
//  CusHomeTableViewController.m
//  OrderDelivery
//
//  Created by long long on 15/4/27.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "CusHomeTableViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "MenuViewController.h"
#import <Mantle/MTLJSONAdapter.h>
#import "Restaurant.h"
#import "Helper.h"


@interface CusHomeTableViewController ()

@end

@implementation CusHomeTableViewController
@synthesize restaurants, resTable, searchBar,restaurantsByName,restaurantsByType;

- (void)viewDidLoad {
    [super viewDidLoad];
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    NSString *username = cusmenuVC.username;
    
    NSArray *array = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getRestaurants/%@/", username]];
    self.restaurants = [MTLJSONAdapter modelsOfClass:[Restaurant class] fromJSONArray:array error:NULL];
    
    NSArray *array2 = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getRestaurantsByType/%@/", username]];
    self.restaurantsByType = [MTLJSONAdapter modelsOfClass:[Restaurant class] fromJSONArray:array2 error:NULL];
    
    NSArray *array3 = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getRestaurantsByName/%@/", username]];
    self.restaurantsByName = [MTLJSONAdapter modelsOfClass:[Restaurant class] fromJSONArray:array3 error:NULL];
    
    self.searchResult = [[NSMutableArray alloc]init];
    [self.searchResult removeAllObjects];
    self.searchResult = [[NSMutableArray alloc] initWithArray:self.restaurants copyItems:YES];
    
    [self.segment addTarget:self action:@selector(SegmentChangeViewValueChanged:) forControlEvents:UIControlEventValueChanged];
//    [self.searchResult addObjectsFromArray:self.restaurants];
    
    
    //   self.navigationItem.hidesBackButton = YES;
 //   self.navigationController.title = @"Customer Home";
    
    //init
//    self.view.layer.shadowOpacity = 0.75f;
//    self.view.layer.shadowRadius = 10.0f;
//    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
//    if([self.slidingVC.underLeftViewController isKindOfClass:[MenuViewController class]]){
//        self.slidingVC.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
//    }
//    
//    [self.view addGestureRecognizer:self.slidingVC.panGesture];
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
}

-(IBAction)SegmentChangeViewValueChanged:(UISegmentedControl *)SControl
{
    if(self.segment.selectedSegmentIndex == 0){
        self.searchResult = [[NSMutableArray alloc]init];
        [self.searchResult removeAllObjects];
        self.searchResult = [[NSMutableArray alloc] initWithArray:self.restaurants copyItems:YES];
    } else if(self.segment.selectedSegmentIndex == 1){
        self.searchResult = [[NSMutableArray alloc]init];
        [self.searchResult removeAllObjects];
        self.searchResult = [[NSMutableArray alloc] initWithArray:self.restaurantsByType copyItems:YES];
    }else {
        self.searchResult = [[NSMutableArray alloc]init];
        [self.searchResult removeAllObjects];
        self.searchResult = [[NSMutableArray alloc] initWithArray:self.restaurantsByName copyItems:YES];
    }
    [self.resTable reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.searchResult count];
}

- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText {
    if(searchText.length == 0){
        self.searchResult = [NSMutableArray arrayWithArray: self.restaurants];
        [self.resTable reloadData];
        return;
        
    }

    NSMutableArray *new = [[NSMutableArray alloc] init];
    for(int i =0; i< [self.restaurants count]; i++){
        Restaurant *res = [self.restaurants objectAtIndex:i];
        if ([res.name rangeOfString:searchText].location != NSNotFound){
            [new addObject:res];
        }
    }
    
    [self.searchBar setShowsCancelButton:NO animated:YES];
    //    [searchBar resignFirstResponder];
    self.resTable.allowsSelection = YES;
    self.resTable.scrollEnabled = YES;
    
    [self.searchResult removeAllObjects];
    [self.searchResult addObjectsFromArray:new];
    [self.resTable reloadData];
    self.searchBar.text = searchText;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    if([self.searchResult count] > 0 && [self.searchResult count] > indexPath.row){
        Restaurant *res = (Restaurant *)[self.searchResult objectAtIndex:indexPath.row];
        
        //set text label
        cell.textLabel.text = [NSString stringWithFormat:@"%@,", res.name];
//        UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 22.0 ];
//        cell.detailTextLabel.font  = myFont;
        
        //set detailed
        cell.detailTextLabel.numberOfLines = 0;
        cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
//        UIFont *myFont2 = [ UIFont fontWithName: @"Arial" size: 16.0 ];
//        cell.detailTextLabel.font  = myFont2;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ cuisine, rating %@\n%@, %@, %@, %@", res.restaurantType, res.avgRating,res.address.street, res.address.city, res.address.state, res.address.zipcode];
        
        //get image
        NSString *realUrl = [NSString stringWithFormat:@"http://localhost:8080/finalProject/restaurantes/%@/photo", [res.identity stringValue]];
        NSURL *url = [NSURL URLWithString:
                      realUrl];
        UIImage *theImage = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
        cell.imageView.image = theImage;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 75;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Restaurant *restaurant = [[Restaurant alloc]init];
    restaurant = (Restaurant *)[self.searchResult objectAtIndex:indexPath.row];
    ResDetailViewController *resdeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"resdeVC"];
    resdeVC.restaurant = restaurant;
    [self.navigationController pushViewController:resdeVC animated:YES];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
