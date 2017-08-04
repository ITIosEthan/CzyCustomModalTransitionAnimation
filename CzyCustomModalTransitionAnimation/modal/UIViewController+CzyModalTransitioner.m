//
//  UIViewController+CzyModalTransitioner.m
//  CzyCustomModalTransitionAnimation
//
//  Created by macOfEthan on 17/8/4.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "UIViewController+CzyModalTransitioner.h"

@implementation UIViewController (CzyModalTransitioner)

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [CzyModalTransitioner initWithModalTransitionType:CzyModalTransitionStylePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [CzyModalTransitioner initWithModalTransitionType:CzyModalTransitionStyleDismiss];
}


@end
