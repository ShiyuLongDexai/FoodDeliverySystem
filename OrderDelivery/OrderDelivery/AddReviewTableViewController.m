//
//  AddReviewTableViewController.m
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "AddReviewTableViewController.h"
#import "RestaurantReview.h"
#import "Helper.h"

@interface AddReviewTableViewController ()

@end

@implementation AddReviewTableViewController
@synthesize starRating, disc;
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self.disc layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.disc layer] setBorderWidth:2.3];
    [[self.disc layer] setCornerRadius:15];
//    self.starRating.canEdit = YES;
    self.starRating.maxRating = 5;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)addFood:(id) sender{
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    
    RestaurantReview *rr = [[RestaurantReview alloc] init];
    rr.rating = [NSNumber numberWithFloat: self.starRating.rating*2];
    rr.content = self.disc.text;
    rr.date = [NSDate date];
    rr.restaurant = self.restaurant;
    rr.customer = cusmenuVC.customer;
    
    //send request
    NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:rr error:nil];
    [Helper sendJson:dict url:@"http://localhost:8080/finalProject/customer/addReview" andCallback:^(NSDictionary * result){
        if (![result valueForKey:@"status"]||[[result valueForKey:@"status"] isEqual:[NSNull null]]||[[result valueForKey:@"status"] isEqualToString:@""]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"payment failed!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }else if ([[result valueForKey:@"status"] isEqualToString:@"ok"]){
            [self.navigationController popViewControllerAnimated:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess!" message:@"food add to cart." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
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
