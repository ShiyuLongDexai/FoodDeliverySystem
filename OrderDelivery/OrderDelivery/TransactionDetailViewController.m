//
//  TransactionDetailViewController.m
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "TransactionDetailViewController.h"

@interface TransactionDetailViewController ()

@end

@implementation TransactionDetailViewController
@synthesize cart, originalTotalAmount;
- (void)viewDidLoad {
    [super viewDidLoad];
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    self.cart = cusmenuVC.cart;
    self.foodTotal.text = [NSString stringWithFormat:@"$ %.2lf", [cart.totalPrice doubleValue]];
    double tax1 = [cart.totalPrice doubleValue]* 0.0625;
    self.tax.text = [NSString stringWithFormat:@"$ %.2lf", tax1];
    
    self.originalTotalAmount = [cart.totalPrice doubleValue];
    double total = originalTotalAmount*1.0625 + 2.00;
    self.total.text = [NSString stringWithFormat:@"$ %.2lf", total];
    
    [self.tips addTarget:self action:@selector(textFieldDidChange:)
        forControlEvents:UIControlEventEditingChanged];
    
}

-(IBAction)textFieldDidChange:(UISegmentedControl *)SControl
{
    if(self.tips.text.length == 0 ){
        double total = originalTotalAmount*1.0625 + 2.00;
        self.total.text = [NSString stringWithFormat:@"$ %.2lf", total];
    }
    double total = self.originalTotalAmount*1.0625 + 2.00 + [self.tips.text doubleValue];
    self.total.text = [NSString stringWithFormat:@"$ %.2lf", total];
    
    self.cart.totalPrice = [NSNumber numberWithDouble:total];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



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
