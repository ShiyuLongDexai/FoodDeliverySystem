//
//  RestaurantOrderMenuTableViewController.m
//  OrderDelivery
//
//  Created by long long on 15/4/28.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "RestaurantOrderMenuTableViewController.h"
#import "ResMenuDetailViewController.h"
#import <Mantle/MTLJSONAdapter.h>
#import "Dish.h"
#import "Helper.h"

@interface RestaurantOrderMenuTableViewController ()

@end

@implementation RestaurantOrderMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sections = @[@"appetizer", @"Entree", @"dessert", @"drink"];
    //init menu
    NSArray *array = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getDishes/%@/", [self.restaurant.identity stringValue]]];
    self.menu = [MTLJSONAdapter modelsOfClass:[Dish class] fromJSONArray:array error:NULL];
    
    self.searchResult = self.menu;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [self.sections count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.sections objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSString *sectionTitle = [self.sections objectAtIndex:section];
    NSMutableArray *sectionDishes = [[NSMutableArray alloc]init];
    for(Dish *dish in self.searchResult){
        if([dish.category isEqualToString:sectionTitle]){
            [sectionDishes addObject:dish];
        }
    }
    
    return [sectionDishes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    if([self.searchResult count] > 0 && [self.searchResult count] > indexPath.row){
        
        NSString *sectionTitle = [self.sections objectAtIndex:indexPath.section];
        
        NSMutableArray *sectionDishes = [[NSMutableArray alloc]init];
        for(Dish *dish in self.searchResult){
            if([dish.category isEqualToString:sectionTitle]){
                [sectionDishes addObject:dish];
            }
        }
        
        Dish *dish = (Dish *)[sectionDishes objectAtIndex:indexPath.row];
        
        //set text label
        cell.textLabel.text = [NSString stringWithFormat:@"%@, price: %@", dish.name, [dish.price stringValue]];
        //        UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 22.0 ];
        //        cell.detailTextLabel.font  = myFont;
        
        //set detailed
        //        UIFont *myFont2 = [ UIFont fontWithName: @"Arial" size: 16.0 ];
        //        cell.detailTextLabel.font  = myFont2;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", dish.disc];
        
        //get image
        NSString *realUrl = [NSString stringWithFormat:@"http://localhost:8080/finalProject/dishes/%@/photo", [dish.identity stringValue]];
        NSURL *url = [NSURL URLWithString:
                      realUrl];
        UIImage *theImage = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
        cell.imageView.image = theImage;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *sectionTitle = [self.sections objectAtIndex:indexPath.section];
    
    NSMutableArray *sectionDishes = [[NSMutableArray alloc]init];
    for(Dish *dish in self.searchResult){
        if([dish.category isEqualToString:sectionTitle]){
            [sectionDishes addObject:dish];
        }
    }

    Dish *dish = (Dish *)[sectionDishes objectAtIndex:indexPath.row];
    ResMenuDetailViewController *resMenuDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"resMenuDetailVC"];
    dish.res = self.restaurant;
    resMenuDetailVC.resName = self.restaurant.name;
    resMenuDetailVC.dish = dish;
    [self.navigationController pushViewController:resMenuDetailVC animated:YES];
    
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
