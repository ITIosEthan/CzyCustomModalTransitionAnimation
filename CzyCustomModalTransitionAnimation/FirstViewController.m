//
//  FirstViewController.m
//  CzyCustomModalTransitionAnimation
//
//  Created by macOfEthan on 17/8/4.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "FirstViewController.h"
#import "UIViewController+CzyModalTransitioner.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    secondVc.transitioningDelegate = self;
    //设置为modalPresentationStyle = UIModalPresentationCustom present之后不会消失
    secondVc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:secondVc animated:YES completion:nil];
}


@end
