//
//  TipCalculatorViewController.m
//  TipCalculator
//
//  Created by Wiljay Flores on 2018-08-10.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "TipCalculatorViewController.h"

@interface TipCalculatorViewController () <UITextFieldDelegate>

@property (nonatomic) UITextField *billAmountTextField;

@end

@implementation TipCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.667 green:0.498 blue:0.741 alpha:1.0];
    
    _billAmountTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.billAmountTextField.backgroundColor = [UIColor whiteColor];
    self.billAmountTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.billAmountTextField.delegate = self;
    self.billAmountTextField.layer.cornerRadius = 5;
    self.billAmountTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.billAmountTextField];
    
    [NSLayoutConstraint constraintWithItem:self.billAmountTextField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.billAmountTextField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.billAmountTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.billAmountTextField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = YES;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
