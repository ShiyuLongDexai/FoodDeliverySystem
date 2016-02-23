//
//  CheckOutTableViewController.m
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "CheckOutTableViewController.h"
#import "Helper.h"
#import "FoodOrder.h"
#import "OrderItem.h"
#import "CustomerConstant.h"

@interface CheckOutTableViewController ()

@end

@implementation CheckOutTableViewController
@synthesize street, city, state, zip, cardNo, nameOnCard, csc, expirationDate, phone;
- (void)viewDidLoad {
    [super viewDidLoad];
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"checkOut"]){
        MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
        FoodOrder *cart = cusmenuVC.cart;
        cart.customer = cusmenuVC.customer;
        
        Address *address = [[Address alloc]init];
        address.street = self.street.text;
        address.city = self.city.text;
        address.state = self.state.text;
        address.zipcode = self.zip.text;
        cart.address = address;
        
        CreditCard *creditCard = [[CreditCard alloc]init];
        creditCard.cardNo = self.cardNo.text;
        creditCard.name = self.nameOnCard.text;
        creditCard.expirationDate = self.expirationDate.text;
        creditCard.vin = self.csc.text;
        cart.creditCard = creditCard;
        
//        NSString *rName = @"";
//        for(OrderItem *oi in cart.orders){
//            rName = oi.dish.res.name;
//            return;
//        }
//        cart.resName = rName;
        
        cart.status = ORDER_STATUS_UNDELIVERED;
        cart.payment = ORDER_PAYMENT_PAID;
        cart.date = [NSDate date];
        cart.deliveryTime = [[NSDate date] dateByAddingTimeInterval:(30*60)];
        
//        for(OrderItem *oi in cart.orders){
//            oi.foodOrder = cart;
//        }
        
        //send request
        NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:cart error:nil];
        [Helper sendJson:dict url:@"http://localhost:8080/finalProject/customer/checkOut" andCallback:^(NSDictionary * result){
            if (![result valueForKey:@"status"]||[[result valueForKey:@"status"] isEqual:[NSNull null]]||[[result valueForKey:@"status"] isEqualToString:@""]){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"payment failed!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
                return;
            }else if ([[result valueForKey:@"status"] isEqualToString:@"ok"]){
                FoodOrder *foodOrder = [[FoodOrder alloc]init];
                cusmenuVC.cart = foodOrder;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"success" message:@"payment scuess!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
                
            }
            }];
        
    }
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
