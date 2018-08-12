//
//  TipCalculatorViewController.m
//  TipCalculator
//
//  Created by Wiljay Flores on 2018-08-10.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "TipCalculatorViewController.h"

@interface TipCalculatorViewController () <UITextFieldDelegate>

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *billAmountLabel;
@property (nonatomic) UILabel *tipPercentLabel;
@property (nonatomic) UILabel *tipLabel;
@property (nonatomic) UIButton *calculate;
@property (nonatomic) UITextField *billAmountTextField;
@property (nonatomic) UITextField *tipPercentTextField;
@property (nonatomic) float tip;

@end

@implementation TipCalculatorViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tip = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.667 green:0.498 blue:0.741 alpha:1.0];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.text = @"Tip Calculator";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel setFont:[UIFont fontWithName:@"Futura" size:50]];
    [self.view addSubview:self.titleLabel];
    
    [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:380].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:20].active = YES;
    
    _billAmountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.billAmountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.billAmountLabel.text = @"Bill Amount: ";
    self.billAmountLabel.textAlignment = NSTextAlignmentRight;
    [self.billAmountLabel setFont:[UIFont fontWithName:@"Futura" size:25]];
    [self.view addSubview:self.billAmountLabel];
    
    [NSLayoutConstraint constraintWithItem:self.billAmountLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.billAmountLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.billAmountLabel attribute:NSLayoutAttributeLeftMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeftMargin multiplier:1.0 constant:20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.billAmountLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.50 constant:0].active = YES;
    
    
    _billAmountTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.billAmountTextField.backgroundColor = [UIColor whiteColor];
    self.billAmountTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.billAmountTextField.delegate = self;
    self.billAmountTextField.layer.cornerRadius = 5;
    self.billAmountTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.billAmountTextField];
    
    [NSLayoutConstraint constraintWithItem:self.billAmountTextField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.billAmountTextField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.billAmountTextField attribute:NSLayoutAttributeRightMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRightMargin multiplier:1.0 constant:-30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.billAmountTextField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.50 constant:0].active = YES;
    
    _tipPercentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.tipPercentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.tipPercentLabel.text = @"Tip Percent: ";
    self.tipPercentLabel.textAlignment = NSTextAlignmentRight;
    [self.tipPercentLabel setFont:[UIFont fontWithName:@"Futura" size:25]];
    [self.view addSubview:self.tipPercentLabel];
    
    [NSLayoutConstraint constraintWithItem:self.tipPercentLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.tipPercentLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.tipPercentLabel attribute:NSLayoutAttributeLeftMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeftMargin multiplier:1.0 constant:20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.tipPercentLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.75 constant:0].active = YES;
    
    
    _tipPercentTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.tipPercentTextField.backgroundColor = [UIColor whiteColor];
    self.tipPercentTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.tipPercentTextField.delegate = self;
    self.tipPercentTextField.layer.cornerRadius = 5;
    self.tipPercentTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.tipPercentTextField];
    
    [NSLayoutConstraint constraintWithItem:self.tipPercentTextField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.tipPercentTextField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.tipPercentTextField attribute:NSLayoutAttributeRightMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRightMargin multiplier:1.0 constant:-30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.tipPercentTextField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.75 constant:0].active = YES;
    
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.tipLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.tipLabel.text = [NSString stringWithFormat:@"Tip Amount: $%.2f",self.tip];
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    [self.tipLabel setFont:[UIFont fontWithName:@"Futura" size:30]];
    [self.view addSubview:self.tipLabel];
    
    [NSLayoutConstraint constraintWithItem:self.tipLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.tipLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:380].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.tipLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.tipLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = YES;
    
    _calculate = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.calculate addTarget:self action:@selector(calculateTip:) forControlEvents:UIControlEventTouchUpInside];
    self.calculate.translatesAutoresizingMaskIntoConstraints = NO;
    self.calculate.layer.cornerRadius = 5;
    [self.calculate setTitle: @"Calculate" forState:UIControlStateNormal];
    self.calculate.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.calculate];
    
    [NSLayoutConstraint constraintWithItem:self.calculate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.calculate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:90].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.calculate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.calculate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.20 constant:0.0].active = YES;
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calculateTip:(UIButton*)sender{
    self.tip = [self.billAmountTextField.text intValue] * [self.tipPercentTextField.text floatValue]/100;
    self.tipLabel.text = [NSString stringWithFormat:@"Tip Amount: $%.2f",self.tip];
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
