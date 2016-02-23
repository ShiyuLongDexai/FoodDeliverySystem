//
//  OrderDetailViewController.m
//  OrderDelivery
//
//  Created by long long on 15/5/1.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "OrderItem.h"

@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController
@synthesize foodOrder;

- (void)viewDidLoad {
    [super viewDidLoad];
    double totalFoodPrice = 0;
    for(OrderItem *oi in self.foodOrder.orders){
        totalFoodPrice +=[oi.dish.price doubleValue] * [oi.quantity doubleValue];
    }
    double taxTips = [foodOrder.totalPrice doubleValue] - 2 - totalFoodPrice;
    
    self.foodTotal.text = [NSString stringWithFormat:@"$ %.2lf", totalFoodPrice];
    self.taxtips.text = [NSString stringWithFormat:@"$ %.2lf", taxTips];
    self.total.text = [NSString stringWithFormat:@"$ %.2lf", [foodOrder.totalPrice doubleValue]];
    // Do any additional setup after loading the view.
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
    return [self.foodOrder.orders count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    if([self.foodOrder.orders count] > 0 && [self.foodOrder.orders count] > indexPath.row){
        OrderItem *oi = (OrderItem *)[self.foodOrder.orders objectAtIndex:indexPath.row];
        
        //set text label
        cell.textLabel.text = [NSString stringWithFormat:@"%@, price: %@", oi.dish.name, [oi.dish.price stringValue]];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Quantity: %@", oi.quantity];
        
        //get image
        NSString *realUrl = [NSString stringWithFormat:@"http://localhost:8080/finalProject/dishes/%@/photo", [oi.dish.identity stringValue]];
        NSURL *url = [NSURL URLWithString:
                      realUrl];
        UIImage *theImage = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
        cell.imageView.image = theImage;
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return cell;
}


@end
