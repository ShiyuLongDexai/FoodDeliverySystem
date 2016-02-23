//
//  LoginViewController.h
//  OrderDelivery
//
//  Created by long long on 15/4/27.
//  Copyright (c) 2015年 long long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UISegmentedControl *role;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *newuser;

@end
