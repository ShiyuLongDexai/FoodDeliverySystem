//
//  OrderTableViewController.m
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "OrderTableViewController.h"
#import "FoodOrder.h"
#import "Helper.h"
#import "OrderDetailViewController.h"

@interface OrderTableViewController ()

@end

@implementation OrderTableViewController
@synthesize currentOrders, historyOrders;
- (void)viewDidLoad {
    [super viewDidLoad];
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    NSString *cusId = cusmenuVC.customer.identity;
    NSArray *array = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getCurrentOrder/%@/", cusId]];
    self.currentOrders = [MTLJSONAdapter modelsOfClass:[FoodOrder class] fromJSONArray:array error:NULL];
    
    NSArray *array2 = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getHistoryOrder/%@/", cusId]];
    self.historyOrders = [MTLJSONAdapter modelsOfClass:[FoodOrder class] fromJSONArray:array2 error:NULL];
    [self.segment addTarget:self action:@selector(SegmentChangeViewValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    NSString *cusId = cusmenuVC.customer.identity;
    NSArray *array = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getCurrentOrder/%@/", cusId]];
    self.currentOrders = [MTLJSONAdapter modelsOfClass:[FoodOrder class] fromJSONArray:array error:NULL];
    
    NSArray *array2 = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getHistoryOrder/%@/", cusId]];
    self.historyOrders = [MTLJSONAdapter modelsOfClass:[FoodOrder class] fromJSONArray:array2 error:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)SegmentChangeViewValueChanged:(UISegmentedControl *)SControl
{
    [self.orderTable reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(self.segment.selectedSegmentIndex == 0){
        return [self.currentOrders count];
    }
    return [self.historyOrders count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    if(self.segment.selectedSegmentIndex == 0){
    if([self.currentOrders count] > 0 && [self.currentOrders count] > indexPath.row){
        FoodOrder *fo = (FoodOrder *)[self.currentOrders objectAtIndex:indexPath.row];
        
        //set text label
        cell.textLabel.text = [NSString stringWithFormat:@"%@, total: %@", fo.resName, [NSString stringWithFormat:@"$ %.2lf", [fo.totalPrice doubleValue]]];

        //set detailed
        cell.detailTextLabel.numberOfLines = 0;
        cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
        //date
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM-dd HH:mm";
        NSString *stringFromDate = [formatter stringFromDate:fo.deliveryTime];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"delivery address %@, %@, %@, %@\nStatus: %@, Delivery Time: %@", fo.address.street, fo.address.city, fo.address.state, fo.address.zipcode, fo.status,stringFromDate];

//        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        }
    } else {
        if([self.historyOrders count] > 0 && [self.historyOrders count] > indexPath.row){
            FoodOrder *fo = (FoodOrder *)[self.historyOrders objectAtIndex:indexPath.row];
            
            //set text label
            cell.textLabel.text = [NSString stringWithFormat:@"%@, total price: %@", fo.resName, fo.totalPrice];
            
            //set detailed
            cell.detailTextLabel.numberOfLines = 0;
            cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
            //date
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
            NSString *stringFromDate = [formatter stringFromDate:fo.deliveryTime];
            
            cell.detailTextLabel.text = [NSString stringWithFormat:@"delivery address %@, %@, %@, %@\nDelivery Time: %@, %@", fo.address.street, fo.address.city, fo.address.state, fo.address.zipcode, stringFromDate, fo.status];
            
            //        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 65;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodOrder *fo = [[FoodOrder alloc]init];
    if(self.segment.selectedSegmentIndex == 0){
    fo = (FoodOrder *)[self.currentOrders objectAtIndex:indexPath.row];
    } else {
        fo = (FoodOrder *)[self.historyOrders objectAtIndex:indexPath.row];
    }
    OrderDetailViewController *orderDetailedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"orderDetailedVC"];
    orderDetailedVC.foodOrder = fo;
    [self.navigationController pushViewController:orderDetailedVC animated:YES];
    
}

-(IBAction)refresh:(id) sender{
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    NSString *cusId = cusmenuVC.customer.identity;
    NSArray *array = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getCurrentOrder/%@/", cusId]];
    self.currentOrders = [MTLJSONAdapter modelsOfClass:[FoodOrder class] fromJSONArray:array error:NULL];
    
    NSArray *array2 = [Helper getJson:[NSString stringWithFormat:@"http://localhost:8080/finalProject/customer/getHistoryOrder/%@/", cusId]];
    self.historyOrders = [MTLJSONAdapter modelsOfClass:[FoodOrder class] fromJSONArray:array2 error:NULL];
    [self.orderTable reloadData];
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
