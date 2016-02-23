//
//  ResMenuDetailViewController.m
//  OrderDelivery
//
//  Created by long long on 15/4/29.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import "ResMenuDetailViewController.h"
#import "ShoppingCartTableViewController.h"
#import "MenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "OrderItem.h"

@interface ResMenuDetailViewController ()

@end

@implementation ResMenuDetailViewController
@synthesize dish, view1, name, type, disc, image, price, resName;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = dish.name;
    self.type.text = dish.category;
    self.price.text = [NSString stringWithFormat:@"$ %@", [dish.price stringValue] ];
    self.disc.text = [NSString stringWithFormat:@"%@", dish.disc];
    
    NSString *realUrl = [NSString stringWithFormat:@"http://localhost:8080/finalProject/dishes/%@/photo", [dish.identity stringValue]];
    NSURL *url = [NSURL URLWithString:
                  realUrl];
    UIImage *theImage = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
    self.image.image = theImage;
    
    self.image.layer.masksToBounds = YES;
    self.image.layer.cornerRadius = 5.0;
    
    self.view1.layer.borderColor = [UIColor blackColor].CGColor;
    self.view1.layer.borderWidth = 3.0f;
    
    //init the picker
    self.pickerArray  = [[NSArray alloc] initWithObjects:@"0", @"1", @"2",@"3",@"4",@"5", nil];
   
    self.picker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    [self attachPickerToTextField:self.textField :self.picker];
    
    [self.textField addTarget:self action:@selector(textFieldDidChange1:)
        forControlEvents:UIControlEventEditingChanged];
}

-(IBAction)textFieldDidChange1:(UISegmentedControl *)SControl
{
    double total = [self.textField.text doubleValue] * [dish.price doubleValue];
    self.totalPrice.text = [NSString stringWithFormat:@"$ %.2lf", total];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)attachPickerToTextField: (UITextField*) textField :(UIPickerView*) picker{
    picker.delegate = self;
    picker.dataSource = self;
    
    textField.delegate = self;
    textField.inputView = picker;
    
}

-(IBAction)addFood:(id) sender{
    MenuViewController *cusmenuVC = (MenuViewController *) self.slidingViewController.underLeftViewController;
    FoodOrder *cart = cusmenuVC.cart;
    OrderItem *oi = [[OrderItem alloc]init];
    oi.dish = self.dish;
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    if(!self.textField.text||self.textField.text.length == 0||[self.textField.text isEqualToString:@"0"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error!" message:@"invalid quantity" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    oi.quantity =  [f numberFromString:self.textField.text];
//    oi.foodOrder = cart;
    
    //check if order from only one res
    if(cart.resName){
        if(![self.resName isEqualToString:cart.resName]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"success!" message:@"Only allow to order from one restaurant." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }
    } else {
    cart.resName = self.resName;
    }
    
    [cart.orders addObject:oi];
    
    [self.navigationController popViewControllerAnimated:YES];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"food add to cart." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}


#pragma mark - Keyboard delegate stuff

// let tapping on the background (off the input field) close the thing
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
}

#pragma mark - Picker delegate stuff

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.picker){
        return self.pickerArray.count;
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    if (pickerView == self.picker){
        return [self.pickerArray objectAtIndex:row];
    }
    
    return @"???";
    
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    if (pickerView == self.picker){
        self.textField.text = [self.pickerArray objectAtIndex:row];
        double total = [self.textField.text doubleValue] * [dish.price doubleValue];
        self.totalPrice.text = [NSString stringWithFormat:@"$ %.2lf", total];
    }
}

@end
