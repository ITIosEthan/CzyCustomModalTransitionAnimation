//
//  SecondViewController.m
//  CzyCustomModalTransitionAnimation
//
//  Created by macOfEthan on 17/8/4.
//  Copyright © 2017年 macOfEthan. All rights reserved.

#import "SecondViewController.h"

@interface SecondViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor brownColor];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end

