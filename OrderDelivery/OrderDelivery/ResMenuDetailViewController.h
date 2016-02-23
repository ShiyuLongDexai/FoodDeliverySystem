//
//  ResMenuDetailViewController.h
//  OrderDelivery
//
//  Created by long long on 15/4/29.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dish.h"


@interface ResMenuDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UILabel *disc;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *pickerArray;
@property (nonatomic, retain) Dish* dish;
@property (strong, nonatomic) NSString *resName;
@property (weak, nonatomic) IBOutlet UIButton *addToCart;

@end
