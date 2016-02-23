//
//  ShoppingCartTableViewController.m
//  OrderDelivery
//
//  Created by long long on 15/4/30.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "ShoppingCartTableViewController.h"

@interface ShoppingCartTableViewController ()

@end

@implementation ShoppingCartTableViewController
@synthesize cart;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.cartTable reloadData];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    self.cart = cusmenuVC.cart;
    
    double totalPrice;
    for(OrderItem *oi in cart.orders){
        totalPrice += [oi.dish.price doubleValue] * [oi.quantity doubleValue];
    }
    cart.totalPrice = [NSNumber numberWithDouble: totalPrice];
    [self.cartTable reloadData];

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
    return [self.cart.orders count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    if([self.cart.orders count] > 0 && [self.cart.orders count] > indexPath.row){
        OrderItem *oi = (OrderItem *)[self.cart.orders objectAtIndex:indexPath.row];
        
        //set text label
        cell.textLabel.text = [NSString stringWithFormat:@"%@, price: %@", oi.dish.name, [oi.dish.price stringValue]];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Quantity: %@", oi.quantity];
        
        //get image
        NSString *realUrl = [NSString stringWithFormat:@"http://localhost:8080/finalProject/dishes/%@/photo", [oi.dish.identity stringValue]];
        NSURL *url = [NSURL URLWithString:
                      realUrl];
        UIImage *theImage = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
        cell.imageView.image = theImage;
//        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Animate deletion
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
        OrderItem *c = [self.cart.orders objectAtIndex:[indexPath row]];
        [self.cart.orders removeObject:c];
        [self.cartTable deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Dish *dish = (Dish *)[self.searchResult objectAtIndex:indexPath.row];
//    ResMenuDetailViewController *resMenuDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"resMenuDetailVC"];
//    resMenuDetailVC.dish = dish;
//    [self.navigationController pushViewController:resMenuDetailVC animated:YES];
//    
//}

@end
