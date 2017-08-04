//
//  CzyModalTransitioner.m
//  CzyCustomModalTransitionAnimation
//
//  Created by macOfEthan on 17/8/4.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "CzyModalTransitioner.h"

@interface CzyModalTransitioner ()

@property (nonatomic, assign) CzyModalTransitionStyle type;

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation CzyModalTransitioner

#pragma mark - init
+ (instancetype)initWithModalTransitionType:(CzyModalTransitionStyle)type
{
    return [[self alloc] initWithModalTransitionType:type];
}

- (instancetype)initWithModalTransitionType:(CzyModalTransitionStyle)type
{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    
    if (self.type == CzyModalTransitionStylePresent) {
        
        [self showTransitionAnimationWithTransitionContext:transitionContext];
    }else{
        [self dismissTransitionAnimationWithTransitionContext:transitionContext];
    }
}

#pragma mark - show
- (void)showTransitionAnimationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toVc.view.frame = CGRectMake(0, fromVc.view.frame.size.height, [UIScreen mainScreen].bounds.size.width, 300);
    
    //添加present的视图
    [[transitionContext containerView] addSubview:toVc.view];
    
    //3D动画 默认矩阵
    CATransform3D a1 = CATransform3DIdentity;
    
    //调整M34， 向内部偏移900
//    a1.m34 = -1.0/900;
//    a1 = CATransform3DRotate(a1, 0.2*M_PI, 1, 0, 0);
    //放大或者缩小
    a1 = CATransform3DScale(a1, 0.8, 0.8, 1.0);
    //上移100单位
    a1 = CATransform3DTranslate(a1, 0, -50, 0);
    
    
    [UIView animateWithDuration:0.3f animations:^{
        
        fromVc.view.layer.transform = a1;
        
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:0.3f animations:^{
                        
            CGRect frame = toVc.view.frame;
            frame.origin.y -= frame.size.height;
            toVc.view.frame = frame;
            
        } completion:^(BOOL finished) {
            
            //是否结束 结束才能打开交互
            [transitionContext completeTransition:YES];
        }];
    }];
    
}

#pragma mark - dismiss
- (void)dismissTransitionAnimationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        CGRect frame = toVc.view.frame;
        frame.origin.y += frame.size.height;
        fromVc.view.frame = frame;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3f animations:^{
            
            toVc.view.layer.transform = CATransform3DIdentity;
            
            toVc.view.alpha = 1.0;
            
        } completion:^(BOOL finished) {
           
            [transitionContext completeTransition:YES];
        }];
    }];
}

@end
